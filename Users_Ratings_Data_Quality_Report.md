# Users & Ratings Datasets — Exploration and Data Quality Report

**Date:** 19 June 2026
**Prepared for:** Product Owner
**Prepared by:** Data Analytics Team
**Files reviewed:** `Users.csv`, `Ratings_Dataset.csv` (received 19 June 2026)

---

## 1. Structure and Contents

| Dataset | Rows | Columns |
|---|---|---|
| `Users.csv` | 6,040 | UserID, Age, Gender, Country, SubscriptionStatus, TotalWatchTime, Device |
| `Ratings_Dataset.csv` | 10,000 | RatingID, UserID, MovieID, Rating, Timestamp |
| `Movies.csv` (reference, already cleaned) | 3,883 | MovieID, Title, Year, Genres, Language, Country, Total Views |

## 2. Primary Keys and Relationships

- **Users.csv** — `UserID` is the primary key (format `SF_1`, `SF_2`, ...), unique across all 6,040 rows.
- **Ratings_Dataset.csv** — `RatingID` is the primary key, unique across all 10,000 rows. `UserID` and `MovieID` are foreign keys referencing `Users.csv` and `Movies.csv` respectively.
- **Movies.csv** — `MovieID` is the primary key (already established in Sprint 1 cleaning).

**Relationship type:** This forms a classic star schema — `Ratings` is the fact table at the center, with `Users` and `Movies` as dimension tables.

```
Users (1) ──< Ratings >── (1) Movies
```

**Referential integrity check (completed):**
- ✅ All `UserID` values in Ratings exist in Users.csv — 0 orphaned references.
- ✅ All `MovieID` values in Ratings exist in Movies.csv — 0 orphaned references.
- ℹ️ 1,125 users (18.6%) have never submitted a rating — expected for Free-tier or new accounts.
- ℹ️ 295 movies (7.6%) have never been rated.

## 3. Data Quality Assessment

### Users.csv
| Check | Result |
|---|---|
| Missing values (all columns) | 0 |
| Duplicate UserIDs | 0 |
| Age range | 9–65 |
| Gender values | M (4,331), F (1,709) — no other/missing |
| SubscriptionStatus values | Free (3,084), Subscriber (2,956) |
| Device values | Mobile, Smart TV, Desktop, Tablet — evenly distributed (~1,500 each) |
| TotalWatchTime range | 10–500, no negative values |

**Flag for review:** 411 users (6.8%) are under age 13. This may be expected if the platform serves family/children's content (consistent with "Children's" genre tags in Movies.csv), but should be confirmed with the client — particularly relevant for data handling policy (e.g. COPPA-style considerations) and for how age-based segmentation is presented in the dashboard.

### Ratings_Dataset.csv
| Check | Result |
|---|---|
| Missing values (all columns) | 0 |
| Duplicate RatingIDs | 0 |
| Rating value range | 1.0–5.0 (within expected bounds) |
| Date range | 13 Dec 2023 – 12 Dec 2024 (12 months) |
| Duplicate (UserID + MovieID) pairs | 2 |

**Flag for review:** 2 user/movie pairs have been rated twice, with different scores and timestamps (e.g. user `SF_1680` rated movie `824` as 3.0 on 11 Jan 2024 and 3.9 on 9 Dec 2024). Recommendation: treat this as the user updating their opinion, and use the **most recent rating by Timestamp** as the authoritative value for analysis. To be confirmed with Product Owner before schema finalization.

## 4. Key Observations and Assumptions

1. The user base spans ages 9–65, suggesting the platform serves a broad, family-inclusive audience — consistent with the genre mix already seen in Movies.csv.
2. `UserID` follows a consistent `SF_` prefix convention (Streamflix) with sequential numbering; no irregularities detected.
3. Repeated ratings are assumed to represent a user revising their opinion over time, not a data error. We recommend resolving these by keeping only the latest timestamp per (UserID, MovieID) pair for reporting purposes, while retaining the full history in the raw table.
4. Roughly half of registered users (3,084 of 6,040) are on the Free tier, which may be relevant context for the subscription-tier segmentation requested in the original brief.

## 5. Recommendations for Schema Design

- Adopt a **star schema**: `Ratings` as the fact table, `Users` and `Movies` as dimension tables, joined via `UserID` and `MovieID`.
- Before building the Power BI model, decide and document a rule for handling the 2 duplicate rating pairs (recommended: keep latest by Timestamp).
- Confirm with the Product Owner whether users under 13 should be included in age-based segment reporting, or treated as a separate cohort.
- No further cleaning is required on `Ratings_Dataset.csv` beyond the duplicate-pair resolution — the file is otherwise complete and consistent.
- No further cleaning is required on `Users.csv` — no missing values, no invalid categorical values, no negative numeric values.

---

*Next step: pending Product Owner confirmation on the two flagged items, the team will finalize the relational schema and proceed to data modeling in Power BI.*
