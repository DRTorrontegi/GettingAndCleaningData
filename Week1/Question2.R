#install.packages("xlsx")
library(xlsx)

fileXLS <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
# use mode = "wb" forces binary mode - doesn't read correctly without this!

download.file(fileXLS,destfile="NGAP.xlsx", mode = "wb")

dateDownloadedXLS <- date() # if you want to store the date of download

colIndex <- 7:15 

rowIndex <- 18:23

dat <- read.xlsx("NGAP.xlsx",sheetIndex=1, colIndex = colIndex, rowIndex = rowIndex) #select first sheet, specific col/rows.

sum(dat$Zip*dat$Ext,na.rm=T) # code lesson gives your to run