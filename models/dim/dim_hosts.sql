SELECT
    host_id,
    COALESCE(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM {{ ref('src_hosts') }}