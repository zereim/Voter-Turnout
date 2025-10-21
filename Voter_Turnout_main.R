library(tidyverse)
library(readr)
library(stringr)
library(janitor)


# load the voter csv file 
NC_Voter_convert <- read_csv('NC_Voter_convert.csv')

# load the MIT voter csv file
MIT_NC_Voter <- read_csv('MIT NC-cleaned-final.csv')

# selecting presidential election data
MIT_NC_Pres <- MIT_NC_Voter %>% 
  filter(str_detect(office, 'US PRESIDENT'))

# cleaning data
MIT_NC_Pres_Clean <- clean_names(MIT_NC_Pres)

# Creating a new dataframe that sums the different presidential candidates vote totals 
Pres_Total <- MIT_NC_Pres_Clean %>%
  # group all rows by candidate
  group_by(candidate) %>%          
  # sum votes per candidate
  summarise(total_votes = sum(votes, na.rm = TRUE))  

# give a glimpse 
#head(NC_Voter_convert)
#head(MIT_NC_Voter)
     

# Tie the Vote Share to shapefiles 

# 
# jurisdiction_fips

# Plot the data in a chloropleth map




