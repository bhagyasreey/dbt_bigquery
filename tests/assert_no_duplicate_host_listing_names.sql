SELECT
    host_id,
    name,
    COUNT(*) AS duplicate_count
FROM {{ ref('src_listings') }}
GROUP BY
    host_id,
    name
HAVING COUNT(*) > 1