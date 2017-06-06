#install.packages("httr")
#install.packages("httpuv")

library(httr)
#library(httpuv)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "56b637a5baffac62cad9",
                   secret = "8e107541ae1791259e9987d544ca568633da2ebf")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# Use the API
gtoken <- config(token = github_token)
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
repo_list <- content(req)

# Answer
answer1 <- c() 
for (i in 1:length(repo_list)) {
  repo <- repo_list[[i]]
  if (repo$name == "datasharing") {
    answer1 = repo
    break
  }
}

# Expected output: The repository 'datasharing' was created at 2013-11-07T13:25:07Z
if (length(answer1) == 0) {
  message("No such repository found: 'datasharing'")
} else {
  message("The repository 'datasharing' was created at ", answer1$created_at)
}
