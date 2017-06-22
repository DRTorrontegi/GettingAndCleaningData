install.packages("jpeg")

# CARGAR PAQUETES
packages <- c("data.table", "jpeg")
sapply(packages, require, character.only = TRUE, quietly = TRUE)

## PREGUNTA 1 ##

# DESCARGAR
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#f <- file.path(getwd(), "ss06hid.csv")
f <- "./data/ss06hid.csv"
download.file(url, f)
dt <- data.table(read.csv(f))

#FILTRAR households
# on greater than 10 acres who sold more than $10,000 worth of agriculture products
agricultureLogical <- dt$ACR == 3 & dt$AGS == 6


#PRIMEROS TRES VALORES
which(agricultureLogical)[1:3]


## PREGUNTA 2 ##
# DESCARGAR
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
f <- "./data/jeff.jpg"
download.file(url, f, mode = "wb")

#RESUltado
img <- readJPEG(f, native = TRUE)
quantile(img, probs = c(0.3, 0.8))

## Pregunta 3
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
f <- "./data/GDP.csv"
download.file(url, f)
dtGDP <- data.table(read.csv(f, skip = 4, nrows = 215))
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", 
                                               "Long.Name", "gdp"))
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
f <- "./data/EDSTATS_Country.csv"
download.file(url, f)
dtEd <- data.table(read.csv(f))
dt <- merge(dtGDP, dtEd, all = TRUE, by = c("CountryCode"))
sum(!is.na(unique(dt$rankingGDP)))

dt[order(rankingGDP, decreasing = TRUE), list(CountryCode, Long.Name.x, Long.Name.y, 
                                              rankingGDP, gdp)][13]
