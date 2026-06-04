SELECT
    a.customer_id,
    a.company_name,
    a.annual_revenue_usd,
    pu.monthly_logins,
    pu.feature_usage_score,
    st.ticket_count,
    r.renewal_status,

    CASE
        WHEN
            pu.feature_usage_score < 30
            AND st.ticket_count > 10
            AND r.renewal_status <> 'Renewed'
        THEN 'High Risk'

        WHEN
            pu.feature_usage_score < 60
            AND st.ticket_count > 5
        THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS churn_risk

FROM accounts a

LEFT JOIN product_usage pu
    ON a.customer_id = pu.customer_id

LEFT JOIN support_tickets st
    ON a.customer_id = st.customer_id

LEFT JOIN renewals r
    ON a.customer_id = r.customer_id

ORDER BY annual_revenue_usd DESC;
