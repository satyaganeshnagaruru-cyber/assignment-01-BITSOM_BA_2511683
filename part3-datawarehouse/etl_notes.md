## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw data contained three inconsistent date formats:
DD/MM/YYYY (e.g. TXN5000: 29/08/2023), DD-MM-YYYY (e.g. TXN5001:
12-12-2023), and YYYY-MM-DD (e.g. TXN5002: 2023-02-05). This
inconsistency makes date comparisons and sorting unreliable.

Resolution: All dates were standardized to YYYY-MM-DD format before
loading. Additionally, each date was decomposed into separate columns
(day, month, month_name, quarter, year) in dim_date to enable
flexible time-based analytical queries without string manipulation.

### Decision 2 — Resolving NULL Store Cities
Problem: Several transactions had missing store_city values including
TXN5033 (Mumbai Central), TXN5044 (Chennai Anna), and TXN5082
(Delhi South). These NULL values would cause incomplete or incorrect
results in location-based queries.

Resolution: Since each store name always maps to exactly one city
(e.g. Mumbai Central → Mumbai, Delhi South → Delhi), NULL cities
were filled using this fixed store-city alignment. This mapping was
permanently enforced in dim_store where store_city is NOT NULL,
preventing future NULL entries.

### Decision 3 — Standardizing Category Casing
Problem: Product categories appeared in inconsistent formats across
the raw data. Electronics was written as both "Electronics" and
"electronics". Groceries appeared as both "Groceries" and "Grocery"
causing the same category to be treated as two different values.

Resolution: All categories were standardized to Title Case with
consistent naming: "Electronics", "Clothing", and "Groceries".
The corrected values were enforced in dim_product, ensuring all
future inserts follow the same standard automatically.