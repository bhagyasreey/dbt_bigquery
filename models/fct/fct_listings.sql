{{ config(
    materialized='table',
    partition_by={
        'field': 'created_at',
        'data_type': 'timestamp',
        'granularity': 'day'
    },
    cluster_by=['host_id', 'room_type'],
    require_partition_filter=true,
    partition_expiration_days=365
) }}

SELECT
    listing_id,
    listing_url,
    name,
    room_type,
    minimum_nights,
    host_id,
    price,
    created_at,
    updated_at
FROM {{ ref('stg_listings') }}
