SELECT
    listing_id,
    created_at,
    updated_at
FROM {{ ref('src_listings') }}
WHERE updated_at < created_at