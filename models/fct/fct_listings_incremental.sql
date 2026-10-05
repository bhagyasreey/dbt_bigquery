{{ config(
    materialized='incremental'
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

{% if is_incremental() %}
WHERE created_at > (
    SELECT MAX(created_at)
    FROM {{ this }}
)
{% endif %}