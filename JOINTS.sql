SELECT
    p.property_id,
    p.address,
    p.price,
    o.first_name,
    o.last_name,
    o.phone
FROM properties p
JOIN owners o
    ON p.owner_id = o.owner_id;