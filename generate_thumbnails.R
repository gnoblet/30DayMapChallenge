# Generate thumbnails for all day maps
# Keeps proportions while scaling to standard dimensions
library(magick)

# Configuration
thumbnail_width <- 500
thumbnail_height <- 200

# Find all year directories (e.g., 2025, 2026, etc.)
year_dirs <- list.dirs(".", full.names = FALSE, recursive = FALSE)
year_dirs <- year_dirs[grepl("^\\d{4}$", year_dirs)]

if (length(year_dirs) == 0) {
  stop("No year directories found (e.g., 2025, 2026)")
}

cat(
  "Found",
  length(year_dirs),
  "year folder(s):",
  paste(year_dirs, collapse = ", "),
  "\n\n"
)

# Process each year
for (year in year_dirs) {
  cat("Processing year:", year, "\n")

  # Get all day directories for this year
  days_dir <- file.path(year)
  day_folders <- list.dirs(days_dir, full.names = TRUE, recursive = FALSE)
  day_folders <- day_folders[grepl("day_\\d+", basename(day_folders))]

  # Sort by day number
  day_folders <- day_folders[order(as.numeric(gsub(
    "day_",
    "",
    basename(day_folders)
  )))]

  if (length(day_folders) == 0) {
    cat("  No day folders found in", year, "\n\n")
    next
  }

  cat("  Found", length(day_folders), "day folders\n")

  # Process each day
  for (day_folder in day_folders) {
    day_name <- basename(day_folder)

    # Look for the main day image (e.g., day_01.png)
    image_file <- file.path(day_folder, paste0(day_name, ".png"))

    if (file.exists(image_file)) {
      cat("  Processing", day_name, "...\n")

      # Read the image
      image <- image_read(image_file)

      # Scale image preserving aspect ratio
      image <- image_scale(
        image,
        geometry = geometry_size_pixels(
          width = thumbnail_width,
          preserve_aspect = TRUE
        )
      )

      # Write thumbnail
      thumbnail_file <- file.path(day_folder, paste0(day_name, "_thumb.png"))
      image_write(image, thumbnail_file, format = "png")

      cat("    ✓ Created thumbnail:", thumbnail_file, "\n")
    } else {
      cat("    ✗ Image not found:", image_file, "\n")
    }
  }

  cat("\n")
}

cat("✨ Thumbnail generation complete!\n")
