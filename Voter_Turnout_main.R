library(tidyverse)
library(readr)
library(stringr)
library(janitor)
library(tidycensus)

# 2024 General Election Statistics

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

# Add Census API Key
census_api_key("090766422394c061e3e065a0d87f7cc5efed8d21", install = TRUE)


# Get 2023 county-level total population
total_pop <- get_acs(
  geography = 'county',
  variables = 'B01003_001',   # Total Population
  year = 2023,
  state = 'North Carolina',
  survey = 'acs5'
)

# Get 2023 county-level voting-age population
voting_pop <- get_acs(
  geography = 'county',
  variables = 'B29001_001E',   # Voting-Age population
  year = 2023,
  state = 'North Carolina',
  survey = 'acs5'
)


# Grab the 2023 data survey


# API key: 090766422394c061e3e065a0d87f7cc5efed8d21


# df <- read_delim(
#  "ncvoter_Statewide.txt",      # your file path
#  delim = "\t",                 # tab-delimited
#  quote = "\"",                 # fields are quoted
#  locale = locale(encoding = "windows-1252"),  # handle encoding
#  show_col_types = FALSE        # suppress verbose column type message
#)


# Clean column names
# df <- clean_names(df)


# View the structure
# glimpse(df)
# give a glimpse 
#head(NC_Voter_convert)
#head(MIT_NC_Voter)
     

# Tie the Vote Share to shapefiles 

# 
# jurisdiction_fips

# Plot the data in a chloropleth map




