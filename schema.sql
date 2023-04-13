CREATE TABLE `Brand`(
    `Brand_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Brand_name` INT NOT NULL
);
ALTER TABLE
    `Brand` ADD PRIMARY KEY(`Brand_ID`);
CREATE TABLE `Ships`(
    `Ship_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Exp_by` DATE NOT NULL,
    `Order_ID` INT NOT NULL
);
ALTER TABLE
    `Ships` ADD PRIMARY KEY(`Ship_ID`);
CREATE TABLE `Category`(
    `Cat_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Cat_Name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Category` ADD PRIMARY KEY(`Cat_ID`);
CREATE TABLE `Orders`(
    `Order_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Sup_ID` INT NOT NULL,
    `Prod_ID` INT NOT NULL,
    `Store_ID` INT NOT NULL
);
ALTER TABLE
    `Orders` ADD PRIMARY KEY(`Order_ID`);
CREATE TABLE `Manufacturer`(
    `M_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Brand_ID` INT NOT NULL,
    `State` VARCHAR(255) NOT NULL,
    `City` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Manufacturer` ADD PRIMARY KEY(`M_ID`);
CREATE TABLE `Store`(
    `Store_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `State` VARCHAR(255) NOT NULL,
    `City` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Store` ADD PRIMARY KEY(`Store_ID`);
CREATE TABLE `Supplier`(
    `Sup_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Prod_ID` INT NOT NULL,
    `S_name` VARCHAR(255) NOT NULL,
    `State` VARCHAR(255) NOT NULL,
    `City` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Supplier` ADD PRIMARY KEY(`Sup_ID`);
ALTER TABLE
    `Supplier` ADD PRIMARY KEY(`Prod_ID`);
CREATE TABLE `Store Managers`(
    `Man_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `F_name` VARCHAR(255) NOT NULL,
    `L_name` VARCHAR(255) NOT NULL,
    `Contact` INT NOT NULL,
    `Age` INT NOT NULL,
    `Gender` INT NOT NULL,
    `Store_ID` INT NOT NULL
);
ALTER TABLE
    `Store Managers` ADD PRIMARY KEY(`Man_ID`);
CREATE TABLE `Product`(
    `Prod_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Sup_ID` INT NOT NULL,
    `Brand_ID` VARCHAR(255) NOT NULL,
    `Cat_ID` INT NOT NULL,
    `Prod_name` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Product` ADD PRIMARY KEY(`Prod_ID`);
CREATE TABLE `Inventory`(
    `Inv_ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Store_ID` INT NOT NULL,
    `Prod_ID` INT NOT NULL,
    `Category` VARCHAR(255) NOT NULL,
    `Qty` INT NOT NULL
);
ALTER TABLE
    `Inventory` ADD PRIMARY KEY(`Inv_ID`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_store_id_foreign` FOREIGN KEY(`Store_ID`) REFERENCES `Store`(`Store_ID`);
ALTER TABLE
    `Manufacturer` ADD CONSTRAINT `manufacturer_brand_id_foreign` FOREIGN KEY(`Brand_ID`) REFERENCES `Brand`(`Brand_ID`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_sup_id_foreign` FOREIGN KEY(`Sup_ID`) REFERENCES `Supplier`(`Sup_ID`);
ALTER TABLE
    `Inventory` ADD CONSTRAINT `inventory_store_id_foreign` FOREIGN KEY(`Store_ID`) REFERENCES `Store`(`Store_ID`);
ALTER TABLE
    `Ships` ADD CONSTRAINT `ships_order_id_foreign` FOREIGN KEY(`Order_ID`) REFERENCES `Orders`(`Order_ID`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_prod_id_foreign` FOREIGN KEY(`Prod_ID`) REFERENCES `Product`(`Prod_ID`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_cat_id_foreign` FOREIGN KEY(`Cat_ID`) REFERENCES `Category`(`Cat_ID`);
ALTER TABLE
    `Inventory` ADD CONSTRAINT `inventory_prod_id_foreign` FOREIGN KEY(`Prod_ID`) REFERENCES `Product`(`Prod_ID`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_sup_id_foreign` FOREIGN KEY(`Sup_ID`) REFERENCES `Supplier`(`Sup_ID`);
ALTER TABLE
    `Store Managers` ADD CONSTRAINT `store managers_store_id_foreign` FOREIGN KEY(`Store_ID`) REFERENCES `Store`(`Store_ID`);
ALTER TABLE
    `Product` ADD CONSTRAINT `product_brand_id_foreign` FOREIGN KEY(`Brand_ID`) REFERENCES `Brand`(`Brand_ID`);