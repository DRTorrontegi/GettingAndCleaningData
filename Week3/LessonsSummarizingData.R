if(!file.exists("./data")){dir.create("./data")}

fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"

download.file(fileURL,destfile = "./data/restaurants.csv")

restData <- read.csv("./data/restaurants.csv")

head(restData,n=3)
tail(restData,n=3)
summary(restData)
str(restData)
quantile(restData$councilDistrict,na.rm = TRUE)

table(restData$zipCode,useNA="ifany")
table(restData$councilDistrict,restData$zipCode)

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)

colSums(is.na(restData))
all(colSums(is.na(restData))==0)

table(restData$zipCode %in% c("21212","21213"))

restData[table(restData$zipCode %in% c("21212","21213")),]

#crosstab
data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit,data=DF)
xt
