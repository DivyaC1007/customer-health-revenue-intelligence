SELECT
    SUM(a.annual_revenue_usd) AS revenue_at_risk

FROM accounts a

LEFT JOIN product_usage pu
    ON a.customer_id = pu.customer_id

LEFT JOIN support_tickets st
    ON a.customer_id = st.customer_id

LEFT JOIN renewals r
    ON a.customer_id = r.customer_id

WHERE
    pu.feature_usage_score < 30
    AND st.ticket_count > 10
    AND r.renewal_status <> 'Renewed';
