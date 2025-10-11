# 30DayMapChallenge

[![Quarto Publish](https://github.com/gnoblet/30DayMapChallenge/actions/workflows/quarto-publish.yml/badge.svg)](https://github.com/gnoblet/30DayMapChallenge/actions/workflows/quarto-publish.yml)

## About
This repository contains my submissions for the #30DayMapChallenge, a community-driven data visualization challenge that runs every April. Participants create one map per day based on a set of prompts organized into different categories.

## Website
The Maps are published as a [Quarto website](https://quarto.org/) using GitHub Pages. You can view the website [here](#).

## Structure
- `2025/`: Contains the individual Quarto documents for each day's map
- `data/`: Contains datasets used for the visualizations if needed (not included in the git repository)
- `images/`: Contains static images and resources
- `.github/workflows/`: Contains the GitHub Actions workflow for automatic deployment

## Local Development

### Prerequisites
- [Quarto](https://quarto.org/docs/get-started/)
- [R](https://www.r-project.org/) with required packages
- [Python](https://www.python.org/) with required packages

### Setup
1. Clone this repository
2. Install R dependencies:
   ```r
   install.packages(c("rmarkdown", "knitr", "ggplot2", "data.table", "sf", "patchwork", "ggtext", "waffle", "forcats"))
   ```
3. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```

### Building Locally
To preview the website locally, run:
```bash
quarto preview
```

## Deployment
The website is automatically built and deployed to GitHub Pages when changes are pushed to the main branch. The GitHub Actions workflow handles the installation of dependencies and building of the Quarto website.

## License
The code in this repository is available under the [MIT License](LICENSE).
