SELECT
    listing_id,
    name,
    minimum_nights
FROM {{ ref('src_listings') }}
WHERE minimum_nights < 0