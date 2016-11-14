#Order Data by GDP
# merge_data <- arrange(merge_data, desc(GDP))
merge_data <- merge_data[order(merge_data$GDP),]

# Show Head and Tail of ordered dataset
head(merge_data)
tail(merge_data)
