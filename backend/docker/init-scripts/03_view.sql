CREATE VIEW product_cards AS
SELECT
  b.brand_name AS brand,
  m.model_name AS model,
  c.color_name AS color,
  s2.size_value AS size,
  s.price AS price,
  p.image_url AS photo
FROM stock s
INNER JOIN models m ON m.model_id = s.model_id
INNER JOIN colors c ON c.color_id = s.color_id
INNER JOIN brands b ON m.brand_id = b.brand_id
INNER JOIN sizes s2 ON s.size_id = s2.size_id
INNER JOIN photos p ON s.model_id = p.model_id
WHERE p.is_primary = TRUE;