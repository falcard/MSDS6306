# Case Study - 1
November 8, 2016  

#Introduction 

The Organization for Economic Co-operation and Development (OECD) is a global organization consisting of representative nations from North and South America, Europe and Asia.  Member nations contribute time and resources to the organization's efforts to continually improve processes for fostering prosperity and fighting poverty through economic growth and financial stability.  Analysis of GDP data for OECD versus non-OECD countries with high income designations is of particular interest in this study.  GDP data for 190 ranked countries and the related educational data will be analyzed for this purpose.  In a second part of the study using the same data, a perceptual analysis of the relationship between GDP and income group will be performed by generating a graphical representation of GDP by income group.  The related quantile data will also be included in a tabular view for analysis to determine the number of countries with lower middle income that are among the 38 nations with the highest GDP.




Data source - https://d396qusza40orc.cloudfront.net. 

## Download and Tidy GDP Data
GDP Data is downloaded and made tidy by running the script analysis/gdp_data.r which does the following:

1. Raw GDP data - downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv to analysis/data/raw_fgdp.csv.

2. Rows with invalid observational data are removed from the dataframe using dataframe subset notation.

3. Unnecessary Columns are removed. The only columns needed for the analysis are those representative of the CountryCode, Ranking and GDP. These columns are renamed using the names function.

4. Invalid numeric characters are removed from the GDP column using the gsub function so that the column can be converted to type numeric.

5. The cleaned data set is written out to "analysis/data/tidy_gdp.csv" for later inspection.


```r
source("Analysis/gdp_data.R",echo = TRUE )
```

```
## 
## > url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
## 
## > path <- "analysis/data/raw_gdp.csv"
## 
## > download.file(url, path)
## 
## > tidy_fgdp <- read.csv(path)
## 
## > str(tidy_fgdp)
## 'data.frame':	330 obs. of  10 variables:
##  $ X                          : Factor w/ 229 levels "","ABW","ADO",..: 1 1 1 1 215 38 102 51 68 72 ...
##  $ Gross.domestic.product.2012: Factor w/ 195 levels "",".. Not available.  ",..: 1 1 195 1 3 104 115 126 137 148 ...
##  $ X.1                        : logi  NA NA NA NA NA NA ...
##  $ X.2                        : Factor w/ 230 levels "","  East Asia & Pacific",..: 1 1 67 1 219 51 108 83 78 218 ...
##  $ X.3                        : Factor w/ 207 levels ""," 1,008 "," 1,129 ",..: 1 191 207 1 40 178 143 100 66 63 ...
##  $ X.4                        : Factor w/ 7 levels "","a","b","c",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ X.5                        : logi  NA NA NA NA NA NA ...
##  $ X.6                        : logi  NA NA NA NA NA NA ...
##  $ X.7                        : logi  NA NA NA NA NA NA ...
##  $ X.8                        : logi  NA NA NA NA NA NA ...
## 
## > tidy_fgdp <- tidy_fgdp[5:194, ]
## 
## > na_cols <- tidy_fgdp[, colSums(is.na(tidy_fgdp)) == 
## +     nrow(tidy_fgdp)]
## 
## > na_cols_count <- ncol(na_cols)
## 
## > na_cols_count
## [1] 5
## 
## > tidy_fgdp <- tidy_fgdp[, c(1, 2, 5)]
## 
## > names(tidy_fgdp) <- c("CountryCode", "Ranking", "GDP")
## 
## > tidy_fgdp$GDP <- gsub(",", "", tidy_fgdp$GDP)
## 
## > tidy_fgdp$GDP <- as.numeric(tidy_fgdp$GDP)
## 
## > tidy_fgdp$Ranking <- as.numeric(as.character(tidy_fgdp$Ranking))
## 
## > str(tidy_fgdp)
## 'data.frame':	190 obs. of  3 variables:
##  $ CountryCode: Factor w/ 229 levels "","ABW","ADO",..: 215 38 102 51 68 72 28 174 99 93 ...
##  $ Ranking    : num  1 2 3 4 5 6 7 8 9 10 ...
##  $ GDP        : num  16244600 8227103 5959718 3428131 2612878 ...
## 
## > head(tidy_fgdp)
##    CountryCode Ranking      GDP
## 5          USA       1 16244600
## 6          CHN       2  8227103
## 7          JPN       3  5959718
## 8          DEU       4  3428131
## 9          FRA       5  2612878
## 10         GBR       6  2471784
## 
## > write.csv(tidy_fgdp, "analysis/data/tidy_gdp.csv", 
## +     row.names = FALSE)
```

## Download and Tidy Education Data
Education Data is downloaded and cleaned by running the script analysis/educ_data.r which does the following:

1. Raw education data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv.

2. Unnecessary Columns are removed from the dataframe using dataframe subset notation

