library(RPostgres)

# Make a connection to the DB for issuing commands
con <- dbConnect(
  Postgres(),
  dbname = "northwind", 
  user = Sys.getenv("DB_USER"), 
  password = Sys.getenv("DB_PWD")
)

# issue a basic query and store the results in a dataframe.
df_supplier <- dbGetQuery(con, 'SELECT * FROM supplier')

# finally, when done, close the connection to the DB.
dbDisconnect(con)
rm(con)
