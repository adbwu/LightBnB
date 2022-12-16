SELECT reservations.id, properties.title, properties.cost_per_night, reservations.start_date,average_rating
FROM reservations
JOIN properties on properties.id = reservations.property_id
JOIN (SELECT AVG(property_reviews.rating) as average_rating
FROM properties
JOIN property_reviews on properties.id = property_id
GROUP BY properties.id) on property_id.average_rating = reservations.property_id
WHERE reservations.guest_id = 1
ORDER BY start_date;