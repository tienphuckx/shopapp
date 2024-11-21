CREATE TABLE `users` (
  `id` int PRIMARY KEY,
  `email` varchar(255),
  `password` varchar(255),
  `name` varchar(255),
  `role` int,
  `avatar` varchar(255),
  `phone` int,
  `is_locked` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `categories` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `image` text
);

CREATE TABLE `products` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `price` int,
  `oldprice` int,
  `image` text,
  `description` text,
  `specification` text,
  `buyturn` int,
  `quantity` int,
  `brand_id` int,
  `category_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `brands` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `image` text
);

CREATE TABLE `feedbacks` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `user_id` int,
  `star` int,
  `content` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `orders` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `session_id` varchar(255),
  `status` int,
  `note` text,
  `total` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `order_details` (
  `id` int PRIMARY KEY,
  `order_id` int,
  `product_id` int,
  `price` int,
  `quantity` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `news` (
  `id` int PRIMARY KEY,
  `title` varchar(255),
  `image` text,
  `content` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `news_details` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `news_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `banners` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `image` text,
  `status` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `banner_details` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `banner_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `product_images` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `image_url` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `carts` (
  `id` int PRIMARY KEY,
  `session_id` varchar(255) COMMENT 'For identifying guest users',
  `user_id` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `cart_items` (
  `id` int PRIMARY KEY,
  `cart_id` int,
  `product_id` int,
  `quantity` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `attributes` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `product_attribute_values` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `attribute_id` int,
  `value` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `variants` (
  `id` int PRIMARY KEY,
  `name` varchar(255),
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `variant_values` (
  `id` int PRIMARY KEY,
  `variant_id` int,
  `value` varchar(255),
  `image` text,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `product_variant_values` (
  `id` int PRIMARY KEY,
  `product_id` int,
  `sku` varchar(255),
  `price` int,
  `old_price` int,
  `stock` int,
  `created_at` datetime,
  `updated_at` datetime
);

ALTER TABLE `products` ADD FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

ALTER TABLE `products` ADD FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

ALTER TABLE `feedbacks` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `feedbacks` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `order_details` ADD FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

ALTER TABLE `order_details` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `news_details` ADD FOREIGN KEY (`news_id`) REFERENCES `news` (`id`);

ALTER TABLE `news_details` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `banner_details` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `banner_details` ADD FOREIGN KEY (`banner_id`) REFERENCES `banners` (`id`);

ALTER TABLE `product_images` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `cart_items` ADD FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`);

ALTER TABLE `cart_items` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `product_attribute_values` ADD FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`);

ALTER TABLE `product_attribute_values` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

ALTER TABLE `variant_values` ADD FOREIGN KEY (`variant_id`) REFERENCES `variants` (`id`);

ALTER TABLE `product_variant_values` ADD FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
