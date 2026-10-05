{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='host_id',
        on_schema_change='sync_all_columns'
    )
}}

SELECT
    host_id,
    host_name,
    is_superhost,
    created_at,
    updated_at,
FROM {{ ref('src_hosts') }}