3. The tidy data set is written out to "analysis/data/tidy_educ.csv" for later inspection.


```r
source("Analysis/educ_data.R",echo = TRUE)
```

```
## 
## > url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
## 
## > path <- "analysis/data/raw_educ.csv"
## 
## > download.file(url, path)
## 
## > tidy_educ <- read.csv(path)
## 
## > str(tidy_educ)
## 'data.frame':	234 obs. of  31 variables:
##  $ CountryCode                                      : Factor w/ 234 levels "ABW","ADO","AFG",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ Long.Name                                        : Factor w/ 234 levels "American Samoa",..: 5 104 57 99 108 226 4 109 1 2 ...
##  $ Income.Group                                     : Factor w/ 6 levels "","High income: nonOECD",..: 2 2 4 5 6 2 6 5 6 6 ...
##  $ Region                                           : Factor w/ 8 levels "","East Asia & Pacific",..: 4 3 7 8 3 5 4 3 2 4 ...
##  $ Lending.category                                 : Factor w/ 4 levels "","Blend","IBRD",..: 1 1 4 4 3 1 3 2 1 3 ...
##  $ Other.groups                                     : Factor w/ 3 levels "","Euro area",..: 1 1 3 1 1 1 1 1 1 1 ...
##  $ Currency.Unit                                    : Factor w/ 155 levels "","Afghan afghani",..: 8 49 2 5 3 144 6 7 145 44 ...
##  $ Latest.population.census                         : Factor w/ 28 levels "","1970","1979",..: 17 28 3 2 18 22 18 18 17 18 ...
##  $ Latest.household.survey                          : Factor w/ 56 levels "","CPS (monthly)",..: 1 1 39 38 40 1 1 16 1 1 ...
##  $ Special.Notes                                    : Factor w/ 70 levels "","A simple multiplier is used to convert the national currencies of EMU members to euros. The following irrevocable euro conversi"| __truncated__,..: 1 1 27 1 1 1 1 1 1 63 ...
##  $ National.accounts.base.year                      : Factor w/ 44 levels "","1954","1973",..: 25 1 38 28 1 25 22 1 1 18 ...
##  $ National.accounts.reference.year                 : int  NA NA NA NA 1996 NA NA 1996 NA NA ...
##  $ System.of.National.Accounts                      : int  NA NA NA NA 1993 NA 1993 1993 NA NA ...
##  $ SNA.price.valuation                              : Factor w/ 3 levels "","VAB","VAP": 1 1 2 3 2 2 2 2 1 2 ...
##  $ Alternative.conversion.factor                    : Factor w/ 33 levels "","1960-85","1965-84",..: 1 1 1 24 1 1 6 21 1 1 ...
##  $ PPP.survey.year                                  : int  NA NA NA 2005 2005 NA 2005 2005 NA NA ...
##  $ Balance.of.Payments.Manual.in.use                : Factor w/ 3 levels "","BPM4","BPM5": 1 1 1 3 3 2 3 3 1 3 ...
##  $ External.debt.Reporting.status                   : Factor w/ 4 levels "","Actual","Estimate",..: 1 1 2 2 2 1 2 2 1 1 ...
##  $ System.of.trade                                  : Factor w/ 3 levels "","General","Special": 3 2 2 3 2 2 3 3 1 2 ...
##  $ Government.Accounting.concept                    : Factor w/ 3 levels "","Budgetary",..: 1 1 3 1 3 3 3 3 1 1 ...
##  $ IMF.data.dissemination.standard                  : Factor w/ 3 levels "","GDDS","SDDS": 1 1 2 2 2 2 3 3 1 2 ...
##  $ Source.of.most.recent.Income.and.expenditure.data: Factor w/ 77 levels "","1-2-3, 2005-06",..: 1 1 1 35 66 1 45 46 1 1 ...
##  $ Vital.registration.complete                      : Factor w/ 2 levels "","Yes": 1 2 1 1 2 1 2 2 2 2 ...
##  $ Latest.agricultural.census                       : Factor w/ 45 levels "","1960","1964-65",..: 1 1 1 3 32 32 41 1 1 1 ...
##  $ Latest.industrial.data                           : int  NA NA NA NA 2005 NA 2001 NA NA NA ...
##  $ Latest.trade.data                                : int  2008 2006 2008 1991 2008 2008 2008 2008 NA 2007 ...
##  $ Latest.water.withdrawal.data                     : int  NA NA 2000 2000 2000 2005 2000 2000 NA 1990 ...
##  $ X2.alpha.code                                    : Factor w/ 208 levels "","AD","AE","AF",..: 13 2 4 8 6 3 9 7 10 5 ...
##  $ WB.2.code                                        : Factor w/ 209 levels "","AD","AE","AF",..: 13 2 4 8 6 3 9 7 10 5 ...
##  $ Table.Name                                       : Factor w/ 234 levels "Afghanistan",..: 10 5 1 6 2 220 8 9 4 7 ...
##  $ Short.Name                                       : Factor w/ 234 levels "Afghanistan",..: 10 5 1 6 2 220 8 9 4 7 ...
## 
## > tidy_educ <- tidy_educ[, c(1, 2, 3)]
## 
## > str(tidy_educ)
## 'data.frame':	234 obs. of  3 variables:
##  $ CountryCode : Factor w/ 234 levels "ABW","ADO","AFG",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ Long.Name   : Factor w/ 234 levels "American Samoa",..: 5 104 57 99 108 226 4 109 1 2 ...
##  $ Income.Group: Factor w/ 6 levels "","High income: nonOECD",..: 2 2 4 5 6 2 6 5 6 6 ...
## 
## > head(tidy_educ)
##   CountryCode                    Long.Name         Income.Group
## 1         ABW                        Aruba High income: nonOECD
## 2         ADO      Principality of Andorra High income: nonOECD
## 3         AFG Islamic State of Afghanistan           Low income
## 4         AGO  People's Republic of Angola  Lower middle income
## 5         ALB          Republic of Albania  Upper middle income
## 6         ARE         United Arab Emirates High income: nonOECD
## 
## > write.csv(tidy_educ, "analysis/data/tidy_educ.csv", 
## +     row.names = FALSE)
```

