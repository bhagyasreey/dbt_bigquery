SELECT
    listing_id,
    name,
    price
FROM {{ ref('src_listings') }}
WHERE price < 0