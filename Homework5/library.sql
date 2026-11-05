DROP DATABASE IF EXISTS library;
CREATE DATABASE library;
USE library;

-- task 2 avtorebi
CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    birth_year INT,
    CONSTRAINT chk_author_birth CHECK (birth_year > 1000)
);

-- task 3 books
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(30) NOT NULL,
    pages INT,
    published_year INT,
    price DECIMAL(6,2) DEFAULT 0.00 NOT NULL,
    copies INT DEFAULT 1 NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors(id),
    
    CONSTRAINT chk_pages CHECK (pages > 0),
    CONSTRAINT chk_pub_year CHECK (published_year > 1000),
    CONSTRAINT chk_price CHECK (price >= 0),
    CONSTRAINT chk_copies CHECK (copies >= 0)
);

-- task 4 members table
CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    birth_date DATE,
    joined_on DATE NOT NULL,
    
    CONSTRAINT chk_email CHECK (email LIKE '%@%'),
    CONSTRAINT chk_joined_date CHECK (joined_on > birth_date)
);

-- task 5 loans 
CREATE TABLE loans (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    member_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (member_id) REFERENCES members(id),
    CONSTRAINT chk_return_date CHECK (return_date IS NULL OR return_date >= loan_date)
);

-- task 6 phone column 
ALTER TABLE members ADD COLUMN phone VARCHAR(20);

-- second part B 

-- task 7 insert authors 
INSERT INTO authors (name, country, birth_year) VALUES
('Ilia Chavchavadze', 'Georgia', 1837),
('Nodar Dumbadze', 'Georgia', 1928),
('Vazha-Pshavela', 'Georgia', 1861),
('J.R.R. Tolkien', 'United Kingdom', 1892),
('George Orwell', 'United Kingdom', 1903),
('Agatha Christie', 'United Kingdom', 1890),
('Jules Verne', 'France', 1828),
('Mark Twain', 'USA', 1835);

-- task 8 members
INSERT INTO members (first_name, last_name, email, city, birth_date, joined_on, phone) VALUES
('Nika', 'Beridze', 'nika.b@gmail.com', 'Tbilisi', '2009-03-14', '2025-09-01', '555 12 34 56'),
('Ana', 'Kapanadze', 'ana.k@mail.ge', 'Batumi', '2010-07-22', '2025-09-15', NULL),
('Giorgi', 'Lomidze', 'giorgi.l@gmail.com', 'Kutaisi', '2008-11-05', '2025-10-02', '599 34 56 78'),
('Mariam', 'Gelashvili', 'mariam.g@gmail.com', 'Tbilisi', '2011-05-30', '2026-01-20', '551 45 67 89'),
('Luka', 'Tsiklauri', 'luka.t@gmail.com', 'Rustavi', '2009-09-12', '2026-02-11', NULL),
('Nino', 'Abashidze', 'nino.a@yahoo.com', 'Tbilisi', '2010-01-25', '2026-03-03', '593 67 89 01'),
('Dato', 'Maisuradze', 'dato.m@gmail.com', 'Batumi', '2008-12-01', '2026-04-18', '571 11 22 33'),
('Salome', 'Javakhishvili', 'salome.j@gmail.com', 'Zugdidi', '2011-04-18', '2026-09-09', NULL);

-- task 9 
INSERT INTO books (title, author_id, genre, pages, published_year, price, copies) VALUES
('The Hobbit', 4, 'Fantasy', 310, 1937, 24.90, 4),
('The Fellowship of the Ring', 4, 'Fantasy', 423, 1954, 32.50, 3),
('The Two Towers', 4, 'Fantasy', 352, 1954, 32.50, 2),
('1984', 5, 'Dystopia', 328, 1949, 19.90, 5),
('Animal Farm', 5, 'Dystopia', 112, 1945, 12.50, 6),
('Murder on the Orient Express', 6, 'Detective', 256, 1934, 15.00, 3),
('And Then There Were None', 6, 'Detective', 272, 1939, 15.00, 2),
('Around the World in Eighty Days', 7, 'Adventure', 240, 1872, 14.20, 3),
('Twenty Thousand Leagues Under the Seas', 7, 'Adventure', 448, 1870, 18.90, 2),
('The Adventures of Tom Sawyer', 8, 'Adventure', 274, 1876, 13.40, 4),
('Kacia-Adamiani?!', 1, 'Classic', 160, 1863, 10.00, 3),
('Otaraant Kvrivi', 1, 'Classic', 140, 1888, 9.50, 2),
('Me, Grandma, Iliko and Illarion', 2, 'Novel', 220, 1960, 11.00, 5),
('The Law of Eternity', 2, 'Novel', 304, 1978, 14.00, 3),
('Aluda Ketelauri', 3, 'Poetry', 64, 1888, 8.00, 2),
('Host and Guest', 3, 'Poetry', 72, 1893, 8.50, 1);

INSERT INTO loans (book_id, member_id, loan_date, return_date) VALUES
(1, 1, '2026-01-10', '2026-01-24'),
(4, 2, '2026-01-12', '2026-01-30'),
(13, 3, '2026-01-15', '2026-02-01'),
(2, 1, '2026-02-02', '2026-02-20'),
(6, 4, '2026-02-05', '2026-02-19'),
(1, 6, '2026-02-10', '2026-02-28'),
(10, 3, '2026-03-01', '2026-03-15'),
(4, 6, '2026-03-04', '2026-03-20'),
(13, 4, '2026-03-10', '2026-03-25'),
(8, 7, '2026-04-20', '2026-05-02'),
(1, 2, '2026-05-05', '2026-05-19'),
(3, 1, '2026-05-12', '2026-06-01'),
(11, 6, '2026-06-03', '2026-06-17'),
(7, 4, '2026-07-08', '2026-07-22'),
(13, 1, '2026-09-14', '2026-09-30'),
(9, 3, '2026-10-01', NULL),
(1, 4, '2026-10-12', NULL),
(5, 7, '2026-10-15', NULL),
(14, 6, '2026-10-20', NULL),
(4, 1, '2026-10-28', NULL);

