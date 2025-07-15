CREATE SCHEMA food_restaurant_business ;

USE food_restaurant_business;


-- Create Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    city VARCHAR(50) NOT NULL
);
INSERT INTO customers (customer_id, customer_name, email, phone, city)
VALUES
(1, 'Mr. Jeremiah Reeves', 'matthew81@hernandez.com','001-316-658-7603x669', 'Port Nicoleshire'),
(2, 'Aaron Bell', 'vmedina@hotmail.com', '+1-373-467-0656x272', 'South Brittanytown'),
(3, 'Jeffrey Camacho', 'greenmark@murphy-juarez.biz', '641-708-0531x003', 'Port Andrew'),
(4, 'Cameron Caldwell', 'xlyons@jackson-lawson.com', '001-241-9663x19314', 'Port Tonyaton'),
(5, 'Jeffrey Wood', 'atkinsonlynn@gmail.com', '(572)628-4987x76945', 'Port Sarah'),
(6, 'Jerry Christensen', 'anthony52@yahoo.com', '545.494.8083', 'East Jenniferfort'),
(7, 'Cynthia Alvarez', 'fmcguire@yahoo.com', '634.957.8856', 'Michaelmouth'),
(8, 'David Martinez', 'david82@robinson.com', '001-989-4352x4082', 'Brandonton'),
(9, 'Melissa Martinez', 'salasaudrey@yahoo.com', '752.047.1167x1902', 'Port Anna'),
(10, 'Xavier Wilson', 'kimberlyjames@yahoo.com', '964-990-9133x4123', 'New Charles'),
(11, 'Jerry Wheeler', 'halljasmine@hotmail.com', '134.936.1832x421', 'East Laurashire'),
(12, 'Jessica Harrison', 'gbender@hotmail.com', '719.065.9401x3990', 'Barbaraburgh'),
(13, 'Matthew Moon', 'fwalters@harrison.com', '125-674-6807x15451', 'Hancocktown'),
(14, 'Kimberly Gutierrez', 'cindy77@harris.com', '771-093-2480x8613', 'South Staceyberg'),
(15, 'Dr. Jordan Hill PhD', 'stephenthomas@gmail.com', '+1-821-465-8404x499', 'Grimesmouth'),
(16, 'Haley Arnold', 'mcantu@hotmail.com', '963.605.7662', 'Hannaberg'),
(17, 'Leslie Kane', 'foxstephen@hotmail.com', '(621)745-9615', 'Finleyfort'),
(18, 'Amanda Jones', 'juliehamilton@gmail.com', '001-172-5045x56238', 'Knightburgh'),
(19, 'Bob Pitts', 'jdurham@murray.info', '074-821-7594x647', 'Jamesfurt'),
(20, 'Ashley James', 'victoria40@hotmail.com', '(409)097-4395x3394', 'Lake Colton');

-- Create Restaurants table
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
);
INSERT INTO restaurants (restaurant_id, restaurant_name, cuisine, city)
VALUES
(1, 'Lucas, Parker and Alexander', 'American', 'Jessicaland'),
(2, 'Murphy-Perry', 'Indian', 'East Kristin'),
(3, 'Schmidt-Mcintyre', 'Indian', 'West Robin'),
(4, 'Coffey-Phillips', 'Italian', 'Lindamouth'),
(5, 'Taylor and Sons', 'Indian', 'Coffeyside'),
(6, 'Davis-Foster', 'Mexican', 'Amandamouth'),
(7, 'Chambers-Chambers', 'Chinese', 'Carsonstad'),
(8, 'Leonard Group', 'Mexican', 'New Nicoleside'),
(9, 'Herman-Walker', 'Italian', 'Lake Madisonport'),
(10, 'Ortiz, Taylor and Shah', 'Indian', 'Wendyville');