## Merge GDP and Educational Data
The GDP and educational datasets are now merged together by running the script analysis/MergeData.r which does the following:

1. The GDP and Education Dataframes are merged together using the merge function and associated by CountryCode variable.  


```r
source("Analysis/MergeData.R",echo = TRUE)
```

```
## 
## > merge_data <- merge(tidy_fgdp, tidy_educ, by = "CountryCode", 
## +     all.x = FALSE, all.y = FALSE)
## 
## > head(merge_data)
##   CountryCode Ranking    GDP                    Long.Name
## 1         ABW     161   2584                        Aruba
## 2         AFG     105  20497 Islamic State of Afghanistan
## 3         AGO      60 114147  People's Republic of Angola
## 4         ALB     125  12648          Republic of Albania
## 5         ARE      32 348595         United Arab Emirates
## 6         ARG      26 475502           Argentine Republic
##           Income.Group
## 1 High income: nonOECD
## 2           Low income
## 3  Lower middle income
## 4  Upper middle income
## 5 High income: nonOECD
## 6  Upper middle income
## 
## > tail(merge_data)
##     CountryCode Ranking    GDP                        Long.Name
## 184         WSM     181    684                            Samoa
## 185         YEM      90  35646                Republic of Yemen
## 186         ZAF      28 384313         Republic of South Africa
## 187         ZAR     112  17204 Democratic Republic of the Congo
## 188         ZMB     104  20678               Republic of Zambia
## 189         ZWE     134   9802             Republic of Zimbabwe
##            Income.Group
## 184 Lower middle income
## 185 Lower middle income
## 186 Upper middle income
## 187          Low income
## 188          Low income
## 189          Low income
## 
## > write.csv(merge_data, file = "Merged.csv")
```
One important note about the merge process, there was an entry from the GDP data set for (SDS) that didn't have a matching country code in the education dataset.  This produced a single line for this country that included NAs for educational data and was consequently removed during the merge operation.

## Order GDP and Educational Data
Arrange function is called to order the dataframes
The merged dataset is now ordered by running the script analysis/OrderData.r which does the following:

1. GDP and Education Dataframes are ordered by descending GDP value.


```r
source("Analysis/OrderData.R",echo = TRUE)
```

```
## 
## > merge_data <- merge_data[order(merge_data$GDP), ]
## 
## > head(merge_data)
##     CountryCode Ranking GDP                                    Long.Name
## 173         TUV     190  40                                       Tuvalu
## 92          KIR     189 175                         Republic of Kiribati
## 113         MHL     188 182             Republic of the Marshall Islands
## 137         PLW     187 228                            Republic of Palau
## 155         STP     186 263 Democratic Republic of São Tomé and Principe
## 59          FSM     185 326               Federated States of Micronesia
##            Income.Group
## 173 Lower middle income
## 92  Lower middle income
## 113 Lower middle income
## 137 Upper middle income
## 155 Lower middle income
## 59  Lower middle income
## 
## > tail(merge_data)
##     CountryCode Ranking      GDP
## 61          GBR       6  2471784
## 58          FRA       5  2612878
## 45          DEU       4  3428131
## 87          JPN       3  5959718
## 34          CHN       2  8227103
## 178         USA       1 16244600
##                                                Long.Name
## 61  United Kingdom of Great Britain and Northern Ireland
## 58                                       French Republic
## 45                           Federal Republic of Germany
## 87                                                 Japan
## 34                            People's Republic of China
## 178                             United States of America
##            Income.Group
## 61    High income: OECD
## 58    High income: OECD
## 45    High income: OECD
## 87    High income: OECD
## 34  Lower middle income
## 178   High income: OECD
```

