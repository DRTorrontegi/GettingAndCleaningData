packages <- c("data.table", "sqldf")

install.packages(packages)

library(packages)


url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
f <- file.path(getwd(), "ss06pid.csv")
download.file(url, f)
acs <- data.table(read.csv(f))
query1 <- sqldf("select pwgtp1 from acs where AGEP < 50")
query2 <- sqldf("select pwgtp1 from acs")  ## NO
query3 <- sqldf("select * from acs where AGEP < 50 and pwgtp1")  ## NO
query4 <- sqldf("select * from acs where AGEP < 50")  ## NO
identical(query3, query4)