## Anomaly Analysis

### Insert Anomaly
In `orders_flat.csv`, product information (columns F: product_id, G: product_name,
H: category, I: unit_price) is stored only within order rows. It is impossible to
add a new product to the system without first creating an order. For example, a new
product "P009 - Printer" cannot be recorded unless a dummy order is created with a
fake order_id, customer_id, order_date, and sales_rep_id. The same problem applies
to adding a new customer (columns B, C, D, E) or a new sales representative
(columns L, M, N, O) without an associated order.

### Update Anomaly
Sales representative details are repeated across every order row they handle.
SR01 Deepak Joshi's office_address (column O) appears in 14 rows. Due to this
redundancy, the address has already become inconsistent in the dataset:
rows ORD1180, ORD1170, ORD1172, ORD1173, ORD1174, ORD1175, ORD1176, ORD1177,
ORD1178, ORD1179, ORD1181, ORD1182, ORD1183, ORD1184 show "Nariman Pt" while
other rows show "Nariman Point" for the same office. Updating a sales rep's address
requires finding and changing every row they appear in — missing even one creates
a data inconsistency.

### Delete Anomaly
Sales representative data exists only as part of order records. If all orders
managed by SR03 Ravi Kumar (columns L, M, N, O) are deleted — for example,
ORD1037, ORD1075, ORD1026, ORD1029, ORD1032 — the entire record of Ravi Kumar
including his name, email (ravi@corp.com), and office address is permanently lost.
No standalone sales rep record exists. The same applies to customers and products:
deleting all orders for customer C007 Arjun Nair removes all trace of that customer
from the system.

## Normalization Justification

The argument that keeping everything in one table is simpler is a
short-sighted view that ignores the serious data integrity problems
that emerge as data grows. Using the orders_flat.csv as evidence,
I strongly refute this position.

First, the flat file demonstrated a clear **update anomaly**.
Sales representative Deepak Joshi's office address appeared in
14 rows. In the actual dataset, this redundancy had already caused
inconsistency — some rows showed "Nariman Point" while others showed
"Nariman Pt" for the exact same address. After normalization, this
address is stored in exactly 1 row in the sales_rep table. Any future
update requires changing exactly one record, guaranteeing consistency.

Second, the flat file suffered from an **insert anomaly**.
It was impossible to add a new product such as "P009 - Printer"
without creating a dummy order with fabricated customer and sales rep
data. This pollutes the database with fabricated placeholder data.
After normalization, products, customers and sales reps each have
their own independent tables and can be added freely.

Third, a **delete anomaly** existed where deleting all orders handled
by SR03 Ravi Kumar would permanently erase his name, email and office
details from the entire system. Normalization eliminates this risk by
storing each entity — customers, products and sales representatives —
in independent tables.

The manager's "simplicity" argument only holds for very small, static
datasets. In a real retail system with thousands of orders, a single
flat table leads to excessive redundant storage, inconsistent data,
and costly maintenance. Normalization is not over-engineering —
it is the foundation of reliable data management.
