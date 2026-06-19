# Streamflix Movies Analytics

A data analytics project completed as part of a Skills Application Challenge (SAC), simulating a real-world consulting engagement for a streaming platform client ("Streamflix") preparing to relaunch its subscription service.

## Project Overview

The client needed insight into which movie genres and titles perform best across different audience segments (age, region, subscription tier), to support content strategy decisions for a platform relaunch. The deliverable is a Power BI dashboard built on a cleaned and validated movies dataset.

**Methodology:** Scrum / Agile, organized into 3 one-week sprints, with sprint planning, client demos, and retrospectives.

## My Role

- Performed data quality review and cleaning of the raw Movies.csv dataset
- Documented data issues and communicated findings to the product owner before proceeding with cleaning
- Applied client feedback to refine the dataset further

## Tools Used

- Excel - data cleaning and validation
- Jira - sprint backlog and task tracking
- Power BI - dashboard and visualizations
- Slack - team and client communication

## Data Cleaning Summary

Issues identified and corrected in Movies.csv:

| Issue | Fix |
|---|---|
| Title field combined name and year (e.g. "Toy Story (1995)") | Split into separate Title and Year columns |
| Missing year (marked "not_def") | Corrected using external lookup (e.g. Casino -> 1995) |
| Missing/blank title | Filled in (The Phantom of the Opera) |
| Genre separator inconsistency (-- instead of pipe) | Standardized to pipe-separated format |
| Misspelled genre values ("Dramatic", "Dramma") | Corrected to "Drama" |
| Encoding artifact in title with special characters | Manually corrected |

Full process documented in the data quality report shared with the client and tracked in Jira.

## Repository Structure

```
streamflix-analytics/
data/
  raw/          # Original dataset as provided by the client
  processed/    # Cleaned and validated dataset (movies_cleaned.csv)
dashboard/      # Power BI dashboard file / screenshots
README.md
```

## Status

In progress - Sprint 1 (data cleaning) complete. Power BI dashboard in development.

