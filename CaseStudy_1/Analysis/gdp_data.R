# Download Raw Data File from Internet Source
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
path <- "analysis/data/raw_gdp.csv"
download.file(url,path)

# Read Raw Data File from local path into dataframe
tidy_fgdp <- read.csv(path)

# Show Structure of dataframe
str(tidy_fgdp)

# Get Relevant Rows from Data File
tidy_fgdp <- tidy_fgdp[5:194,]

#Remove Columns
na_cols <- tidy_fgdp[,colSums(is.na(tidy_fgdp))==nrow(tidy_fgdp)]
na_cols_count <- ncol( na_cols )
## Print the Number of empty columns in the dataframe
na_cols_count 
tidy_fgdp <- tidy_fgdp[,c(1,2,5)]

## Name Variables
names(tidy_fgdp) <- c("CountryCode","Ranking","GDP")

## Convert GDP to Numeric Type
tidy_fgdp$GDP <- gsub(",","", tidy_fgdp$GDP)
tidy_fgdp$GDP <- as.numeric(tidy_fgdp$GDP)

## Convert Ranking to Numeric Type
tidy_fgdp$Ranking <- as.numeric(as.character(tidy_fgdp$Ranking))

# Show structure of dataframe
str(tidy_fgdp)

# Show top values in dataframe for inspection
head(tidy_fgdp)

# Write Dataframe to output CSV for later analysis
write.csv(tidy_fgdp, "analysis/data/tidy_gdp.csv", row.names = FALSE)