library(highcharter)
library(dplyr)
library(tidyr)
data(worldgeojson, package = "highcharter")

test %>% 
  count(name) -> countries

lp_top <- readRDS("~/Desktop/thisislp/data/lp_top.rds") %>% 
  left_join(
    countrycode::codelist_panel %>% 
      filter(year == 2010) %>% 
      select(iso2c, iso3c) %>% 
      drop_na(),
    by = c("country" = "iso2c")
  )

lp_number_one <- lp_top %>% 
  group_by(iso3c) %>% 
  filter(popularity == max(popularity)) %>% 
  ungroup() %>% 
  mutate(name = as.factor(name))

series <- lp_number_one %>% 
  group_by(name) %>% 
  do(data = list_parse(select(., iso3c, popularity))) %>%
  ungroup() %>% 
  mutate(color = c("#009bae", "#66b7c2", "#ff5c6a", "#009f8a"))

highchart(type = "map") %>% 
  hc_plotOptions(map = list(
    allAreas = TRUE,
    joinBy = c('iso3', 'iso3c'),
    mapData = worldgeojson
  )) %>% 
  hc_add_series_list(series) %>% 
  hc_mapNavigation(enabled = TRUE)

highchart(type = "map") %>% 
  hc_plotOptions(map = list(
    joinBy = c('iso3', 'iso3c'),
    mapData = worldgeojson
  )) %>% 
  hc_add_series(data = lp_number_one %>% mutate_if(is.factor, as.character), value = "popularity")
