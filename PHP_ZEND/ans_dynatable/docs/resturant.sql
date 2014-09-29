-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 28, 2014 at 11:43 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `resturant`
--
CREATE DATABASE IF NOT EXISTS `resturant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `resturant`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `image_url` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image_url`) VALUES
(1, 'Meat', 'meat.jpg'),
(2, 'Soup', 'soup.jpg'),
(3, 'drink', 'drink.jpg'),
(8, 'Pastries', 'Pastries.jpg'),
(9, 'Ice-cream', 'ice_cream.jpg'),
(10, 'salad', 'salad.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `idCustomer` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(35) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `email` varchar(40) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  UNIQUE KEY `idCustomer_UNIQUE` (`idCustomer`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`idCustomer`, `address`, `password`, `phone`, `first_name`, `last_name`, `email`, `status`) VALUES
(61, 'Ramallah', '123456', '0599042503', 'ahmad', 'nassryyyyy', 'ahmadnassr@gmail.com', 1),
(67, '4545', 'y', '22', 'h', 'g', 'ahammad@dimensions.ps', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_statement`
--

CREATE TABLE IF NOT EXISTS `invoice_statement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `total_cost` double NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_invoicStatement_idx` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `topping` longtext NOT NULL,
  `size` longtext NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `img_url` varchar(45) NOT NULL,
  `des` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoreies_item_idx` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `topping`, `size`, `category_id`, `img_url`, `des`) VALUES
(3, 'Hamburger', '', '{"size":[{"id":"1","name":"Small","price":"6"},{"id":"2","name":"Medium","price":"10"},{"id":"3","name":"Big","price":"14"}]}', 1, 'hum.jpg', 'Wow Amazing Tase 2'),
(4, 'Pizza', '{"topping":[{"id":"4","name":"Onion","price":"4","img_url":"top_meat.jpg"},{"id":"5","name":"Green Peppercorn","price":"4","img_url":"top_meat.jpg"},{"id":"6","name":"Edible Mushroom","price":"4","img_url":"top_meat.jpg"},{"id":"7","name":"Black Olive","price":"4","img_url":"top_meat.jpg"},{"id":"8","name":"Vegetable","price":"4","img_url":"top_meat.jpg"},{"id":"9","name":"Pineapple","price":"4","img_url":"top_meat.jpg"},{"id":"1","name":"Meat","price":"4","img_url":"top_meat.jpg"},{"id":"2","name":"Chicken","price":"4","img_url":"top_chick.jpg"},{"id":"3","name":"Chease","price":"4","img_url":"top_chease.jpg"}]}', '{"size":[{"id":"1","name":"Small","price":"6"},{"id":"2","name":"Medium","price":"10"},{"id":"3","name":"Big","price":"14"}]}', 8, 'pizza.jpg', 'Excellent pizza that ever made'),
(5, 'Cola', '', '{"size":[{"id":"1","name":"Small","price":"1.5"},{"id":"2","name":"Big","price":"3"}]}', 3, 'cola.jpg', ''),
(6, 'Tea', '', '\n{"size":[{"id":"1","name":"Medium","price":"2"},{"id":"2","name":"Big","price":"3"}]}', 3, 'tea.jpg', ''),
(7, 'Vegetable Soup', '', '{"size":[{"id":"2","name":"-","price":"10"}]}', 2, 'vegsoup.jpg', ''),
(8, 'kabab', '', '{"size":[{"id":"2","name":"-","price":"10"}]}', 8, 'kabab.jpg', 'Wow Amazing stff'),
(9, 'Corn Salad', '{"topping":[{"id":"1","name":"Mayonnaise","price":"1","img_url":"top_meat.jpg"},{"id":"2","name":"Coiled","price":"1","img_url":"top_meat.jpg"},{"id":"3","name":"Mushroom","price":"1","img_url":"top_meat.jpg"},{"id":"4","name":"Tomatoes","price":"4","img_url":"top_meat.jpg"}]}', '{"size":[{"id":"2","name":"-","price":"10"}]}', 10, 'cornsalad.jpg', ''),
(10, 'Meat Pie  Sfeeha', '{"topping":[{"id":"1","name":"Halva","price":"1","img_url":"top_meat.jpg"},{"id":"2","name":"Tomatoes","price":"4","img_url":"top_meat.jpg"}]}', '{"size":[{"id":"2","name":"-","price":"10"}]}', 8, 'sfeha.jpg', 'Wow Amazing Tase 1'),
(11, 'PIzzaw', '', '{"size":[{"id":"1","name":"Small","price":"6"},{"id":"2","name":"Medium","price":"10"},{"id":"3","name":"Big","price":"14"}]}', 8, 'hum.jpg', 'Wow Amazing Tase 3'),
(12, 'Corn Salad', '{"topping":[{"id":"1","name":"Mayonnaise","price":"1","img_url":"top_meat.jpg"},{"id":"2","name":"Coiled","price":"1","img_url":"top_meat.jpg"},{"id":"3","name":"Mushroom","price":"1","img_url":"top_meat.jpg"},{"id":"4","name":"Tomatoes","price":"4","img_url":"top_meat.jpg"}]}', '{"size":[{"id":"2","name":"-","price":"10"}]}', 8, 'cornsalad.jpg', 'Wow Amazing Tase 1'),
(13, 'Tea', '', '{"size":[{"id":"1","name":"Medium","price":"2"},{"id":"2","name":"Big","price":"3"}]}', 8, 'tea.jpg', 'Wow Amazing Tase 1'),
(14, 'Cola', '', '{"size":[{"id":"1","name":"Small","price":"1.5"},{"id":"2","name":"Big","price":"3"}]}', 8, 'cola.jpg', 'Wow Amazing Tase 1'),
(15, 'Corn Salad', '{"topping":[{"id":"1","name":"Mayonnaise","price":"1","img_url":"top_meat.jpg"},{"id":"2","name":"Coiled","price":"1","img_url":"top_meat.jpg"},{"id":"3","name":"Mushroom","price":"1","img_url":"top_meat.jpg"},{"id":"4","name":"Tomatoes","price":"4","img_url":"top_meat.jpg"}]}', '{"size":[{"id":"2","name":"-","price":"10"}]}', 8, 'cornsalad.jpg', 'Wow Amazing Tase 1'),
(16, 'Vegetable Soup', '', '{"size":[{"id":"2","name":"-","price":"10"}]}', 2, 'vegsoup.jpg', 'Wow Amazing Tase 1');

-- --------------------------------------------------------

--
-- Table structure for table `line_item`
--

CREATE TABLE IF NOT EXISTS `line_item` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `size` longtext NOT NULL,
  `topping` varchar(200) NOT NULL,
  `total_cost` double NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `order_key_idx` (`order_id`),
  KEY `item_key_idx` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `line_item`
--

INSERT INTO `line_item` (`order_id`, `item_id`, `quantity`, `size`, `topping`, `total_cost`, `id`) VALUES
(12, 3, 1, '{"id":"1","price":"6","name":"Small"}', 'null', 6, 26),
(12, 5, 1, '{"id":"2","price":"3","name":"Big"}', 'null', 3, 27),
(12, 6, 1, '{"id":"2","price":"3","name":"Big"}', 'null', 3, 28),
(18, 3, 1, '{"id":"1","price":"6","name":"Small"}', 'null', 6, 36),
(19, 3, 1, '{"id":"1","price":"6","name":"Small"}', 'null', 6, 37),
(23, 3, 1, '{"id":"1","price":"6","name":"Small"}', 'null', 6, 38);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(40) NOT NULL,
  `total_cost` int(11) NOT NULL DEFAULT '0',
  `table_num` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `order_date` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_order_idx` (`CustomerId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `address`, `total_cost`, `table_num`, `CustomerId`, `status`, `order_date`) VALUES
(12, '', 0, 12, 61, 0, '1, 9 8, 2013'),
(17, 'Jerusalem- Street g-DepNo:5- Phone: 7558', 0, 0, 61, 1, '2, 9 9, 2013'),
(18, '', 6, 4, 61, 2, '2, 9 9, 2013'),
(19, '', 6, 5, 61, 3, '2, 9 9, 2013'),
(23, '', 6, 23, 61, 0, '2, 9 9, 2013');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invoice_statement`
--
ALTER TABLE `invoice_statement`
  ADD CONSTRAINT `order_invoicStatement` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `categoreies_item` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `line_item`
--
ALTER TABLE `line_item`
  ADD CONSTRAINT `item_key` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `order_key` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `customer_order` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`idCustomer`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
