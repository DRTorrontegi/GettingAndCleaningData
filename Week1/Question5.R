library(data.table) 

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile = "ACS.csv")
DT <- fread("ACS.csv", sep = ",")

# microbenchmark package allows you to run multiple versions of query "n" amount of times
# the example below runs 100 times

#install.packages("microbenchmark")
library("microbenchmark")

mbm = microbenchmark(
  v1 = DT[,mean(pwgtp15),by=SEX],
  v2 = sapply(split(DT$pwgtp15,DT$SEX),mean),
  v3 = tapply(DT$pwgtp15,DT$SEX,mean),
  v4 = mean(DT$pwgtp15,by=DT$SEX),
  #v5 = mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15),
  #v6 = rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
  times=10000
)
mbm