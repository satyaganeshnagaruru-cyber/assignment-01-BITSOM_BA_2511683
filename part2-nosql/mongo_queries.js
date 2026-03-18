// OP1: insertMany() — insert all 3 documents from sample_documents.json
use ecommerce_db
db.products.insertMany([
    {
        "product_id": "P001",
        "name": "Lenovo Laptop",
        "category": "Electronics",
        "price": 100000,
        "model": { "brand": "Lenovo", "version": "IdeaPad 3" },
        "specs": { "voltage": "220V", "battery_life": "15 hours", "warranty_years": 3 },
        "colors_available": ["Silver", "Black", "Grey"],
        "in_stock": true
    },
    {
        "product_id": "P002",
        "name": "T-shirt",
        "category": "Clothing",
        "price": 500,
        "brand": "Zara",
        "attributes": { "material": "Cotton", "color": "Brown", "fit_type": "Oversized", "occasion": "Casual" },
        "sizes": { "available": ["S", "M", "L", "XL"], "measurements": { "width_cm": 34, "length_cm": 45 } },
        "in_stock": true
    },
    {
        "product_id": "P003",
        "name": "Eggs",
        "category": "Groceries",
        "price": 200,
        "brand": "Suguna",
        "weight_gms": 600,
        "expiry_date": "2026-10-20",
        "nutritional_info": { "calories_per_100g": 400, "carbs_g": 20, "protein_g": 36, "fat_g": 10, "fiber_g": 4 },
        "allergens": ["eggs", "dairy"],
        "in_stock": true
    }
]);

// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({ 
    category: "Electronics", 
    price: { $gt: 20000 } 
})

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({ 
    category: "Groceries", 
    expiry_date: { $lt: "2025-01-01" } 
})

// OP4: updateOne() — add discount_percent field to a specific product
db.products.updateOne(
    { product_id: "P002" },
    { $set: { discount_percent: 10 } }
)

// OP5: createIndex() — create an index on category field
// Reason: Indexing the category field improves query performance by
// allowing MongoDB to locate documents by category directly without
// performing a full collection scan. This is especially useful as
// the product catalog grows to thousands of documents.
db.products.createIndex({ category: 1 })