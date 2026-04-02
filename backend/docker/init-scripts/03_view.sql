CREATE VIEW product_cards AS
SELECT DISTINCT
  CONCAT(b.brand_id, '_', m.model_id, '_', c.color_id) AS id,
  b.brand_name AS brand,
  m.model_name AS model,
  c.color_name AS color,
  s2.size_value AS size,
  s.price AS price,
  p.image_url AS photo
FROM stock s
RIGHT JOIN models m ON m.model_id = s.model_id
RIGHT JOIN colors c ON c.color_id = s.color_id
RIGHT JOIN brands b ON m.brand_id = b.brand_id
RIGHT JOIN sizes s2 ON s.size_id = s2.size_id
RIGHT JOIN photos p ON s.model_id = p.model_id
WHERE p.is_primary = TRUE;