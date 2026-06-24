# Streamflix Movies Analytics

A data analytics project for the Streamflix platform. The repository contains cleaned movie datasets, data quality checks, database loading code, SQL support scripts, and visualization notebooks.

## Project Overview

This project prepares movie data for analytics and reporting. The main focus is:

- cleaning and validating the movie dataset
- documenting data issues and fixes
- loading cleaned data into a local MySQL database
- providing analysis and visualization notebooks
- preserving project documentation and schema artifacts

## What’s Included

- `data/` – CSV datasets and cleaned data files
- `python_scripts/` – Jupyter notebooks for data cleaning, loading, and visualization
- `sql_scripts/` – SQL files for creating tables, checking relationships, and updating data
- `Doc/` – project documentation and client-facing templates
- `ERD_schema/` – entity relationship diagram for the movie data model
- `Excel/` – source and cleaned spreadsheet files
- `tasks/` – project task screenshots and progress tracking

## Notes on Running the Project

- Use Jupyter or VS Code Notebook to open and run notebooks in `python_scripts/`.
- The database connection in `python_scripts/load_data.ipynb` currently uses a placeholder password.
- Replace `your_password` with the correct local MySQL password before running the notebook, or refactor the notebook to load credentials from an environment variable.

## How to Run

1. Open the project folder in VS Code or Jupyter.
2. Launch the notebook server or open the desired notebook from `python_scripts/`.
3. Run cells in the following order if you want to prepare and inspect the data:
   - `clean the data_movies.ipynb`
   - `data_check.ipynb`
   - `load_data.ipynb`
   - `Visualisation Requests by Client.ipynb`
4. If using MySQL, make sure MySQL is running locally and the connection details in `load_data.ipynb` match your local setup.

## Key Files

- `python_scripts/load_data.ipynb` — loads cleaned data into MySQL
- `python_scripts/data_check.ipynb` — checks datasets for quality issues
- `python_scripts/clean the data_movies.ipynb` — performs movie dataset cleaning steps
- `python_scripts/Visualisation Requests by Client.ipynb` — visualization and analysis work
- `sql_scripts/create_tables.sql` — database table creation script
- `sql_scripts/Checking the relationships.sql` — verifies table relationships
- `sql_scripts/update_table.sql` — sample update script for existing data

## Repository Structure

```text
streamflix-analytics/
  data/              # CSV data files and cleaned outputs
  python_scripts/    # Jupyter notebooks for cleaning, loading, visualizing
  sql_scripts/       # SQL schema and validation scripts
  Doc/               # project documentation and reports
  ERD_schema/        # database schema diagrams
  Excel/             # spreadsheet source files and exports
  tasks/             # task screenshots and progress notes
  README.md          # project overview and usage notes
  .gitignore         # ignored local files and temporary artifacts
```

## Current Status

- Data cleaning and validation are completed for the current Movie dataset.
- The cleaned data and notebooks are available in the project.
- The repository is set up to work from `main` and push directly to `origin/main`.

## Best Practice

- Keep secrets out of source files.
- Do not commit real database passwords.
- Use `.gitignore` for local environment files and notebook checkpoints.