-- task 10

INSERT INTO books (title, author_id, genre, pages, published_year, price) 
VALUES ('CHildren of captain grant', 7, 'Adventure', 460, 1867, 24.44);
SELECT * FROM books WHERE title = 'CHildren of captain grant';
-- ამ სვეტს თავიდანვე ჰქონდა მითითებული DEFAULT 1 და რადგან ახალი წიგნის დამატებისას რაოდენობა არ მივუთითეთდა მაგიტო ბაზამ ავტომატურად ეს 1 ჩაწერა copies-ში

-- task 11 

-- INSERT INTO loans (book_id, member_id, loan_date) VALUES (1, 99, '2026-11-05');
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`library`.`loans`, CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`))
-- Answer: იმიტომ დაერორდა რო 99 აიდიანი წევრი საერთოდ არ არსებობს ბაზაში და foreign key-მ არ გაატარა

-- task 12
UPDATE members SET city = 'Kutaisi' WHERE id = 7;

-- task 13
SET SQL_SAFE_UPDATES = 0;

UPDATE books SET price = price * 1.10 WHERE genre = 'Fantasy';

SET SQL_SAFE_UPDATES = 1;

-- task 14
UPDATE loans SET return_date = '2026-11-05' WHERE id = 16;

-- task 15
DELETE FROM books WHERE title = 'CHildren of captain grant';
-- Answer: ჰობიტის წიგნის წაშლა იმიტომ არ გამოვა რო მაგ წიგნზე კვლავ არის loans და foreign key-ს მიზეზის გამო ჩერდება


-- part 3 c

-- task 16 
SELECT title, pages FROM books;

-- task 17
SELECT * FROM books WHERE genre = 'Fantasy';

-- task 18 
SELECT title, pages FROM books WHERE pages > 400 ORDER BY pages DESC;

-- task 19
SELECT first_name, city FROM members WHERE city IN ('Tbilisi', 'Kutaisi');

-- task 20
SELECT title, published_year FROM books WHERE published_year BETWEEN 1900 AND 1999;

-- task 21
SELECT * FROM authors WHERE name LIKE 'J%';
SELECT * FROM books WHERE title LIKE '%the%';

-- task 22
SELECT * FROM members WHERE phone IS NULL;

-- task 23
SELECT * FROM loans WHERE return_date IS NULL;

-- task 24
SELECT title, price FROM books ORDER BY price ASC LIMIT 3;

-- task 25
SELECT DISTINCT genre FROM books ORDER BY genre ASC;

-- task 26 
SELECT title, price, copies, (price * copies) AS stock_value FROM books ORDER BY stock_value DESC;

-- task 27 
SELECT CONCAT(first_name, ' ', last_name) AS full_name, joined_on FROM members WHERE YEAR(joined_on) = 2026;


-- part 4 d
-- task 28
SELECT COUNT(*) AS total_books, SUM(copies) AS total_copies, ROUND(AVG(price), 2) AS average_price FROM books;

-- task 29
SELECT MIN(price) AS cheapest_price, MAX(price) AS highest_price, MIN(published_year) AS oldest_year FROM books;

-- task 30 
SELECT genre, COUNT(*) AS book_count FROM books GROUP BY genre ORDER BY book_count DESC;

-- 31 
SELECT genre, ROUND(AVG(pages)) AS avg_pages FROM books GROUP BY genre HAVING avg_pages > 250;

-- 32
SELECT city, COUNT(*) AS member_count FROM members GROUP BY city HAVING member_count >= 2;

-- 33
SELECT member_id, COUNT(*) AS loan_count FROM loans GROUP BY member_id ORDER BY loan_count DESC;

-- task 34
SELECT book_id, COUNT(*) AS borrow_count FROM loans GROUP BY book_id ORDER BY borrow_count DESC LIMIT 3;

-- taask 35
SELECT MONTH(loan_date) AS loan_month, COUNT(*) AS loan_count FROM loans WHERE YEAR(loan_date) = 2026 AND return_date IS NOT NULL GROUP BY MONTH(loan_date);


-- subqueries part e
-- task 36
SELECT title, price FROM books WHERE price > (SELECT AVG(price) FROM books);

-- 37
SELECT title FROM books WHERE author_id = (SELECT id FROM authors WHERE name = 'George Orwell');

-- 38
SELECT CONCAT(first_name, ' ', last_name) AS member_name FROM members WHERE id NOT IN (SELECT member_id FROM loans);

-- 39
SELECT title FROM books WHERE id IN (SELECT book_id FROM loans WHERE return_date IS NULL);

-- 40
SELECT DISTINCT name FROM authors WHERE id IN (SELECT author_id FROM books WHERE id IN (SELECT book_id FROM loans WHERE member_id IN (SELECT id FROM members WHERE city = 'Tbilisi')));


-- bonus davaleba
-- 1
SELECT title FROM books WHERE id IN (
    SELECT book_id FROM (
        SELECT book_id, COUNT(book_id) as x 
        FROM loans 
        GROUP BY book_id 
        ORDER BY x DESC 
        LIMIT 1
    ) as sub
);


-- ბონუს 2
SELECT genre, title, pages 
FROM books b1 
WHERE pages = (
    SELECT MAX(pages) 
    FROM books b2 
    WHERE b2.genre = b1.genre
);
