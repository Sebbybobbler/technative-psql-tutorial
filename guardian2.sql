CREATE TABLE authors (
  author_id integer PRIMARY KEY UNIQUE,
  author_name varchar(50),
  email varchar(100),
  password varchar(100),
  bio varchar(400),
  join_date date
);

CREATE TABLE blogs (
	blog_id integer PRIMARY KEY,
  blog_title varchar(75),
  author_id integer REFERENCES authors(author_id),
  blog_summary varchar(500),
  blog_post varchar(5000),
  blog_date date 
);



INSERT INTO authors VALUES
(1, 'John Doe', 'john.doe@example.com', 'password123', 'John is an experienced writer and blogger with a passion for technology and travel.', '2023-01-15'),
(2, 'Jane Smith', 'jane.smith@example.com', 'securePass!45', 'Jane specializes in health and wellness topics and loves to share her knowledge through engaging articles.', '2022-11-20'),
(3, 'Alice Johnson', 'alice.johnson@example.com', 'aliceInWonderland77', 'Alice is a food enthusiast and critic who enjoys exploring new cuisines and sharing her culinary adventures.', '2023-05-10'),
(4, 'Bob Brown', 'bob.brown@example.com', 'b0bSecure$%123', 'Bob is a tech guru and software developer who writes about the latest trends in technology and programming.', '2021-09-30'),
(5, 'Catherine Green', 'catherine.green@example.com', 'catGreen!234', 'Catherine is a professional photographer who documents her travels and shares photography tips and tutorials.', '2023-03-18');

INSERT INTO blogs VALUES
(1, 'The Future of Technology', 1, 'An exploration into upcoming technology trends and innovations.', 
'Technology is evolving at an unprecedented pace. In this blog post, we explore some of the most exciting trends and innovations that are shaping the future. From artificial intelligence to quantum computing, the possibilities are endless...', 
'2023-02-01'),
(2, 'Healthy Living Tips', 2, 'Tips and tricks for maintaining a healthy lifestyle.', 
'Living a healthy lifestyle doesn''t have to be difficult. In this post, we share some simple tips and tricks that can help you stay fit and healthy. From balanced diets to effective workout routines, we cover it all...', 
'2023-02-10'),
(3, 'Exploring Exotic Cuisines', 3, 'A journey through some of the world''s most exotic and delicious cuisines.', 
'Food is a universal language, and in this blog post, we take you on a journey through some of the most exotic and delicious cuisines from around the world. Whether it''s the spicy flavors of India or the delicate tastes of Japan, there''s something for everyone...', 
'2023-03-05'),
(4, 'Latest Tech Gadgets', 4, 'A review of the latest gadgets in the tech world.', 
'The tech world is always buzzing with new gadgets and innovations. In this blog post, we review some of the latest and greatest tech gadgets that have hit the market. From smart home devices to the newest smartphones, we give you the lowdown...', 
'2023-01-20'),
(5, 'Travel Photography Tips', 5, 'Tips for capturing stunning travel photos.', 
'Travel photography is an art, and in this blog post, we share some of the best tips and techniques for capturing stunning travel photos. Whether you''re a beginner or a seasoned pro, these tips will help you take your travel photography to the next level...', 
'2023-04-15'),
(6, 'Advanced Programming Techniques', 4, 'An in-depth look at advanced programming techniques for modern software development.',
'In this blog post, we dive deep into some of the most advanced programming techniques that are being used in modern software development. From functional programming to metaprogramming, we cover a range of topics that will enhance your coding skills...',
'2023-06-10');

SELECT blog_title FROM blogs;

SELECT blogs.blog_title,authors.author_name
FROM blogs
JOIN authors ON blogs.author_id = authors.author_id;

SELECT author_name FROM authors;

SELECT author_name FROM authors ORDER BY author_name ASC;

SELECT COUNT(blogs.author_id), authors.author_name 
FROM blogs
JOIN authors ON blogs.author_id = authors.author_id
GROUP BY authors.author_name;

