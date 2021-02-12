/* 1. Create database */

CREATE DATABASE blog_php;

/* 2. Create posts table */

CREATE TABLE post (
                      post_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
                      title VARCHAR(255) NOT NULL,
                      url_key VARCHAR(255) NOT NULL,
                      image_path varchar(255) NULL,
                      content TEXT DEFAULT NULL,
                      description VARCHAR(255) DEFAULT NULL,
                      published_date DATETIME NOT NULL,
                      PRIMARY KEY (post_id),
                      UNIQUE KEY url_key (url_key)
) ENGINE=InnoDB;

/* 3. Add 3 posts into the posts table */

INSERT INTO post (title, url_key, content, description, published_date) VALUES ('Hello World', 'hello-world', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 'My first blog post', '2021-02-05 12:00:01');
INSERT INTO post (title, url_key, content, description, published_date) VALUES ('Second post', 'second-post', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.', 'My second blog post','2021-02-06 12:00:02');
INSERT INTO post (title, url_key, content, description, published_date) VALUES ('My third post', 'my-third-post', 'There are many variations of passages of Lorem Ipsum available. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don not look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there is not anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'My third blog post', '2021-02-07 12:00:03');
INSERT INTO post (title, url_key, content, description, published_date) VALUES ('Forth post', 'forth-post', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', 'My first blog post', '2021-02-08 12:00:04');
INSERT INTO post (title, url_key, content, description, published_date) VALUES ('Fifth post', 'fifth-post', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.', 'My second blog post','2021-02-09 12:00:05');
INSERT INTO post (title, url_key, content, description, published_date) VALUES ('Royal mail at Christmas', 'royal-mail-at-christmas', 'There are many variations of passages of Lorem Ipsum available. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don not look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there is not anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'My third blog post', '2021-02-10 12:00:06');

/* 4. Update image */
SELECT * FROM post;

UPDATE post SET image_path = 'public/images/christmas.png' WHERE post_id = 1;
UPDATE post SET image_path = 'public/images/christmas.png' WHERE post_id = 2;
UPDATE post SET image_path = 'public/images/christmas.png' WHERE post_id = 3;
UPDATE post SET image_path = 'public/images/christmas.png' WHERE post_id = 4;
UPDATE post SET image_path = 'public/images/christmas.png' WHERE post_id = 5;
UPDATE post SET image_path = 'public/images/christmas.png' WHERE post_id = 6;