# Analysis Questions

####Match the data based on the country shortcode. How many of the IDs match?


```r
message("No. of ID's matched between the two data sets: ",nrow(merge_data))
```

```
## No. of ID's matched between the two data sets: 189
```


#### Sort the data frame in ascending order by GDP rank. What is the 13th country in the resulting data frame?


```r
merge_data[13,]
```

```
##    CountryCode Ranking GDP           Long.Name        Income.Group
## 93         KNA     178 767 St. Kitts and Nevis Upper middle income
```

St. Kitts and Nevis holds the 13th spot.


#### What are the average GDP rankings for the "High income: OECD" and "High income:nonOECD" groups?

The following code calculates the average GDP Rankings for the High Income OECD and non-OECD groups.


```r
# Get GDP Rankings for High Income OECD Group
highincome.oecd <- merge_data$Ranking[merge_data$Income.Group == "High income: OECD"]
highincome.oecd <- highincome.oecd[!is.na(highincome.oecd)]
highincome.oecd.average <- mean(highincome.oecd)
print(highincome.oecd.average)
```

```
## [1] 32.96667
```

```r
# Get GDP Rankings for High Income non-OECD Group
highincome.nonoecd <- merge_data$Ranking[merge_data$Income.Group == "High income: nonOECD"]
highincome.nonoecd <- highincome.nonoecd[!is.na(highincome.nonoecd)]
highincome.nonoecd.average <- mean(highincome.nonoecd)
print(highincome.nonoecd.average)
```

```
## [1] 91.91304
```

The average GDP rankings for the OECD high income member countries is significantly lower than for non-OECD high income countries.  

#### Plot the GDP for all of the countries by Income Group

The following boxplot shows the GDP data by income groups for all countries.


```r
# Get GDP Rankings for High Income OECD Group
ggplot(merge_data, aes(Income.Group, GDP, color = Income.Group)) + 
  geom_boxplot()+
  scale_y_log10()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```

![](papers\Report_files/figure-html/unnamed-chunk-9-1.png)<!-- -->
![Figure-1](https://github.com/raunakm90/MSDS6306/blob/master/CaseStudy_1/Papers/Report_files/figure-html/unnamed-chunk-9-1.png)

Observations from the boxplot - 

1. High income OECD has more variation in the GDP income values compared to rest of the groups

2. There seems to be a difference in the mean of value of GDP income between different groups of income



#### Cut the GDP ranking into 5 separate quantile groups. How many countries are Lower middle income but among the 38 nations with highest GDP?

The following code splits the GDP Rankings into 5 quantile groups and creates a table of these quartiles versus Income Groups.


```r
# Get GDP Rankings for High Income OECD Group
merge_data$quartile <- dplyr::ntile(merge_data$Ranking, 5) 
merge_data[merge_data$quartile == 1 & merge_data$Income.Group == "Lower middle income",]
```

```
##     CountryCode Ranking     GDP                  Long.Name
## 51          EGY      38  262832     Arab Republic of Egypt
## 165         THA      31  365966        Kingdom of Thailand
## 77          IDN      16  878043      Republic of Indonesia
## 78          IND      10 1841710          Republic of India
## 34          CHN       2 8227103 People's Republic of China
##            Income.Group quartile
## 51  Lower middle income        1
## 165 Lower middle income        1
## 77  Lower middle income        1
## 78  Lower middle income        1
## 34  Lower middle income        1
```

```r
table(merge_data$quartile,merge_data$Income.Group)
```

```
##    
##        High income: nonOECD High income: OECD Low income
##   1  0                    4                18          0
##   2  0                    5                10          1
##   3  0                    8                 1          9
##   4  0                    5                 1         16
##   5  0                    1                 0         11
##    
##     Lower middle income Upper middle income
##   1                   5                  11
##   2                  13                   9
##   3                  12                   8
##   4                   8                   8
##   5                  16                   9
```


The table shows that there are 5 countries with the lower middle income designation that have GDP rankings in the top 38.

# Conclusion

The results of study showed a much higher Mean GDP ranking for countries with high income OECD designations than countries with high income designations that didn't participate in OECD.  This provides evidence that there may be a relationship between participation in the program and the size of a country's GDP.  Futher analysis should be conducted to better understand the relationship.  In the second part of the study it was shown that a small minority of countries with lower middle income designations were in the top quantile of GDP rankings.  This provides evidence that countries with lower middle income may have higher GDP value/rank.
