# Customer Feedback System

## Description
The **Customer Feedback System** is a SQL project designed to manage customer feedback. It allows businesses to collect and analyze feedback on orders, products, and services. This system connects seamlessly with the existing sales and customer management databases.

## Features
- **Feedbacks Table**: Stores customer feedback details, including ratings and comments.
- **Feedback Types Table**: Categorizes feedback (e.g., product quality, delivery service, customer support).
- **Queries**:
  - List all feedbacks with customer and order details.
  - Calculate average ratings for each feedback type.
  - Identify feedbacks with low ratings (1 or 2).
  - Count the number of feedbacks per customer.

## How to Use
1. **Set Up the Database**:
   - Use MySQL or a compatible DBMS.
   - Run the `customer_feedback.sql` script to create the database and populate it with sample data.

2. **Analyze Feedback Data**:
   - Use the provided queries to understand customer satisfaction, identify areas for improvement, and prioritize actions.

3. **Integration**:
   - Designed to integrate with `customer_orders` and `sales_management` systems.

## SQL Highlights
- **Data Validation** using `CHECK` constraints for ratings.
- **Relational Integrity** with foreign keys linking to customers, orders, and feedback types.
- **Aggregations** for advanced feedback analysis.

## License
This project is licensed under the MIT License.

## Author
[Your Name]
