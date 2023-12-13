library(tidyverse)
library(readxl)

# Read in the data

EstimateRaw <- read_excel('/Users/tharris/HarrisWorldPopulation/data_raw/World_Population.xlsx',
                          sheet=1, skip = 16)

WorldPopulation <- EstimateRaw %>%
  select(matches("^\\d{4}$|Region, subregion, country or area *")) 

# Remove rows 1:26
WorldPopulation <- WorldPopulation[-(1:26), ]

# Rename the first column to 'Country'
WorldPopulation <- WorldPopulation %>%
  rename(Country = colnames(.)[1])

# Filter out rows where the second letter of 'Country' is capitalized
# Every 'Region' or other similar subset appeared to be fully capitalized.
# This way only the relevant countries were kept.
WorldPopulation <- WorldPopulation %>%
  filter(str_detect(Country, "^[A-Z][a-z]"))

head(WorldPopulation)