-- Create Riders table
CREATE TABLE riders (
    rider_id INT PRIMARY KEY,
    rider_name VARCHAR(100) NOT NULL,
    vehicle VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL
);
INSERT INTO riders (rider_id, rider_name, vehicle, phone)
VALUES
(1, 'Stephen Taylor', 'Car', '586.926.1796x405'),
(2, 'Jeremy Young', 'Bike', '(158)506-4317x139'),
(3, 'Amber Cook', 'Car', '(931)839-3352'),
(4, 'Linda Ramirez', 'Bike', '(284)210-2053'),
(5, 'Alexis Baker', 'Car', '(681)177-5891'),
(6, 'Daniel Gilbert', 'Scooter', '001-847-6617x7115'),
(7, 'Ana Hill', 'Car', '+1-985-698-4789x6118'),
(8, 'Cindy Hayes', 'Car', '657.661.5654'),
(9, 'Christian Leblanc', 'Car', '111-615-2809'),
(10, 'Kristina Santiago', 'Bike', '(560)494-5198x32731');

-- Create Menu Items table
CREATE TABLE menu_items (
    menu_item_id INT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    item_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);
-- Insert into Menu Items (with realistic dish names)
INSERT INTO menu_items (menu_item_id, restaurant_id, item_name, price)
VALUES
-- Indian Restaurant (ID 2)
(6, 2, 'Chicken Tikka Masala', 285),
(10, 2, 'Lamb Rogan Josh', 474),
(23, 2, 'Paneer Butter Masala', 226),
(29, 2, 'Mixed Grill Platter', 462),
(31, 2, 'Vegetable Biryani', 116),

-- Indian Restaurant (ID 3)
(1, 3, 'Butter Chicken', 291),
(2, 3, 'Chicken Biryani', 376),
(13, 3, 'Vegetable Samosa', 165),
(15, 3, 'Tandoori Chicken', 235),

-- Italian Restaurant (ID 4)
(19, 4, 'Spaghetti Carbonara', 465),
(24, 4, 'Garlic Bread', 132),
(27, 4, 'Fettuccine Alfredo', 401),
(28, 4, 'Minestrone Soup', 103),
(40, 4, 'Tiramisu', 148),

-- Indian Restaurant (ID 5)
(7, 5, 'Dal Makhani', 222),
(20, 5, 'Chicken Tikka', 304),
(34, 5, 'Mutton Curry', 442),

-- Mexican Restaurant (ID 6)
(21, 6, 'Chicken Enchiladas', 324),
(25, 6, 'Vegetable Fajitas', 110),
(32, 6, 'Beef Tacos', 136),

-- Chinese Restaurant (ID 7)
(17, 7, 'Kung Pao Chicken', 208),

-- Mexican Restaurant (ID 8)
(5, 8, 'Tacos al Pastor', 109),
(11, 8, 'Chicken Quesadilla', 135),
(14, 8, 'Beef Burrito', 381),
(35, 8, 'Nachos Supreme', 209),
(38, 8, 'Chicken Fajitas', 224),
(39, 8, 'Chimichanga', 308),

-- Italian Restaurant (ID 9)
(3, 9, 'Margherita Pizza', 100),
(12, 9, 'Pepperoni Pizza', 492),
(16, 9, 'Four Cheese Pizza', 410),
(18, 9, 'Truffle Pizza', 486),
(22, 9, 'Hawaiian Pizza', 331),
(33, 9, 'Mushroom Pizza', 221),
(36, 9, 'Vegetable Pizza', 167),

-- Indian Restaurant (ID 10)
(4, 10, 'Palak Paneer', 265),
(9, 10, 'Garlic Naan', 140),
(26, 10, 'Butter Naan', 383),
(37, 10, 'Chicken Korma', 395),

-- American Restaurant (ID 1)
(8, 1, 'Classic Cheeseburger', 223),
(30, 1, 'BBQ Ribs', 217);


-- Create Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    rider_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id),
    FOREIGN KEY (rider_id) REFERENCES riders(rider_id)
);

