INSERT INTO sizes (size_value) 
VALUES
    (35),
    (35.5),
    (36),
    (36.5),
    (37),
    (37.5),
    (38),
    (38.5),
    (39),
    (39.5),
    (40),
    (40.5),
    (41),
    (41.5),
    (42),
    (42.5),
    (43),
    (43.5),
    (44),
    (44.5),
    (45);

INSERT INTO brands (brand_name)
VALUES
    ('Vans'),
    ('Nike SB'),
    ('DC Shoes');

INSERT INTO colors (color_name)
VALUES
    ('beige'),
    ('beige-gum'),
    ('black'),
    ('black-brown'),
    ('black-gum'),
    ('black-white'),
    ('blue'),
    ('brown'),
    ('brown-black'),
    ('green'),
    ('grey'),
    ('red'),
    ('white'),
    ('white-black'),
    ('white-red'),
    ('red-black'),
    ('yellow');

INSERT INTO models (article, model_name, brand_id)
VALUES
    ('VN0A3MTJ', 'Filmore', 1),
    ('VN0005UF', 'Old Skool', 1),
    ('VN000TUY', 'Atwood', 1),
    ('VN000CSP', 'Caldrone', 1),
    ('DM3493', 'Chron 2', 2),
    ('FJ1675', 'Stefan Janoski', 2),
    ('CJ0882', 'Alleyoop', 2),
    ('DV5477', 'Force 58', 2),
    ('ADYS100765', 'Manateca 4', 3),
    ('ADYS300739', 'Teknic', 3),
    ('303190', 'Anvil', 3),
    ('ADYS300591', 'Manual', 3),
    ('ADYS100647', 'Crisis 2', 3);

INSERT INTO model_colors (model_id, color_id, is_primary)
VALUES
    (1, 3, TRUE),
    (1, 7, FALSE),
    (1, 11, FALSE),
    (2, 17, FALSE),
    (2, 1, FALSE),
    (2, 5, TRUE),
    (2, 12, FALSE),
    (3, 1, FALSE),
    (3, 10, FALSE),
    (3, 3, TRUE),
    (4, 1, FALSE),
    (4, 10, FALSE),
    (4, 3, TRUE),
    (5, 5, FALSE),
    (5, 1, FALSE),
    (5, 7, FALSE),
    (5, 10, FALSE),
    (5, 13, FALSE),
    (5, 6, TRUE),
    (5, 2, FALSE),
    (6, 10, TRUE),
    (7, 16, TRUE),
    (8, 11, FALSE),
    (8, 8, FALES),
    (8, 10, FALSE),
    (8, 13, TRUE),
    (9, 13, FALES),
    (9, 8, FALSE),
    (9, 9, FALSE),
    (9, 11, FALSE),
    (9, 14, FALSE),
    (9, 15, FALSE),
    (9, 4, FALSE),
    (9, 3, TRUE),
    (10, 10, TRUE),
    (10, 7, FALSE),
    (11, 6, TRUE),
    (12, 5, TRUE),
    (13, 3, FALSE);

INSERT INTO photos (model_id, color_id, image_url, is_primary, alt_text)
VALUES
    (); -- top, down, left, right, angle, angle-double, back-double, top-double, back-angle-double, angle-close(3), top-down(1), angle1(1), back-angle(1)

INSERT INTO stock (model_id, size_id, color_id, quantity, price) -- check model -> color
VALUES
    ();
