source("renv/activate.R")

options(renv.config.auto.snapshot = TRUE)
options(renv.config.autoloader.enabled = TRUE)
options(renv.config.pak.enabled = TRUE)
options(
  repos = c(
    CRAN = sprintf(
      "https://p3m.dev/cran/2025-10-11/bin/linux/manylinux_2_28-%s/%s",
      R.version["arch"],
      substr(getRversion(), 1, 3)
    )
  )
)
