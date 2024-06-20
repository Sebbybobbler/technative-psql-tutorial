CREATE TABLE sellers (
  seller_id integer PRIMARY KEY UNIQUE,
	seller_name varchar(75),
  email varchar(100),
  password varchar(50),
  bio varchar(200),
  join_date date
);

CREATE TABLE products (
  product_id integer PRIMARY KEY UNIQUE,
	product_title varchar(20),
  product_summary varchar(150),
  full_product text,
  price money,
  date_advertised date,
  seller_id integer REFERENCES sellers(seller_id)
);

INSERT INTO sellers (seller_id, seller_name, email, password, bio, join_date) VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', 'Loves selling gadgets.', '2023-01-15'),
(2, 'Jane Smith', 'jane.smith@example.com', 'password456', 'Tech enthusiast.', '2023-02-20'),
(3, 'Bob Johnson', 'bob.johnson@example.com', 'password789', 'Book collector.', '2023-03-05'),
(4, 'Alice Williams', 'alice.williams@example.com', 'passwordabc', 'Home decorator.', '2023-04-10'),
(5, 'Charlie Brown', 'charlie.brown@example.com', 'passworddef', 'Outdoor adventure expert.', '2023-05-25');

INSERT INTO products (product_id, product_title, product_summary, full_product, price, date_advertised, seller_id) VALUES
(1, 'Gadget Pro', 'Latest in tech gadgets.', 'The Gadget Pro is a cutting-edge device...', 199.99, '2023-06-01', 1),
(2, 'Techie Toolkit', 'Complete toolkit for techies.', 'This toolkit includes everything...', 49.99, '2023-06-05', 1),
(3, 'Smart Home Hub', 'Central hub for smart homes.', 'Connect all your smart devices...', 129.99, '2023-06-10', 2),
(4, 'Advanced VR Headset', 'Immersive virtual reality headset.', 'Experience the next level...', 299.99, '2023-06-15', 2),
(5, 'Fictional Novel', 'A thrilling fictional novel.', 'Dive into a world of adventure...', 14.99, '2023-06-20', 3),
(6, 'Historical Book', 'Detailed historical account.', 'Explore the events of the past...', 24.99, '2023-06-25', 3),
(7, 'Decorative Vase', 'Beautiful decorative vase.', 'Perfect for any home...', 39.99, '2023-06-30', 4),
(8, 'Wall Art', 'Abstract wall art.', 'Add a touch of elegance...', 89.99, '2023-07-05', 4),
(9, 'Camping Tent', 'Durable camping tent.', 'Great for outdoor adventures...', 99.99, '2023-07-10', 5),
(10, 'Hiking Backpack', 'Spacious hiking backpack.', 'Designed for comfort and durability...', 59.99, '2023-07-15', 5),
(11, 'Portable Stove', 'Compact portable stove.', 'Perfect for camping trips...', 49.99, '2023-07-20', 5);

SELECT product_title FROM products;

SELECT products.product_title, sellers.seller_name FROM products
JOIN sellers ON products.seller_id = sellers.seller_id;

SELECT seller_name FROM sellers;

SELECT sellers.seller_name, COUNT(products.seller_id) FROM sellers
JOIN products ON products.seller_id = sellers.seller_id
GROUP BY sellers.seller_name;

SELECT sellers.seller_name ,products.product_title FROM sellers
JOIN products ON products.seller_id = sellers.seller_id
WHERE sellers.seller_name = 'Alice Williams';

