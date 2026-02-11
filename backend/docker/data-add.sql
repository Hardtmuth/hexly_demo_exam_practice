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
    (),

INSERT INTO photos (model_id, image_url, is_primary, alt_text)
VALUES
    ();

INSERT INTO stock (model_id, size_id, color_id, quantity, price)
VALUES
    ();
