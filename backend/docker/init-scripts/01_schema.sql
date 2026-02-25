DROP TABLE IF EXISTS sizes;
DROP TABLE IF EXISTS models;
DROP TABLE IF EXISTS photos;
DROP TABLE IF EXISTS colors;
DROP TABLE IF EXISTS stock;

CREATE TABLE sizes (
    size_id SERIAL PRIMARY KEY,
    size_value DECIMAL(4,1) NOT NULL
);

CREATE TABLE brands (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL
);

CREATE TABLE colors (
    color_id SERIAL PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE models (
    model_id SERIAL PRIMARY KEY,
    article VARCHAR(20) UNIQUE NOT NULL,
    model_name VARCHAR(100) NOT NULL,
    brand_id INT NOT NULL REFERENCES brands(brand_id) ON DELETE CASCADE
);

CREATE TABLE model_colors (
    model_id INT NOT NULL REFERENCES models(model_id) ON DELETE CASCADE,
    color_id INT NOT NULL REFERENCES colors(color_id) ON DELETE CASCADE,
    is_primary BOOLEAN DEFAULT FALSE,  -- основной цвет модели
    sort_order INT DEFAULT 0,         -- порядок отображения в галерее цветов

    PRIMARY KEY (model_id, color_id),  -- уникальность пары
    CONSTRAINT chk_sort_order CHECK (sort_order >= 0)
);

CREATE TABLE photos (
    photo_id SERIAL PRIMARY KEY,
    model_id INT NOT NULL REFERENCES models(model_id) ON DELETE CASCADE,
    color_id INT NOT NULL REFERENCES colors(color_id) ON DELETE CASCADE,
    image_url VARCHAR(500) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    sort_order INT DEFAULT 0,
    alt_text VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT uk_model_photo UNIQUE (model_id, color_id, image_url),
    CONSTRAINT chk_sort_order CHECK (sort_order >= 0)
);

CREATE TABLE stock (
    stock_id SERIAL PRIMARY KEY,
    model_id INT NOT NULL,
    size_id INT NOT NULL,
    color_id INT,
    quantity INT NOT NULL DEFAULT 0,
    price NUMERIC(10, 2) NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),

    -- Внешние ключи
    CONSTRAINT fk_stock_model FOREIGN KEY (model_id)
        REFERENCES models(model_id) ON DELETE CASCADE,
    CONSTRAINT fk_stock_size FOREIGN KEY (size_id)
        REFERENCES sizes(size_id) ON DELETE CASCADE,
    CONSTRAINT fk_stock_color FOREIGN KEY (color_id)
        REFERENCES colors(color_id) ON DELETE RESTRICT,

    -- Уникальность комбинации модель+размер+цвет
    CONSTRAINT uk_stock_model_size_color UNIQUE (model_id, size_id, color_id),

    -- Проверка на неотрицательное количество
    CONSTRAINT chk_quantity_non_negative CHECK (quantity >= 0),

    -- Проверка на положительную цену
    CONSTRAINT chk_price_positive CHECK (price > 0)
);