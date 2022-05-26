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
);

INSERT INTO burden (burden_id, burden_name)
value (1, "small");
INSERT INTO burden (burden_id, burden_name)
value (2, "中");
INSERT INTO burden (burden_id, burden_name)
value (3, "大");


INSERT INTO category (category_id, category_name)
value (1, "肉");
INSERT INTO category (category_id, category_name)
value (2, "魚");
INSERT INTO category (category_id, category_name)
value (3, "野菜");
INSERT INTO category (category_id, category_name)
value (4, "調味料");
INSERT INTO category (category_id, category_name)
value (5, "その他");

INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (1, "豚こま肉", 1);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (2, "玉ねぎ", 3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (3, "ニンニク",  3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (4, "塩", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (5, "こしょう", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (6, "ウスターソース", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (7, "砂糖", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (8, "パセリ", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (9, "カレールー", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (10, "バター", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (11, "もやし", 3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id)
value (12, "もやしキット", 5);

INSERT INTO menu (menu_id, menu_name, burden_id)
value (1, "カレー", 2);
INSERT INTO menu (menu_id, menu_name, burden_id)
value (2, "もやし炒め", 1);

INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 1, 300);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 2, 1);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 3, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 4, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 5, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 6, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 7, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 8, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 9, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(1, 10, 0);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(2, 1, 200);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(2, 11, 1);
INSERT INTO recipe (menu_id, ingredient_id, num)
value(2, 12, 0);
