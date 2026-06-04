-- Customer Health Score Analysis
-- Purpose: Calculate a health score using product usage,
-- support activity and renewal behavior.


SELECT
    customer_id,
    company_name,
    customer_health_score
FROM (
    SELECT
        a.customer_id,
        a.company_name,

        (
            (pu.feature_usage_score * 0.5)
            +
            (pu.monthly_logins * 0.1)
            -
            (st.ticket_count * 2)
            +
            CASE
                WHEN r.renewal_status = 'Renewed' THEN 20
                WHEN r.renewal_status = 'Pending' THEN 10
                ELSE 0
            END
        ) AS customer_health_score

    FROM accounts a
    LEFT JOIN product_usage pu
        ON a.customer_id = pu.customer_id
    LEFT JOIN support_tickets st
        ON a.customer_id = st.customer_id
    LEFT JOIN renewals r
        ON a.customer_id = r.customer_id
) x
ORDER BY customer_health_score DESC
LIMIT 10;
