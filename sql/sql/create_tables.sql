CREATE DATABASE IF NOT EXISTS customer_health_analytics;

USE customer_health_analytics;

CREATE TABLE accounts (
customer_id VARCHAR(10),
company_name VARCHAR(100),
industry VARCHAR(50),
region VARCHAR(50),
employee_size INT,
annual_revenue_usd BIGINT,
customer_since DATE,
customer_tier VARCHAR(20)
);

CREATE TABLE opportunities (
opportunity_id VARCHAR(10),
customer_id VARCHAR(10),
product_name VARCHAR(100),
deal_value_usd INT,
stage VARCHAR(50),
sales_rep VARCHAR(50),
close_date DATE
);

CREATE TABLE usage (
customer_id VARCHAR(10),
monthly_logins INT,
active_users INT,
feature_usage_score INT
);

CREATE TABLE support_tickets (
customer_id VARCHAR(10),
ticket_count INT,
avg_resolution_days DECIMAL(5,2)
);

CREATE TABLE renewals (
customer_id VARCHAR(10),
renewal_status VARCHAR(20),
renewal_date DATE,
contract_value_usd INT
);
