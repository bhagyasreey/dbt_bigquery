SELECT
    l.listing_id AS listing_id,
    l.name AS listing_name,
    h.host_id,
    h.host_name,
    GREATEST(l.updated_at, h.updated_at) AS updated_at
FROM {{ ref('src_listings') }} l
JOIN {{ ref('src_hosts') }} h
  ON l.host_id = h.host_id