select * from restaurants;
-- Insert into Orders
INSERT INTO orders (order_id, customer_id, restaurant_id, rider_id, order_date)
VALUES
(1, 4, 7, 6, '2025-05-16'),
(2, 14, 7, 8, '2025-05-08'),
(3, 2, 2, 1, '2025-04-22'),
(4, 13, 6, 2, '2025-04-25'),
(5, 8, 4, 4, '2025-04-20'),
(6, 18, 8, 3, '2025-04-23'),
(7, 14, 3, 5, '2025-05-14'),
(8, 15, 4, 2, '2025-04-29'),
(9, 15, 9, 2, '2025-05-07'),
(10, 2, 9, 1, '2025-05-09'),
(11, 3, 4, 3, '2025-05-11'),
(12, 14, 8, 8, '2025-05-05'),
(13, 7, 7, 1, '2025-04-26'),
(14, 6, 7, 1, '2025-05-06'),
(15, 13, 5, 8, '2025-05-04'),
(16, 10, 7, 9, '2025-05-04'),
(17, 16, 3, 4, '2025-05-16'),
(18, 10, 4, 1, '2025-05-17'),
(19, 19, 9, 1, '2025-04-23'),
(20, 11, 1, 1, '2025-04-21'),
(21, 19, 8, 9, '2025-04-26'),
(22, 17, 3, 1, '2025-04-26'),
(23, 17, 2, 3, '2025-05-18'),
(24, 3, 10, 2, '2025-04-21'),
(25, 8, 7, 2, '2025-04-22'),
(26, 19, 4, 10, '2025-05-02'),
(27, 20, 1, 10, '2025-05-10'),
(28, 3, 7, 10, '2025-05-09'),
(29, 19, 9, 6, '2025-05-12'),
(30, 9, 4, 6, '2025-05-18');

