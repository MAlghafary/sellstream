-- sell.category definition

CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO sell.category (name) VALUES
	 ('accessories'),
	 ('beachwear'),
	 ('cars'),
	 ('fashion'),
	 ('furniture'),
	 ('gadgets'),
	 ('men'),
	 ('outdoors'),
	 ('perfumes'),
	 ('shoes');
INSERT INTO sell.category (name) VALUES
	 ('women');


-- sell.contactus definition

CREATE TABLE `contactus` (
  `contactus_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`contactus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- sell.users definition

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  CONSTRAINT `users_chk_1` CHECK ((`user_type` in (_utf8mb4'seller',_utf8mb4'buyer',_utf8mb4'admin')))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO sell.users (username,email,password,user_type) VALUES
	 ('dalia','dalia@gmail.com','$2b$10$CRQZ5KUMAAw1yN2zMG/U..rDzAG4oSMcdJ6ZWJsgDV9dSryPxU412','seller'),
	 ('osama','d;kkk@gmail.com','$2b$10$/xAH3/mI4zB/1eKeqe6tz.MV9cxjR4MVIUU6zValeWUuqCE6u8Q06','seller'),
	 ('dalia','daliay@gmail.com','$2b$10$FOEHcVCPeg/7y3x/TuTwBu4V9xVkp4nQMtFNkOJZ7Ph0UMSLhKcGO','admin'),
	 ('ahlam','ahlamhi@gmail.com','$2b$10$/Fj0C9iTC9/lrPv5U4Cj/eb.K2gQF41zdZmyxQeS6azeblNh5FmZS','seller'),
	 ('mutaz','mutaz@gmail.com','$2b$10$oOe0xlxsfzSD7B7vfaLuTu5QsVqCn2W8nX2Ci0tLfNOXbADIQlLti','buyer'),
	 ('mutaz','mutazmutaz@gmail.com','$2b$10$MzwoXa4jHHtY1IOkK8syIOrvn57lUvi2KL.91kZaPFlZpszjajnxC','buyer'),
	 ('mutaz1','mmmmmm@gmail.com','$2b$10$Og9tIW.ZxrpHmWMUsi.FB.Ud5OaXIBAPuK5GednMOnh.4CLepvzPW','admin'),
	 ('test','test@test.com','$2b$10$wZs4wbtS.CLVLZD07GRMIOQLw1I1QtaMHLkpJqrk3JUhXjvk8l05y','seller'),
	 ('m','m@gmail.com','$2b$10$.fkBBoL5a.F/Jkn0c5aPkuCIKvulv/xiif25LlO1kdJPvUvQRb8yy','admin'),
	 ('dalia','dalia123@gmail.com','$2b$10$HWJFd50PJfOi2Zviu/ube.g4bFa1kfopjxqYge/9yPWPFXLwSDq4m','seller');


-- sell.product definition

CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` int DEFAULT '0',
  `description` text,
  `rating` decimal(2,1) DEFAULT '0.0',
  `saleCount` int DEFAULT '0',
  `isNew` tinyint(1) DEFAULT '0',
  `offerEnd` datetime DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `approval_status` enum('pending','approved','rejected') DEFAULT 'pending',
  `stock` int NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO sell.product (name,price,discount,description,rating,saleCount,isNew,offerEnd,createdAt,approval_status,stock,category_id) VALUES
	 ('Lorem ipsum jacket',12.45,10,'Sed ut perspiciatis unde omnis iste natus...',4.0,54,0,'2024-10-05 12:11:00','2024-05-23 01:59:17','approved',40,0),
	 ('Elegant Dress',45.99,15,'An elegant dress suitable for all occasions...',4.5,120,1,'2024-09-15 14:30:00','2024-05-23 01:59:17','approved',5,0),
	 ('Casual T-Shirt',15.99,5,'A comfortable and casual t-shirt...',3.8,80,0,NULL,'2024-05-23 01:59:17','approved',3,0),
	 ('Running Shoes',60.00,20,'High-performance running shoes...',4.7,200,1,'2024-11-01 10:00:00','2024-05-23 01:59:17','rejected',2,0),
	 ('Leather Wallet',25.00,0,'A durable leather wallet...',4.2,150,0,NULL,'2024-05-23 01:59:17','rejected',98,0),
	 ('Winter Coat',120.00,30,'A warm winter coat...',4.9,60,1,'2024-12-31 23:59:59','2024-05-23 01:59:17','approved',83,0),
	 ('Smart Watch',150.00,25,'A smart watch with multiple features...',4.4,250,1,'2024-08-20 15:00:00','2024-05-23 01:59:17','approved',23,0),
	 ('Designer Handbag',200.00,40,'A stylish designer handbag...',4.6,90,0,NULL,'2024-05-23 01:59:17','approved',64,0),
	 ('Sports Cap',10.00,10,'A cool sports cap...',4.1,140,0,'2024-10-30 12:00:00','2024-05-23 01:59:17','rejected',52,0),
	 ('Sunglasses',30.00,15,'Fashionable sunglasses...',4.3,110,0,NULL,'2024-05-23 01:59:17','rejected',68,0);
INSERT INTO sell.product (name,price,discount,description,rating,saleCount,isNew,offerEnd,createdAt,approval_status,stock,category_id) VALUES
	 ('Formal Shirt',35.00,5,'A formal shirt for office wear...',3.9,85,0,NULL,'2024-05-23 01:59:17','approved',82,0),
	 ('Jeans',50.00,20,'Comfortable and stylish jeans...',4.5,130,1,'2024-09-01 09:00:00','2024-05-23 01:59:17','pending',6,0),
	 ('Hiking Boots',80.00,25,'Durable hiking boots...',4.8,75,1,'2024-11-10 16:00:00','2024-05-23 01:59:17','pending',85,0),
	 ('Beachwear',20.00,10,'Comfortable beachwear...',4.0,60,0,NULL,'2024-05-23 01:59:17','pending',5,0),
	 ('Leather Belt',18.00,0,'A stylish leather belt...',3.7,95,0,NULL,'2024-05-23 01:59:17','pending',70,0),
	 ('Casual Sneakers',55.00,15,'Casual sneakers for everyday wear...',4.2,110,0,NULL,'2024-05-23 01:59:17','pending',35,0),
	 ('Travel Backpack',75.00,20,'A durable travel backpack...',4.6,80,1,'2024-10-05 12:00:00','2024-05-23 01:59:17','pending',64,0),
	 ('Fitness Tracker',65.00,10,'A fitness tracker to monitor your activities...',4.4,150,1,'2024-08-25 14:00:00','2024-05-23 01:59:17','pending',13,0),
	 ('Luxury Watch',300.00,50,'A luxury watch for special occasions...',4.9,30,0,NULL,'2024-05-23 01:59:17','pending',72,0),
	 ('Casual Shorts',20.00,5,'Comfortable casual shorts...',4.0,90,0,NULL,'2024-05-23 01:59:17','pending',23,0);
INSERT INTO sell.product (name,price,discount,description,rating,saleCount,isNew,offerEnd,createdAt,approval_status,stock,category_id) VALUES
	 ('Luxury Sofa',500.00,20,'A luxurious sofa for your living room...',4.8,20,1,'2024-12-31 23:59:59','2024-05-23 02:00:26','pending',96,0),
	 ('Dining Table Set',300.00,15,'A complete dining table set...',4.7,25,1,'2024-11-15 12:00:00','2024-05-23 02:00:26','pending',12,0),
	 ('Queen Size Bed',450.00,25,'A comfortable queen size bed...',4.9,15,1,'2024-10-10 10:00:00','2024-05-23 02:00:26','pending',71,0),
	 ('Luxury Perfume',80.00,10,'A luxurious perfume...',4.5,50,1,'2024-09-05 14:00:00','2024-05-23 02:00:26','pending',18,0),
	 ('Car Model X',25000.00,5,'A high-performance car...',4.9,5,1,'2024-08-20 09:00:00','2024-05-23 02:00:26','pending',78,0),
	 ('Convertible Car',35000.00,10,'A stylish convertible car...',4.8,3,1,'2024-12-31 23:59:59','2024-05-23 02:00:26','pending',35,0),
	 ('Test',23.00,0,'desc',0.0,0,1,NULL,'2024-05-24 00:43:20','pending',5,0),
	 ('Test',23.00,0,'dd',0.0,0,1,NULL,'2024-05-24 00:47:19','pending',12,0),
	 ('Test',14.00,0,'desc',0.0,0,1,NULL,'2024-05-24 21:29:26','pending',16,0),
	 (' Audi Car 2017 A6',15000.00,0,'Used, Automatic, 5 Chair , Red Color, +20,000KM , Petrol.',0.0,0,1,NULL,'2024-05-24 23:13:07','pending',1,11);


-- sell.image definition

CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO sell.image (product_id,url) VALUES
	 (1,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (1,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (1,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (2,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (2,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (2,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (3,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (3,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (3,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (4,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg');
INSERT INTO sell.image (product_id,url) VALUES
	 (4,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (4,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (5,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (5,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (5,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (6,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (6,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (6,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (7,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (7,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg');
INSERT INTO sell.image (product_id,url) VALUES
	 (7,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (8,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (8,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (8,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (9,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (9,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (9,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (10,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (10,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (10,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg');
INSERT INTO sell.image (product_id,url) VALUES
	 (11,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (11,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (11,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (12,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (12,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (12,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (13,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (13,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (13,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (14,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg');
INSERT INTO sell.image (product_id,url) VALUES
	 (14,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (14,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (21,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (21,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (21,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (22,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (22,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (22,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (23,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (23,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg');
INSERT INTO sell.image (product_id,url) VALUES
	 (23,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (24,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (24,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (24,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (25,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (25,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (25,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (26,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (26,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (26,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg');
INSERT INTO sell.image (product_id,url) VALUES
	 (15,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (16,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (17,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (18,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (19,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (20,'https://i.ibb.co/v4Xy9Zg/pexels-garvin-st-villier-719266-3972755.jpg'),
	 (29,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716500839/sellstream/cqbbcfojdjmhqizq6v5z.jpg'),
	 (30,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716575365/sellstream/p6mnwozist1phahq44wq.jpg'),
	 (30,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716575365/sellstream/ehfxfht3clm8rr1tuppp.jpg'),
	 (31,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716581586/sellstream/m0dmyrbrsj2yzmgcq10d.jpg');
INSERT INTO sell.image (product_id,url) VALUES
	 (31,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716581586/sellstream/kdeujny8ajfjsf42mwkf.jpg'),
	 (31,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716581586/sellstream/cr9pilmxyno4up8cgg9y.jpg'),
	 (31,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716581586/sellstream/p6mkq2i3ehgc0j0tkioe.jpg'),
	 (31,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716581586/sellstream/hupcdoacu4ev7gvpgv5b.jpg'),
	 (31,'https://res.cloudinary.com/dlimj0w77/image/upload/v1716581586/sellstream/f32blnoak7g4c7ct01fp.jpg');

-- sell.`order` definition

CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `notes` text,
  `status` varchar(50) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `order_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO sell.`order` (user_id,first_name,last_name,street_address,city,email,phone_number,notes,status,total_amount,order_date_time) VALUES
	 (18,'First ','Last ','Steet ','City ','mmmmmmmmmm@gmail.com','phone ','test','pending',245.99,'2024-05-26 16:09:08'),
	 (18,'First ','Last ','Steet ','City ','mmmmmmmmmm@gmail.com','phone ','test','pending',49.80,'2024-05-26 16:11:02'),
	 (18,'First ','Last ','Steet ','City ','mmmmmmmmmm@gmail.com','phone ','test','pending',6.23,'2024-05-26 16:12:13'),
	 (18,'First ','Last ','Steet ','City ','mmmmmmmmmm@gmail.com','phone ','Test','pending',7.47,'2024-05-26 16:14:21'),
	 (18,'First ','Last ','Steet ','City ','mmmmmmmmmm@gmail.com','phone ','test','pending',44.82,'2024-05-26 16:16:02'),
	 (18,'','','','','','','','pending',33.61,'2024-05-26 16:24:11'),
	 (18,'','','','','','','','pending',33.61,'2024-05-26 16:24:57'),
	 (18,'','','','','','','','pending',33.61,'2024-05-26 16:31:07'),
	 (18,'','','','','','','','pending',44.82,'2024-05-26 16:37:31'),
	 (18,'','','','','','','','pending',44.82,'2024-05-26 16:37:56');
INSERT INTO sell.`order` (user_id,first_name,last_name,street_address,city,email,phone_number,notes,status,total_amount,order_date_time) VALUES
	 (18,'','','','','','','','pending',22.41,'2024-05-26 16:38:55');



-- sell.orderItem definition

CREATE TABLE `orderItem` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO sell.orderItem (order_id,product_id,quantity,unit_price,total_price) VALUES
	 (1,2,1,45.99,45.99),
	 (1,8,1,200.00,200.00),
	 (2,1,4,12.45,49.80),
	 (3,1,5,12.45,6.23),
	 (4,1,4,12.45,7.47),
	 (5,1,4,12.45,44.82),
	 (6,1,3,12.45,33.61),
	 (7,1,3,12.45,33.61),
	 (8,1,3,12.45,33.61),
	 (9,1,4,12.45,44.82);
INSERT INTO sell.orderItem (order_id,product_id,quantity,unit_price,total_price) VALUES
	 (10,1,4,12.45,44.82),
	 (11,1,2,12.45,22.41);
