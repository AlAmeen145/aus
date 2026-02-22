-- -------------------------------------------------------------
-- SQL Commands to upgrade pmadb for normal phpMyAdmin operation
-- with MySQL 4.1.2 and above.
--
-- This file is meant for use with MySQL 4.1.2 and above!
-- For older MySQL releases, please use create_tables.sql
--
-- If you are running one MySQL 4.1.0 or 4.1.1, please create the tables using
-- create_tables.sql, then use this script.
--
-- Please don't forget to set up the tablenames in config.inc.php
--

-- --------------------------------------------------------

--
-- Database : `phpmyadmin`
--
-- --------------------------------------------------------

--
-- Table structure for table `Register`
--
CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`user_id`)
);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

ACREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(255) NOT NULL,
    `last_name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`)
);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--
CREATE TABLE `payments` (
    `payment_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `order_id` INT NOT NULL,
    `payment_method` VARCHAR(50) NOT NULL,  -- e.g., 'Credit Card', 'PayPal',RazorPy
    `card_last_four` VARCHAR(4) NULL,  -- Last 4 digits of card, if applicable
    `cvv` VARCHAR(3) NULL,  -- In a real application, you should not store the CVV code.
    `expiry_date` DATE NULL,  -- Card expiry date if applicable
    `amount` DECIMAL(10, 2) NOT NULL,
    `payment_status` ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    `payment_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`payment_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`),
    FOREIGN KEY (`order_id`) REFERENCES `orders`(`order_id`)
);


-- --------------------------------------------------------

--
-- Table structure for table `order tracking`
--
CREATE TABLE `orders` (
    `order_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `order_status` ENUM('Processing', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Processing',
    `tracking_number` VARCHAR(100),
    `total_amount` DECIMAL(10, 2) NOT NULL,
    `estimated_delivery` DATE NULL,
    `order_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`order_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`)
);


-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--
ALTER TABLE `pma__relation`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

ALTER TABLE `pma__relation`
  CHANGE `master_db` `master_db` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__relation`
  CHANGE `master_table` `master_table` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__relation`
  CHANGE `master_field` `master_field` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__relation`
  CHANGE `foreign_db` `foreign_db` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__relation`
  CHANGE `foreign_table` `foreign_table` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__relation`
  CHANGE `foreign_field` `foreign_field` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

ALTER TABLE `pma__table_coords`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

ALTER TABLE `pma__table_coords`
  CHANGE `db_name` `db_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__table_coords`
  CHANGE `table_name` `table_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

ALTER TABLE `pma__table_info`
  DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

ALTER TABLE `pma__table_info`
  CHANGE `db_name` `db_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__table_info`
  CHANGE `table_name` `table_name` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
ALTER TABLE `pma__table_info`
  CHANGE `display_field` `display_field` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '';
