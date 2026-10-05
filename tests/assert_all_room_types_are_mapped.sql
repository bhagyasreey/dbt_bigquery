SELECT
    l.listing_id,
    l.room_type
FROM {{ ref('src_listings') }} l
LEFT JOIN {{ ref('airbnb_room_type_reference_seed') }} r
    ON l.room_type = r.room_type
WHERE r.room_type IS NULL