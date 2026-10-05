{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='host_id',
        on_schema_change='append_new_columns'
    )
}}

SELECT
    host_id,
    host_name,
    is_superhost,
    CASE
        WHEN is_superhost THEN 'SUPERHOST'
        ELSE 'STANDARD'
    END AS host_status,
    created_at,
    updated_at,
    'TRAINING' AS test_column,
FROM {{ ref('src_hosts') }}

{% if is_incremental() %}
WHERE updated_at > (
    SELECT MAX(updated_at)
    FROM {{ this }}
)
{% endif %}