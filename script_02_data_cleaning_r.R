


require(tidyverse) #dplyr, tidyr, readr, ggplot2

setwd("/Users/Man/Documents/Data/Repos/ST/corona/hospital_requests_20200324")

# Pull in original data
df_pages1_orig <- read.csv('output_data/tabula-reports_first_pages_cropped.csv',
                           header = FALSE, na.strings = '', stringsAsFactors = FALSE)
df_pages2_orig <- read.csv('output_data/tabula-reports_non_first_pages_cropped.csv',
                           header = FALSE, na.strings = '', stringsAsFactors = FALSE)

# Create independent copies of the dataframes
df <- rbind(df_pages1_orig, df_pages2_orig)

# Cleaning
names(df) <- c('original_date', 'update_date',	'county_city', 
               'originating_agency',	'jurisdictiont_tracking_num',
               'state_tracking_num',	'emac_federal_ma_num', 'subject',
               'priority',	'worked_by', 'overall_status', 
                      'assignment_status', 'assigned_to')

df$original_dt <- as.Date(df$original_date, format='%m/%d/%Y')
df$update_dt <- as.Date(df$update_date, format='%m/%d/%Y')

sort(table(df$original_dt, exclude = FALSE), decreasing = TRUE)[1:20]
sort(table(df$update_dt, exclude = FALSE), decreasing = TRUE)[1:20]

write.csv(df, 'output_data/df.csv', row.names = FALSE)


sum(is.na(df$original_date)) # 35
sum(is.na(df$original_dt)) # 50

test <- filter(df, is.na(original_dt))



# Some statistics
sort(table(df$priority, useNA = 'ifany'), decreasing = TRUE)
sort(table(df$county_city, useNA = 'ifany'), decreasing = TRUE)[1:20]

length(unique(df$jurisdictiont_tracking_num))
length(unique(df$state_tracking_num))

sort(table(df$jurisdictiont_tracking_num, useNA = 'ifany'), decreasing = TRUE)[1:10]
sort(table(df$state_tracking_num, useNA = 'ifany'), decreasing = TRUE)[1:10]
