# install.packages("DBI")
# install.packages("RMySQL")
# install.packages("ggplot2")


library(DBI)
library(RMySQL)
library(ggplot2)


# Replace username, password with your MySQL credentials
con <- dbConnect(
  RMySQL::MySQL(),
  dbname = "sakila",
  host = "localhost",
  port = 3306,
  user = "root",
  password = "s"
)

# dbListTables(con)  # Lists all tables in Sakila



################################################ Question 1 ################################################
query <- "
SELECT title, rating, rental_duration
FROM film
WHERE rating = 'PG' AND rental_duration > 5;
"

# Execute query and get results as a dataframe
films_pg <- dbGetQuery(con, query)

# View results
print(films_pg)




























################################################ Question 2 ################################################
# # Write the query
# query <- "
# SELECT rating, AVG(rental_rate) AS avg_rental_rate
# FROM film
# GROUP BY rating;
# "

# # Execute query
# avg_rental <- dbGetQuery(con, query)

# # View results
# print(avg_rental)

################################################ Question 3 ################################################
# # Write query
# query <- "
# SELECT l.name AS language_name, COUNT(f.film_id) AS total_films
# FROM film f
# JOIN language l ON f.language_id = l.language_id
# GROUP BY l.name;
# "

# # Execute query
# film_count <- dbGetQuery(con, query)

# # View result
# print(film_count)

################################################ Question 4 ################################################

# # Write query
# query <- "
# SELECT 
#     c.customer_id,
#     CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
#     s.store_id
# FROM customer c
# JOIN store s ON c.store_id = s.store_id;
# "

# # Execute query
# customers_store <- dbGetQuery(con, query)

# # View results
# print(customers_store)

################################################ Question 5 ################################################
# # SQL query
# query <- "
# SELECT 
#     p.payment_id,
#     p.amount,
#     p.payment_date,
#     CONCAT(s.first_name, ' ', s.last_name) AS staff_name
# FROM payment p
# JOIN staff s ON p.staff_id = s.staff_id;
# "

# # Execute query
# payments_info <- dbGetQuery(con, query)

# # View first few rows
# head(payments_info)

################################################ Question 6 ################################################

# # SQL query
# query <- "
# SELECT f.film_id, f.title
# FROM film f
# LEFT JOIN inventory i ON f.film_id = i.film_id
# LEFT JOIN rental r ON i.inventory_id = r.inventory_id
# WHERE r.rental_id IS NULL;
# "

# # Execute query
# unrented_films <- dbGetQuery(con, query)

# # View results
# print(unrented_films)

################################################ Question 7 ################################################
# # Query average rental rate by rating
# query <- "
# SELECT rating, AVG(rental_rate) AS avg_rental_rate
# FROM film
# GROUP BY rating;
# "

# avg_rental <- dbGetQuery(con, query)

# # Disconnect
# dbDisconnect(con)

# # Plot with ggplot2
# ggplot(avg_rental, aes(x = rating, y = avg_rental_rate, fill = rating)) +
#   geom_bar(stat = 'identity') +
#   labs(
#     title = 'Average Rental Rate by Film Rating',
#     x = 'Rating',
#     y = 'Average Rental Rate ($)'
#   ) +
#   theme_minimal() +
#   theme(legend.position = "none")