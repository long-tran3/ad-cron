#standardSQL
WITH

product_to_count_keywords AS (
SELECT
  product_id,
  COUNT(DISTINCT keyword) AS count_keywords
FROM `tiki-dwh.search_metrics_overall.queries_clicks_*`
WHERE
  _TABLE_SUFFIX BETWEEN "20200101" AND "20200520" AND
  clicks > 0
GROUP BY product_id
)

SELECT
  *
FROM product_to_count_keywords
WHERE
  count_keywords > 5
