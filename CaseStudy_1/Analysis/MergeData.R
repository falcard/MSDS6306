#Merge GDP and Education Data sets by CountryCode
merge_data <- merge( tidy_fgdp, tidy_educ, by = "CountryCode", all.x = FALSE, all.y = FALSE )

# Show Head and Tail of Resultant Data Set
head(merge_data)
tail(merge_data)

write.csv(merge_data,file = "Merged.csv")

