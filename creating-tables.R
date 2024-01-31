# Advanced SQL skillz practice

# create a dataframe for daily temps and then write that dataframe out as a table to the sqlskillz database in postgres.

dates <- seq(as.Date("2022-01-01"), by=1, length.out=365)
temps <- round(runif(365, min=-40, 40),0)


df_temps <- data.frame(date=dates, temperature=temps)

# now write the data out to the database
con <- dbConnect(
  Postgres(),
  dbname = "sqlskillz", 
  user = Sys.getenv("DB_USER"), 
  password = Sys.getenv("DB_PWD")
)

dbWriteTable(con, name="daily_temps", value=df_temps)


customer_ids <- 1001:1010
transaction_ids <- 327001:327100
amounts <- runif(100, min=15, max=250)
customers_randomised <- sample(customer_ids, size=100, replace = TRUE)

df_purchases <- data.frame(customer_id=customers_randomised, transaction_id=transaction_ids, amount=amounts)
dbWriteTable(con, name="purchases", value=df_purchases)


date_sold <- seq(as.Date("2023-01-01"), by=1, length.out=31)
date_sold <- c(date_sold, date_sold)
date_sold <- sort(date_sold)

product <- rep(c("cakes", "pies"), times=31)

amount_sold <- round(runif(62, 3, 20),2)

df_cakepies <- data.frame(date_sold,product,amount_sold)
dbWriteTable(con, name="desserts", value=df_cakepies)
