DROP DATABASE IF EXISTS menu_planner;
CREATE DATABASE menu_planner;
USE menu_planner;
CREATE TABLE burden (
    burden_id INT PRIMARY KEY,
    burden_name varchar(10) UNIQUE
);
CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name varchar(10) UNIQUE
);
CREATE TABLE ingredient (
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name varchar(30) UNIQUE,
    category_id INT,
    CONSTRAINT ingredient_category_fk FOREIGN KEY (category_id) REFERENCES category(category_id)
);
CREATE TABLE menu (
    menu_id SERIAL PRIMARY KEY,
    menu_name varchar(30) UNIQUE,
    calorie INT DEFAULT 0,
    burden_id INT,
    CONSTRAINT menu_burden_fk FOREIGN KEY (burden_id) REFERENCES burden(burden_id)
);
CREATE TABLE recipe (
    menu_id BIGINT UNSIGNED,
    ingredient_id BIGINT UNSIGNED,
    num INT NOT NULL
);
INSERT INTO burden (burden_id, burden_name) value (1, "小");
INSERT INTO burden (burden_id, burden_name) value (2, "中");
INSERT INTO burden (burden_id, burden_name) value (3, "大");
INSERT INTO category (category_id, category_name) value (1, "肉");
INSERT INTO category (category_id, category_name) value (2, "魚");
INSERT INTO category (category_id, category_name) value (3, "野菜");
INSERT INTO category (category_id, category_name) value (4, "調味料");
INSERT INTO category (category_id, category_name) value (5, "その他");
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (1, "豚こま肉", 1);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (2, "玉ねぎ", 3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (3, "ニンニク", 3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (4, "塩", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (5, "こしょう", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (6, "ウスターソース", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (7, "砂糖", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (8, "パセリ", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (9, "カレールー", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (10, "バター", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (11, "もやし", 3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (12, "もやしキット", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (13, "ごま油", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (14, "薄力粉", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (15, "醤油", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (16, "酒", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (17, "魚", 2);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (18, "キャベツ", 3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (19, "豚バラ", 1);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (20, "焼きそばセット", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (21, "なす", 3);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (22, "なす炒めキット", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (23, "パスタ1.6mm", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (24, "パスタ1.8mm", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (25, "オリーブオイル", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (26, "唐辛子", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (27, "コンソメ", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (28, "生姜", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (29, "卵", 5);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (30, "長ネギ", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (31, "味の素", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (32, "鶏もも肉", 1);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (33, "みりん", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (34, "ナツメグ", 4);
INSERT INTO ingredient (ingredient_id, ingredient_name, category_id) value (35, "片栗粉", 4);
INSERT INTO menu (menu_id, menu_name, burden_id) value (1, "カレー", 2);
INSERT INTO menu (menu_id, menu_name, burden_id) value (2, "もやし炒め", 1);
INSERT INTO menu (menu_id, menu_name, burden_id) value (3, "豚キムチ", 2);
INSERT INTO menu (menu_id, menu_name, burden_id) value (4, "魚", 1);
INSERT INTO menu (menu_id, menu_name, burden_id) value (5, "焼きそば", 1);
INSERT INTO menu (menu_id, menu_name, burden_id) value (6, "なす炒め", 1);
INSERT INTO menu (menu_id, menu_name, burden_id) value (7, "焼肉定食", 1);
INSERT INTO menu (menu_id, menu_name, burden_id) value (8, "ペペロンチーノ", 1);
INSERT INTO menu (menu_id, menu_name, burden_id) value (9, "チャーハン", 1);
INSERT INTO menu (menu_id, menu_name, burden_id) value (10, "唐揚げ", 2);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 1, 300);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 2, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 3, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 4, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 5, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 6, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 7, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 8, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 9, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(1, 10, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(2, 1, 200);
INSERT INTO recipe (menu_id, ingredient_id, num) value(2, 11, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(2, 12, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 1, 320);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 13, 320);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 2, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 3, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 13, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 4, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 14, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 7, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 15, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(3, 16, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(4, 17, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(5, 18, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(5, 19, 200);
INSERT INTO recipe (menu_id, ingredient_id, num) value(5, 20, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(6, 21, 3);
INSERT INTO recipe (menu_id, ingredient_id, num) value(6, 22, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(7, 1, 200);
INSERT INTO recipe (menu_id, ingredient_id, num) value(7, 18, 1);
INSERT INTO recipe (menu_id, ingredient_id, num) value(8, 23, 200);
INSERT INTO recipe (menu_id, ingredient_id, num) value(8, 3, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(8, 25, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(8, 26, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(8, 27, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(8, 4, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 19, 100);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 28, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 29, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 30, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 4, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 31, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 5, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(9, 16, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 32, 320);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 15, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 33, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 16, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 31, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 3, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 34, 0);
INSERT INTO recipe (menu_id, ingredient_id, num) value(10, 35, 0);