library(tidyverse)
library(readr)
library(stringr)


# load the voter csv file 
NC_Voter_convert <- read_csv('NC_Voter_convert.csv')

# load the MIT voter csv file
MIT_NC_Voter <- read_csv('MIT NC-cleaned-final.csv')


MIT_NC_Pres <- MIT_NC_Voter %>% 
  filter(str_detect(office, 'US PRESIDENT'))



# give a glimpse 
#head(NC_Voter_convert)
#head(MIT_NC_Voter)
     

# Tie the Vote Share to shapefiles 

# 
# jurisdiction_fips

# Plot the data in a chloropleth map




