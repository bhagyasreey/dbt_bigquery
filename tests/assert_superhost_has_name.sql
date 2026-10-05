SELECT
    host_id,
    host_name,
    is_superhost
FROM {{ ref('src_hosts') }}
WHERE is_superhost = TRUE
  AND (
      host_name IS NULL
      OR TRIM(host_name) = ''
  )