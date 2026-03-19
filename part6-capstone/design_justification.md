## Storage Systems

### MongoDB — Goal 4 (Real-time ICU Vitals)
MongoDB was chosen for streaming ICU vitals because ICU
monitoring devices do not produce data in a fixed schema
— different devices send different readings such as BP,
SpO2, and pulse rate in varying formats. MongoDB's
flexible document model accommodates any structure and
handles the high-frequency writes required for real-time
patient monitoring.

### MySQL — OLTP Layer
MySQL manages all transactional patient data including
payments, admissions, and medical procedures. Its ACID
compliance ensures that no partial updates occur — a
prescription is either fully saved or fully rolled back,
preventing incorrect medication records. This makes it
the reliable source of truth for all patient transactions.

### Vector DB — Goal 2 (Semantic Search)
A Vector DB was chosen over traditional SQL search because
doctors query patient history in plain English. A SQL LIKE
query would fail if the doctor asks "full history of
medication" but the record uses different terminology.
The Vector DB converts the query into a numerical embedding
and retrieves semantically similar records regardless of
exact wording.

### Data Warehouse — Goals 1 & 3
The Data Warehouse stores cleaned, transformed data in a
star schema optimised for aggregation queries such as
monthly bed occupancy and department-wise costs. It powers
both the ML readmission model by providing structured
historical training data and the BI dashboard by enabling
fast analytical reporting.

## OLTP vs OLAP Boundary

The transactional system ends at MySQL — this layer handles
day-to-day operations such as patient admissions,
prescriptions, and billing. Each transaction must be ACID
compliant — ensuring every operation is atomic, consistent,
isolated and durable.

The analytical system begins at the Data Warehouse. An ETL
pipeline moves cleaned and transformed data from MySQL into
the Data Warehouse on a weekly schedule. This boundary is
critical because running analytical queries directly on the
OLTP system would degrade its performance and disrupt
real-time patient transaction processing — the most
mission-critical part of the hospital system.

## Trade-offs

### Challenge — Multi-system Complexity
The most significant trade-off in this design is operational
complexity. Managing four different database systems —
MongoDB, MySQL, Vector DB, and a Data Warehouse — requires
deep expertise across the team. Each system has its own
query language, maintenance needs, and failure modes,
increasing the risk of integration errors.

### Mitigation Strategy
This can be mitigated by:
1. Hiring a cross-functional data engineering team with
   dedicated experience in each system
2. Implementing a unified monitoring tool such as Grafana
   to observe performance and health across all systems
   from one place
3. Establishing clear data ownership — the data engineering
   team owns MongoDB and MySQL, the analytics team owns
   the Data Warehouse, and the AI team owns the Vector DB