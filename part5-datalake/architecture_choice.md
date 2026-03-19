## Architecture Recommendation

### Recommended Architecture: Data Lakehouse

For a fast-growing food delivery startup collecting diverse
data types, I recommend a **Data Lakehouse** architecture
over a pure Data Warehouse or Data Lake.

### Reason 1 — Diverse Data Types

The startup collects four fundamentally different data types:
- GPS location logs → Unstructured
- Customer text reviews → Unstructured
- Payment transactions → Structured
- Restaurant menu images → Unstructured

A Data Warehouse can only handle structured data, making it
unable to store GPS logs, reviews, or images. A Data Lakehouse
stores ALL formats in one unified platform.

### Reason 2 — Need for Both Storage and Analytics

Payment transactions require structured analytical queries
— monthly revenue, refund rates, peak hours. Meanwhile,
text reviews require unstructured processing like sentiment
analysis. A Data Lakehouse supports both SQL analytics AND
unstructured data processing without moving data between
separate systems.

### Reason 3 — Startup is Fast-Growing

A fast-growing startup cannot afford to redesign its storage
architecture every few months. A Data Lakehouse provides the
flexibility to add new data sources (e.g., voice orders,
video feeds) without restructuring the system. A rigid Data
Warehouse would require costly schema redesign every time
a new data type is introduced.

### Why Not Data Warehouse?

A pure Data Warehouse would fail to store GPS logs and menu
images as it only supports structured tabular data — leaving
75% of this startup's data with nowhere to go.

### Why Not Data Lake?

A pure Data Lake would not support structured SQL analytics
because it lacks built-in query capabilities needed for
payment transaction reporting and business intelligence.

### Conclusion

The Data Lakehouse is the ideal choice because it handles
both structured and unstructured data types, supports SQL
and AI-based analytics, and scales flexibly with the
startup's growth without requiring architectural redesign.