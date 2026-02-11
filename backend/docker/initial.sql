DROP TABLE IF EXIST sizes;
DROP TABLE IF EXIST models;
DROP TABLE IF EXIST photos;
DROP TABLE IF EXIST colors;
DROP TABLE IF EXIST stock;

CREATE TABLE sizes (
    id SERIAL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    size_value DECIMAL(4,1) NOT NULL,
);

CREATE TABLE models (
    model_id SERIAL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    article VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(50),
    color VARCHAR(30)
);

CREATE TABLE models (
    model_id SERIAL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    article VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(50),
);

CREATE TABLE photos (
    photo_id SERIAL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    model_id INT NOT NULL REFERENCES models(model_id) ON DELETE CASCADE,
    image_url VARCHAR(500) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    sort_order INT DEFAULT 0,
    alt_text VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT uk_model_photo UNIQUE (model_id, image_url),
    CONSTRAINT chk_sort_order CHECK (sort_order >= 0)
);

CREATE TABLE colors (
    color_id SERIAL PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL UNIQUE,
    hex_code CHAR(7) CHECK (hex_code LIKE '#%')  -- HEX-код цвета (опционально)
);

CREATE TABLE model_colors (
    model_id INT NOT NULL REFERENCES models(model_id) ON DELETE CASCADE,
    color_id INT NOT NULL REFERENCES colors(color_id) ON DELETE CASCADE,
    is_primary BOOLEAN DEFAULT FALSE,  -- основной цвет модели
    sort_order INT DEFAULT 0,         -- порядок отображения в галерее цветов

    PRIMARY KEY (model_id, color_id),  -- уникальность пары
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