-- Create Order Items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items(menu_item_id)
);
-- Insert into Order Items
INSERT INTO order_items (order_item_id, order_id, menu_item_id, quantity)
VALUES
(1, 1, 17, 2),  -- Order 1: 2x Kung Pao Chicken
(2, 2, 20, 2),  -- Order 2: 2x Chicken Tikka
(3, 3, 5, 1),   -- Order 3: 1x Tacos al Pastor
(4, 3, 30, 3),  -- Order 3: 3x BBQ Ribs
(5, 4, 7, 1),   -- Order 4: 1x Dal Makhani
(6, 4, 35, 1),  -- Order 4: 1x Nachos Supreme
(7, 4, 33, 2),  -- Order 4: 2x Mushroom Pizza
(8, 5, 23, 1),  -- Order 5: 1x Paneer Butter Masala
(9, 6, 24, 2),  -- Order 6: 2x Garlic Bread
(10, 7, 29, 3), -- Order 7: 3x Mixed Grill Platter
(11, 8, 20, 3), -- Order 8: 3x Chicken Tikka
(12, 8, 34, 1), -- Order 8: 1x Mutton Curry
(13, 8, 36, 2), -- Order 8: 2x Vegetable Pizza
(14, 9, 7, 1),  -- Order 9: 1x Dal Makhani
(15, 9, 17, 1), -- Order 9: 1x Kung Pao Chicken
(16, 9, 7, 3),  -- Order 9: 3x Dal Makhani
(17, 10, 10, 2),-- Order 10: 2x Lamb Rogan Josh
(18, 10, 19, 3),-- Order 10: 3x Spaghetti Carbonara
(19, 10, 14, 3),-- Order 10: 3x Beef Burrito
(20, 11, 14, 3),-- Order 11: 3x Beef Burrito
(21, 11, 17, 3),-- Order 11: 3x Kung Pao Chicken
(22, 12, 17, 1),-- Order 12: 1x Kung Pao Chicken
(23, 12, 6, 3), -- Order 12: 3x Chicken Tikka Masala
(24, 13, 18, 1),-- Order 13: 1x Truffle Pizza
(25, 13, 1, 2), -- Order 13: 2x Butter Chicken
(26, 14, 17, 1),-- Order 14: 1x Kung Pao Chicken
(27, 15, 29, 3),-- Order 15: 3x Mixed Grill Platter
(28, 15, 28, 3),-- Order 15: 3x Minestrone Soup
(29, 15, 1, 1), -- Order 15: 1x Butter Chicken
(30, 16, 10, 3),-- Order 16: 3x Lamb Rogan Josh
(31, 17, 24, 3),-- Order 17: 3x Garlic Bread
(32, 18, 10, 2),-- Order 18: 2x Lamb Rogan Josh
(33, 18, 9, 1), -- Order 18: 1x Garlic Naan
(34, 18, 20, 2),-- Order 18: 2x Chicken Tikka
(35, 19, 23, 1),-- Order 19: 1x Paneer Butter Masala
(36, 20, 16, 3),-- Order 20: 3x Four Cheese Pizza
(37, 20, 7, 2), -- Order 20: 2x Dal Makhani
(38, 20, 36, 2),-- Order 20: 2x Vegetable Pizza
(39, 21, 10, 1),-- Order 21: 1x Lamb Rogan Josh
(40, 21, 11, 1),-- Order 21: 1x Chicken Quesadilla
(41, 21, 27, 1),-- Order 21: 1x Fettuccine Alfredo
(42, 22, 22, 2),-- Order 22: 2x Hawaiian Pizza
(43, 23, 16, 2),-- Order 23: 2x Four Cheese Pizza
(44, 23, 11, 3),-- Order 23: 3x Chicken Quesadilla
(45, 23, 7, 2), -- Order 23: 2x Dal Makhani
(46, 24, 31, 1),-- Order 24: 1x Vegetable Biryani
(47, 25, 30, 2),-- Order 25: 2x BBQ Ribs
(48, 26, 15, 1),-- Order 26: 1x Tandoori Chicken
(49, 26, 2, 3), -- Order 26: 3x Chicken Biryani
(50, 27, 26, 2),-- Order 27: 2x Butter Naan
(51, 28, 5, 2), -- Order 28: 2x Tacos al Pastor
(52, 28, 23, 3),-- Order 28: 3x Paneer Butter Masala
(53, 29, 26, 3),-- Order 29: 3x Butter Naan
(54, 29, 35, 2),-- Order 29: 2x Nachos Supreme
(55, 29, 2, 1), -- Order 29: 1x Chicken Biryani
(56, 30, 12, 3),-- Order 30: 3x Pepperoni Pizza
(57, 30, 17, 1);-- Order 30: 1x Kung Pao Chicken

-- Create Payments table
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
-- Insert into Payments
INSERT INTO payments (payment_id, order_id, amount, payment_method, payment_date)
VALUES
(1, 1, 286.72, 'Card', '2025-05-16'),
(2, 2, 476.55, 'Card', '2025-05-08'),
(3, 3, 549.12, 'Cash', '2025-04-22'),
(4, 4, 292.52, 'Cash', '2025-04-25'),
(5, 5, 352.06, 'UPI', '2025-04-20'),
(6, 6, 767.03, 'UPI', '2025-04-23'),
(7, 7, 615.94, 'Cash', '2025-05-14'),
(8, 8, 749.49, 'Cash', '2025-04-29'),
(9, 9, 789.63, 'UPI', '2025-05-07'),
(10, 10, 491.38, 'UPI', '2025-05-09'),
(11, 11, 959.10, 'Card', '2025-05-11'),
(12, 12, 698.52, 'Cash', '2025-05-05'),
(13, 13, 878.41, 'Cash', '2025-04-26'),
(14, 14, 920.04, 'Cash', '2025-05-06'),
(15, 15, 447.43, 'Card', '2025-05-04'),
(16, 16, 460.95, 'Cash', '2025-05-04'),
(17, 17, 436.52, 'UPI', '2025-05-16'),
(18, 18, 353.47, 'Cash', '2025-05-17'),
(19, 19, 952.29, 'Cash', '2025-04-23'),
(20, 20, 798.51, 'UPI', '2025-04-21'),
(21, 21, 692.41, 'Card', '2025-04-26'),
(22, 22, 524.86, 'UPI', '2025-04-26'),
(23, 23, 443.10, 'UPI', '2025-05-18'),
(24, 24, 543.91, 'Cash', '2025-04-21'),
(25, 25, 685.33, 'Card', '2025-04-22'),
(26, 26, 571.99, 'Card', '2025-05-02'),
(27, 27, 740.50, 'Cash', '2025-05-10'),
(28, 28, 578.55, 'Cash', '2025-05-09'),
(29, 29, 335.75, 'UPI', '2025-05-12'),
(30, 30, 427.03, 'Cash', '2025-05-18');