SELECT blogs.blog_post, authors.author_name
FROM blogs
JOIN authors ON blogs.author_id = authors.author_id;

SELECT blog_post, blog_date FROM blogs ORDER BY blog_date ASC;

ALTER TABLE blogs ADD COLUMN tags varchar(50) array;

UPDATE blogs SET tags = '{"technology", "AI", "innovation"}' WHERE blog_id = 1;
UPDATE blogs SET tags = '{"health", "wellness", "fitness"}' WHERE blog_id = 2;
UPDATE blogs SET tags = '{"health", "food", "travel"}' WHERE blog_id = 3;
UPDATE blogs SET tags = '{"gadgets", "technology", "review"}' WHERE blog_id = 4;
UPDATE blogs SET tags = '{"travel", "photography"}' WHERE blog_id = 5;
UPDATE blogs SET tags = '{"programming", "technology", "innovation"}' WHERE blog_id = 6;
UPDATE blogs SET tags = '{"food", "presentation", "cooking"}' WHERE blog_id = 7;

SELECT unnest(tags) FROM blogs;

SELECT unnest(tags), COUNT(tags) FROM blogs GROUP BY 1;

SELECT blog_post, tags FROM blogs WHERE blog_id=1;

SELECT 'travel' AS tag , blog_title FROM blogs
WHERE tags[1] = 'travel' OR tags[2] = 'travel' OR tags[3] = 'travel';


INSERT INTO blogs VALUES
(7, 'The Future of Technology', 3, 'An exploration into upcoming technology trends and innovations.', 
'Technology is evolving at an unprecedented pace. In this blog post, we explore some of the most exciting trends and innovations that are shaping the future. From artificial intelligence to quantum computing, the possibilities are endless...', 
'2023-02-01'),
(8, 'Healthy Living Tips', 4, 'Tips and tricks for maintaining a healthy lifestyle.', 
'Living a healthy lifestyle doesn''t have to be difficult. In this post, we share some simple tips and tricks that can help you stay fit and healthy. From balanced diets to effective workout routines, we cover it all...', 
'2023-02-10');

SELECT DISTINCT blog_title FROM blogs;

SELECT author_name FROM authors;

SELECT authors.author_name, COUNT(blogs.author_id) FROM authors
JOIN blogs ON authors.author_id = blogs.author_id
GROUP BY author_name;

SELECT blogs.blog_title, authors.author_name FROM blogs
JOIN authors ON authors.author_id = blogs.author_id
WHERE authors.author_name = 'Alice Johnson';

SELECT blogs.blog_title, authors.author_name FROM blogs
JOIN authors ON authors.author_id = blogs.author_id
WHERE blogs.blog_title = 'The Future of Technology';

ALTER TABLE blogs ALTER COLUMN blog_post TYPE text;

ALTER TABLE blogs ALTER COLUMN blog_summary TYPE text;

ALTER TABLE authors ALTER COLUMN bio TYPE text;

ALTER TABLE authors ALTER COLUMN password SET NOT NULL;

ALTER TABLE authors ALTER COLUMN  author_id TYPE SERIAL; #

ALTER TABLE blogs DROP COLUMN tags;

CREATE TABLE tags (
	blog_id INTEGER REFERENCES blogs(blog_id),
  author_id INTEGER REFERENCES authors(author_id),
  tag varchar(50)
);

INSERT INTO tags (blog_id, author_id, tag) VALUES
(1, 1, 'technology'),
(1, 1, 'AI'),
(1, 1, 'innovation'),
(2, 2, 'health'),
(2, 2, 'wellness'),
(2, 2, 'fitness'),
(3, 3, 'food'),
(3, 3, 'cuisine'),
(3, 3, 'travel'),
(4, 4, 'gadgets'),
(4, 4, 'technology'),
(4, 4, 'review'),
(5, 5, 'photography'),
(5, 5, 'travel'),
(5, 5, 'tips'),
(6, 4, 'programming'),
(6, 4, 'software development'),
(6, 4, 'techniques'),
(7, 3, 'food'),
(7, 3, 'presentation'),
(7, 3, 'cooking');


