library(tidyverse)

CountryPopulation <- function(chosenCountry) {

  # Filter data for the chosen country
  country_data <- WorldPopulation %>%
    filter(Country == chosenCountry) %>%
    pivot_longer(cols = starts_with("19") | starts_with("20"),
                 names_to = "Year",
                 values_to = "Population") %>%
    mutate(Year = as.numeric(Year))

  # Check for country does not exist
  if(!str_detect(WorldPopulaiton$Country, chosenCountry)){
    stop("Invalid Country.")
  }

  # Create the plot
  CCGraph <- ggplot(country_data, aes(x = Year, y = as.numeric(Population))) +
    geom_line() +
    labs(
      title = paste("Population Trend:", chosenCountry),
      x = "Year",
      y = "Population (thousands)"
    )

  return(CCGraph)

}
