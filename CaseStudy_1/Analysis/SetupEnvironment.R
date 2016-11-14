pkg <- c("downloader","repmis","dplyr","ggplot2")
new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
if (length(new.pkg)){
  install.packages(new.pkg, dependencies = TRUE,repos='http://cran.us.r-project.org')}
sapply(pkg, require, character.only = TRUE)

# 
# library(downloader)
# library(repmis)
# library(tidyr)
# library(dplyr)
# library(ggplot2)
