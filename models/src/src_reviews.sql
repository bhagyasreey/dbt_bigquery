SELECT
    listing_id,
    date,
    reviewer_name,
    comments,
    sentiment
FROM {{ source('airbnb', 'reviews') }}