-- Create Ratings table
CREATE TABLE ratings (
    rating_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review TEXT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
-- Insert into Ratings
INSERT INTO ratings (rating_id, order_id, rating, review)
VALUES
(1, 1, 3, 'The Kung Pao Chicken was good but could be spicier. Delivery was on time.'),
(2, 2, 2, 'Chicken Tikka was dry and not flavorful. Disappointed with the quality.'),
(3, 3, 3, 'Tacos were decent but the BBQ ribs were excellent. Mixed experience.'),
(4, 4, 5, 'Everything was perfect! Dal Makhani was creamy and delicious. Will order again!'),
(5, 5, 4, 'Paneer dish was great, but the delivery took longer than expected.'),
(6, 6, 2, 'Garlic bread was stale. Not worth the price.'),
(7, 7, 3, 'Mixed grill was okay, but some items were overcooked. Average experience.'),
(8, 8, 4, 'Chicken Tikka and Mutton Curry were excellent. Pizza was good too.'),
(9, 9, 1, 'Food arrived cold and the Dal was undercooked. Terrible experience.'),
(10, 10, 3, 'Lamb Rogan Josh was good but the pasta was too salty. Average meal.'),
(11, 11, 2, 'Burritos were dry and lacked flavor. Not ordering from here again.'),
(12, 12, 3, 'Chicken Tikka Masala was decent but nothing special.'),
(13, 13, 3, 'Truffle pizza was interesting but too expensive for what you get.'),
(14, 14, 3, 'Kung Pao Chicken was okay, but not as good as last time.'),
(15, 15, 5, 'Mixed grill platter was amazing! Everything was cooked perfectly.'),
(16, 16, 1, 'Lamb dish was overcooked and tough. Worst order ever.'),
(17, 17, 2, 'Garlic bread was burnt. Very disappointed.'),
(18, 18, 2, 'Lamb Rogan Josh was too spicy and the naan was dry.'),
(19, 19, 2, 'Paneer dish was average. Expected better for the price.'),
(20, 20, 4, 'Four Cheese Pizza was delicious! Would order again.'),
(21, 21, 2, 'Lamb was fatty and quesadilla was soggy. Not good.'),
(22, 22, 2, 'Hawaiian pizza had too much pineapple and not enough ham.'),
(23, 23, 1, 'Pizza arrived cold and cheese was congealed. Terrible.'),
(24, 24, 4, 'Vegetable Biryani was flavorful and aromatic. Very good.'),
(25, 25, 4, 'BBQ Ribs were fall-off-the-bone tender. Excellent!'),
(26, 26, 3, 'Tandoori Chicken was good but Chicken Biryani was dry.'),
(27, 27, 5, 'Butter Naan was perfect - soft and buttery. Best Ive had!'),
(28, 28, 4, 'Tacos were fresh and Paneer dish was creamy. Good meal.'),
(29, 29, 4, 'Butter Naan and Nachos were great. Chicken Biryani was okay.'),
(30, 30, 1, 'Pepperoni Pizza was burnt and Kung Pao Chicken was too salty.');

-- Create Delivery Logs table
CREATE TABLE delivery_logs (
    log_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    pickup_time DATETIME NOT NULL,
    delivery_time DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
-- Insert into Delivery Logs
INSERT INTO delivery_logs (log_id, order_id, pickup_time, delivery_time)
VALUES
(1, 1, '2025-05-16 00:30:00', '2025-05-16 01:19:00'),
(2, 2, '2025-05-08 00:20:00', '2025-05-08 00:45:00'),
(3, 3, '2025-04-22 00:17:00', '2025-04-22 01:23:00'),
(4, 4, '2025-04-25 00:19:00', '2025-04-25 00:54:00'),
(5, 5, '2025-04-20 00:16:00', '2025-04-20 00:49:00'),
(6, 6, '2025-04-23 00:10:00', '2025-04-23 00:42:00'),
(7, 7, '2025-05-14 00:17:00', '2025-05-14 01:10:00'),
(8, 8, '2025-04-29 00:29:00', '2025-04-29 01:29:00'),
(9, 9, '2025-05-07 00:12:00', '2025-05-07 01:09:00'),
(10, 10, '2025-05-09 00:23:00', '2025-05-09 01:20:00'),
(11, 11, '2025-05-11 00:28:00', '2025-05-11 00:52:00'),
(12, 12, '2025-05-05 00:22:00', '2025-05-05 01:11:00'),
(13, 13, '2025-04-26 00:22:00', '2025-04-26 00:55:00'),
(14, 14, '2025-05-06 00:14:00', '2025-05-06 01:21:00'),
(15, 15, '2025-05-04 00:10:00', '2025-05-04 01:28:00'),
(16, 16, '2025-05-04 00:13:00', '2025-05-04 01:29:00'),
(17, 17, '2025-05-16 00:23:00', '2025-05-16 00:54:00'),
(18, 18, '2025-05-17 00:15:00', '2025-05-17 01:24:00'),
(19, 19, '2025-04-23 00:26:00', '2025-04-23 01:09:00'),
(20, 20, '2025-04-21 00:11:00', '2025-04-21 01:15:00'),
(21, 21, '2025-04-26 00:17:00', '2025-04-26 00:47:00'),
(22, 22, '2025-04-26 00:24:00', '2025-04-26 00:48:00'),
(23, 23, '2025-05-18 00:24:00', '2025-05-18 01:22:00'),
(24, 24, '2025-04-21 00:26:00', '2025-04-21 01:15:00'),
(25, 25, '2025-04-22 00:29:00', '2025-04-22 01:00:00'),
(26, 26, '2025-05-02 00:24:00', '2025-05-02 01:19:00'),
(27, 27, '2025-05-10 00:26:00', '2025-05-10 01:07:00'),
(28, 28, '2025-05-09 00:27:00', '2025-05-09 01:08:00'),
(29, 29, '2025-05-12 00:15:00', '2025-05-12 01:27:00'),
(30, 30, '2025-05-18 00:25:00', '2025-05-18 01:08:00');

CREATE TABLE vehicle (
    vehicle_id INT PRIMARY KEY,
    rider_id INT NOT NULL,
    vehicle_type VARCHAR(20) NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    registration_number VARCHAR(20) UNIQUE NOT NULL,
    insurance_expiry DATE NOT NULL,
    last_maintenance_date DATE NOT NULL,
    capacity_kg DECIMAL(5,2) NOT NULL,
    fuel_type VARCHAR(20) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (rider_id) REFERENCES riders(rider_id)
);


INSERT INTO vehicle (vehicle_id, rider_id, vehicle_type, make, model, year, registration_number, insurance_expiry, last_maintenance_date, capacity_kg, fuel_type, is_active)
VALUES
-- Cars
(1, 1, 'Car', 'Toyota', 'Corolla', 2020, 'TN01AB1234', '2025-12-31', '2025-06-15', 200, 'Petrol', TRUE),
(2, 3, 'Car', 'Honda', 'Civic', 2019, 'MH02CD5678', '2026-01-15', '2025-05-20', 180, 'Petrol', TRUE),
(3, 5, 'Car', 'Maruti', 'Swift', 2021, 'KA03EF9012', '2025-12-15', '2025-09-05', 150, 'Petrol', TRUE),
(4, 7, 'Car', 'Hyundai', 'Creta', 2022, 'DL04GH3456', '2025-11-30', '2025-07-20', 250, 'Diesel', TRUE),
(5, 8, 'Car', 'Kia', 'Seltos', 2021, 'AP05IJ6789', '2026-03-31', '2025-08-15', 220, 'Diesel', TRUE),
(6, 9, 'Car', 'Mahindra', 'Thar', 2023, 'WB06KL0123', '2025-12-31', '2025-09-10', 300, 'Diesel', TRUE),

-- Bikes
(7, 2, 'Bike', 'Hero', 'Splendor', 2021, 'MH07MN4567', '2025-11-30', '2025-07-01', 50, 'Petrol', TRUE),
(8, 4, 'Bike', 'Bajaj', 'Pulsar', 2022, 'TN08OP8901', '2025-10-31', '2025-08-10', 60, 'Petrol', TRUE),
(9, 10, 'Bike', 'Royal Enfield', 'Classic 350', 2022, 'KA09QR2345', '2026-01-31', '2025-10-05', 70, 'Petrol', TRUE),

-- Scooter
(10, 6, 'Scooter', 'TVS', 'Jupiter', 2020, 'DL10ST6789', '2026-02-28', '2025-06-30', 80, 'Petrol', TRUE);

INSERT INTO vehicle (vehicle_id, rider_id, vehicle_type, make, model, year, registration_number, insurance_expiry, last_maintenance_date, capacity_kg, fuel_type, is_active)
VALUES
-- Cars
(1, 1, 'Car', 'Toyota', 'Corolla', 2020, 'TN01AB1234', '2025-12-31', '2025-06-15', 200, 'Petrol', TRUE),
(2, 3, 'Car', 'Honda', 'Civic', 2019, 'MH02CD5678', '2026-01-15', '2025-05-20', 180, 'Petrol', TRUE),
(3, 5, 'Car', 'Maruti', 'Swift', 2021, 'KA03EF9012', '2025-12-15', '2025-09-05', 150, 'Petrol', TRUE),
(4, 7, 'Car', 'Hyundai', 'Creta', 2022, 'DL04GH3456', '2025-11-30', '2025-07-20', 250, 'Diesel', TRUE),
(5, 8, 'Car', 'Kia', 'Seltos', 2021, 'AP05IJ6789', '2026-03-31', '2025-08-15', 220, 'Diesel', TRUE),
(6, 9, 'Car', 'Mahindra', 'Thar', 2023, 'WB06KL0123', '2025-12-31', '2025-09-10', 300, 'Diesel', TRUE),

-- Bikes
(7, 2, 'Bike', 'Hero', 'Splendor', 2021, 'MH07MN4567', '2025-11-30', '2025-07-01', 50, 'Petrol', TRUE),
(8, 4, 'Bike', 'Bajaj', 'Pulsar', 2022, 'TN08OP8901', '2025-10-31', '2025-08-10', 60, 'Petrol', TRUE),
(9, 10, 'Bike', 'Royal Enfield', 'Classic 350', 2022, 'KA09QR2345', '2026-01-31', '2025-10-05', 70, 'Petrol', TRUE),

-- Scooter
(10, 6, 'Scooter', 'TVS', 'Jupiter', 2020, 'DL10ST6789', '2026-02-28', '2025-06-30', 80, 'Petrol', TRUE);

SELECT * FROM vehicle;

INSERT INTO riders (rider_id, rider_name, vehicle, phone)
VALUES
(11, 'New Rider 1', 'Car', '555-111-2222'),
(12, 'New Rider 2', 'Bike', '555-333-4444');

SELECT * FROM vehicle;