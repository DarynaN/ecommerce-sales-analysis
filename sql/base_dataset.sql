WITH base_dataset AS (
  SELECT
    s.date,
    s.ga_session_id,

    -- geo & device
    sp.continent,
    sp.country,
    sp.device,
    sp.browser,
    sp.mobile_model_name,
    sp.operating_system,
    sp.language,

    -- normalized traffic source
    CASE
      WHEN sp.medium = 'organic' THEN 'Organic Search'
      WHEN sp.medium = 'cpc' THEN 'Paid Search'
      WHEN sp.medium = 'referral' THEN 'Referral'
      WHEN sp.medium = '(none)' AND sp.name = '(direct)' THEN 'Direct'
      WHEN sp.medium = '<Other>' THEN 'Other'
      WHEN sp.medium = '(data deleted)' THEN 'Data Removed'
      ELSE 'Unknown'
    END AS traffic_source,

    -- raw channel
    sp.channel,

    -- user info (nullable)
    acc.account_id AS registered_user_id,
    a.is_verified,
    a.is_unsubscribed,

    -- product & revenue
    p.category,
    p.name AS product_name,
    p.price,
    p.short_description

  FROM `DA.session` s
  LEFT JOIN `DA.order` o
    ON s.ga_session_id = o.ga_session_id
  LEFT JOIN `DA.product` p
    ON o.item_id = p.item_id
  LEFT JOIN `DA.session_params` sp
    ON s.ga_session_id = sp.ga_session_id
  LEFT JOIN `DA.account_session` acc
    ON s.ga_session_id = acc.ga_session_id
  LEFT JOIN `DA.account` a
    ON acc.account_id = a.id
)

-- ===============================
-- 2. FILTERED DATA
-- ===============================


  SELECT *
  FROM base_dataset
  WHERE price IS NOT NULL
    AND price > 0
