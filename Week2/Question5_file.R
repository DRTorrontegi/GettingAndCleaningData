#Fichero con separadores determinados 

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
lines <- readLines(url, n=10) # Revisa el formato

# marca los espacios de cada columna
w <- c(1, 9, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3, 5, 4, 1, 3)

#identifica las columnas, poniendo filler a cada columna que no interesa
colNames <- c("filler", "week", "filler", "sstNino12", "filler", "sstaNino12", "filler", "sstNino3", "filler", "sstaNino3", "filler", "sstNino34", "filler", "sstaNino34", "filler", "sstNino4", "filler", "sstaNino4")

#lee todo el fichero
d <- read.fwf(url, w, header=FALSE, skip=4, col.names=colNames)

#elimina las columnas filler
d <- d[, grep("^[^filler]", names(d))]

#suma la cuarta columna
sum(d[, 4])