
--Database:-----
----------------
authors(author_id, author_name, author_address)
publisher(publisher_id, name, address)
books(book_id, book_title, author_id, publisher_id, no_of_copies)
borrowers(borrower_id, firstname, lastname, address,email, phone, department)
booking(booking_id, book_id, borrower_id, booking date,available_date)
borrow_book(id, book_id, borrower_id, borrowing_date, duedate)
fine(fine_id, borrow_id, fine_amount, fine_date)

--Solutions------
-------------------
-- 1. List all books along with the names of their respective authors and publishers.
SELECT b.book_title, a.author_name, p.name AS publisher_name
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id;

-- 2. Find the number of books available by each author.
SELECT a.author_name, COUNT(b.book_id) AS total_books
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id
GROUP BY a.author_name;

-- 3. Count the number of distinct borrowers in each department.
SELECT department, COUNT(DISTINCT borrower_id) AS total_borrowers
FROM borrowers
GROUP BY department;

-- 4. Find the average number of copies available for each publisher's books.
SELECT p.name AS publisher_name, AVG(b.no_of_copies) AS avg_copies
FROM books b
INNER JOIN publisher p ON b.publisher_id = p.publisher_id
GROUP BY p.name;

-- 5. List the details of borrowers who have been fined more than once.
SELECT br.*
FROM borrowers br
INNER JOIN fine f ON br.borrower_id = (SELECT bb.borrower_id FROM borrow_book bb WHERE bb.id = f.borrow_id)
GROUP BY br.borrower_id
HAVING COUNT(f.fine_id) > 1;

-- 6. Retrieve a list of all borrowers who have borrowed books authored by 'J.K. Rowling'.
SELECT DISTINCT br.*
FROM borrowers br
INNER JOIN borrow_book bb ON br.borrower_id = bb.borrower_id
INNER JOIN books b ON bb.book_id = b.book_id
INNER JOIN authors a ON b.author_id = a.author_id
WHERE a.author_name = 'J.K. Rowling';

-- 7. Calculate the total fine collected by date.
SELECT fine_date, SUM(fine_amount) AS total_fine_collected
FROM fine
GROUP BY fine_date;

-- 8. Find the details of borrowers who have overdue books (i.e., duedate has passed).
SELECT br.*
FROM borrowers br
INNER JOIN borrow_book bb ON br.borrower_id = bb.borrower_id
WHERE bb.duedate < CURDATE(); -- Assuming MySQL, use CURRENT_DATE for PostgreSQL

-- 9. Create a view that shows the title, author, and publisher for all books.
CREATE VIEW book_details AS
SELECT b.book_title, a.author_name, p.name AS publisher_name
FROM books b
INNER JOIN authors a ON b.author_id = a.author_id
INNER JOIN publisher p ON b.publisher_id = p.publisher_id;

-- 10. Find the names of authors and their books where both the author's name and the book title start with the same letter.
SELECT a.author_name, b.book_title
FROM authors a
INNER JOIN books b ON a.author_id = b.author_id
WHERE LEFT(a.author_name, 1) = LEFT(b.book_title, 1);

-- 11. Find the details of each borrower who has borrowed books at least two times.
SELECT br.*
FROM borrowers br
INNER JOIN borrow_book bb ON br.borrower_id = bb.borrower_id
GROUP BY br.borrower_id
HAVING COUNT(bb.book_id) >= 2;

-- 12. Find the name of each borrower with how much amount was fined.
SELECT br.firstname, br.lastname, SUM(f.fine_amount) AS total_fined
FROM borrowers br
INNER JOIN borrow_book bb ON br.borrower_id = bb.borrower_id
INNER JOIN fine f ON bb.id = f.borrow_id
GROUP BY br.borrower_id, br.firstname, br.lastname;
