CREATE TABLE categories (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	category_id INTEGER NOT NULL,
	name VARCHAR(100) NOT NULL,
	price NUMERIC(10, 2)
);

CREATE TABLE shopping_lists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	status VARCHAR(10),
	scheduled_at TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE measure_units (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	unit VARCHAR(5) NOT NULL
);

CREATE TABLE shopping_list_products (
	id SERIAL PRIMARY KEY,
	shopping_list_id INTEGER NOT NULL,
	measure_unit_id INTEGER NOT NULL,
	quantity NUMERIC(10, 2),
	priority VARCHAR(10)
);

CREATE TABLE suppliers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	address VARCHAR(300),
	postal_code VARCHAR(10)
);

CREATE TABLE purchases (
	id SERIAL PRIMARY KEY,
	shopping_list_id INTEGER NOT NULL,
	supplier_id INTEGER NOT NULL,
	gross_value NUMERIC(10, 2),
	discount NUMERIC(10, 2),
	net_value NUMERIC(10, 2)
);

CREATE TABLE brands (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE purchase_products (
	id SERIAL PRIMARY KEY,
	shopping_list_product_id INTEGER NOT NULL,
	brand_id INTEGER NOT NULL,
	measure_unit_id INTEGER NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	discount NUMERIC(10, 2),
	discount_type VARCHAR(10),
	quantity NUMERIC(10, 2)
);

ALTER TABLE products ADD CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES categories (id);

ALTER TABLE shopping_list_products ADD CONSTRAINT fk_shopping_list FOREIGN KEY (shopping_list_id) REFERENCES shopping_lists (id);

ALTER TABLE shopping_list_products ADD CONSTRAINT fk_shopping_list_measure_unit FOREIGN KEY (measure_unit_id) REFERENCES measure_units (id);

ALTER TABLE purchases ADD CONSTRAINT fk_purchase_shopping_list FOREIGN KEY (shopping_list_id) REFERENCES shopping_lists (id);

ALTER TABLE purchases ADD CONSTRAINT fk_purchase_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers (id);

ALTER TABLE purchase_products ADD CONSTRAINT fk_purchase_product FOREIGN KEY (shopping_list_product_id) REFERENCES shopping_list_products (id);

ALTER TABLE purchase_products ADD CONSTRAINT fk_purchase_product_brand FOREIGN KEY (brand_id) REFERENCES brands (id);

ALTER TABLE purchase_products ADD CONSTRAINT fk_purchase_product_measure_unit FOREIGN KEY (measure_unit_id) REFERENCES measure_units (id);
