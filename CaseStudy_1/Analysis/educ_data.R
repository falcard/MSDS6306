# Download Raw Data File from Internet Source
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
path <- "analysis/data/raw_educ.csv"
download.file(url,path)


# Read Raw Data File from local path into dataframe
tidy_educ <- read.csv(path)

# Show Structure of dataframe
str(tidy_educ)

#Remove Unneeded Columns
tidy_educ <- tidy_educ[,c(1,2,3)]


# Show structure of dataframe
str(tidy_educ)

# Show top values in dataframe for inspection
head(tidy_educ)

# Write Dataframe to output CSV for later analysis
write.csv(tidy_educ, "analysis/data/tidy_educ.csv", row.names = FALSE)
