-- creating the brand table
CREATE TABLE brand(
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT

);
--Creation of the product category table
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT
);
--The product image table
 CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_url INT,
    image_url VARCHAR(255) NOT NULL,
    alt text VARCHAR(150),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
 );
 --Creating the table for products
 CREATE TABLE product(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2) NOT NULL,
    description TEXT,
    FOREIGN KEY(brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)

 );
 --the product variation table
 CREATE TABLE product_variation  (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    color_id INT,
    size_option _id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES product(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
 );
 --the product items table
 CREATE TABLE  product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT,
    sku VARCHAR(50) NOT NULL,
    stock INT NOT NULL,
    price DECIMAL(10,2),
    FOREIGN KEY(variatin_id)REFERENCES product_variation(variotion_id)
);

--the color table
CREATE TABLE color(
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
     nameOT NULL,
     hex_value VARCHAR(7)
);

--the size category table
CREATE TABLE size_category (
    size_category_id INt PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

the size option table
CREATE TABLE size_option (
    size_category_id INT,
    label VARCHAR (20) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)

);
--the attribute category table
CREATE TAbLE attribute_category (
    attribute_category_id INt PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);
--the attribute type table 
CREATE TABLE attribute_type (
    attribute_type_id INt PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);
--Product attribute table 

CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute _type_id INT,
    name VARCHAR(100) NOT NULL,
    value VARCHAR (255),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id)REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);