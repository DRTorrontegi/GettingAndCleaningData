install.packages("XML")
install.packages("RCurl")
install.packages("dplyr")

library(XML) 
library(RCurl) 
library(dplyr)
fileXML <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

# had to remove s from https in above xml file. This method commented below:
#   fileXML <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#   doc <- xmlTreeParse(fileXML,useInternal = TRUE)

# using RCurl, can leave https.  Use getURL first, then parse with xmlParse
xData <- getURL(fileXML) # This allows you to use https
doc <- xmlParse(xData)
rootNode <- xmlRoot(doc)
#xmlName(rootNode) # just displays top root node name
# one version, no data frame required - no need for zips, zips_dt 
sum(xpathSApply(rootNode, "//zipcode", xmlValue) == "21231")