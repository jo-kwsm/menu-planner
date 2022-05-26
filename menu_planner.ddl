DROP DATABASE menu_planner;
CREATE DATABASE menu_planner;
USE menu_planner;

CREATE TABLE burden
(
    burden_id INT PRIMARY KEY,
    burden_name varchar(10) UNIQUE
);

CREATE TABLE category
(
    category_id INT PRIMARY KEY,
    category_name varchar(10) UNIQUE
);

CREATE TABLE ingredient
(
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name varchar(30) UNIQUE,
    category_id INT,
    CONSTRAINT ingredient_category_fk FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE menu
(
    menu_id SERIAL PRIMARY KEY,
    menu_name varchar(30) UNIQUE,
    calorie INT,
    burden_id INT,
    CONSTRAINT menu_burden_fk FOREIGN KEY (burden_id) REFERENCES burden(burden_id)
);

CREATE TABLE recipe
(
    menu_id BIGINT UNSIGNED,
    ingredient_id BIGINT UNSIGNED,
    num INT NOT NULL
)
