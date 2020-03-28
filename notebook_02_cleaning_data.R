
require(tidyverse) #dplyr, tidyr, readr, ggplot2

setwd("/Users/Man/Documents/Data/Repos/ST/corona/hospital_requests_20200324")

df_firsts_orig <- read.csv('output_data/tabula-reports_non_first_pages_cropped.csv',
                           header = FALSE, na.strings = '')

table(df_firsts$V17, exclude = FALSE)
table(df_firsts$V16, exclude = FALSE)
table(df_firsts$V15, exclude = FALSE)
table(df_firsts$V14, exclude = FALSE)

df_firsts <- select(df_firsts_orig, -c(V15, V16, V17))

df_temp <- filter(df_firsts,
                  V1 == 'Update',
                  is.na(V2))
all(is.na(df_temp$V3))
