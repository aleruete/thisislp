library(shinybird)
library(lp)
library(dplyr)
library(tidyr)
library(stringr)
library(highcharter)

# lyrics ----

names_for_menus <- function(x) {
  y <- names(x) %>% 
    str_replace_all("_", " ") %>% 
    str_replace_all("i m", "I'm") %>% 
    str_replace_all(" live", " (Live)") %>% 
    str_to_title() %>% 
    str_replace_all("Its ", "It's ")
  
  return(y)
}

hss <- heart_shaped_scar
names(hss) <- names_for_menus(hss)

ssa <- suburban_sprawl_and_alcohol
names(ssa) <- names_for_menus(ssa)

htm <- heart_to_mouth
names(htm) <- names_for_menus(htm)

ffn <- forever_for_now
names(ffn) <- names_for_menus(ffn)

loy <- lost_on_you
names(loy) <- names_for_menus(loy)

# analytics ----

lp_albums <- readRDS("data/lp_albums.rds")

# shiny funs ----

copyright_notice <- function() { HTML("<br><br><i>The lyrics belong to LP or their respective authors.</i><br><br>") }

get_album <- function(x = "htm_input", y = names(htm), z = "Dreamcatcher", t = "htm_songs") {
  column(3,
         selectInput(
           x,
           "Explore the lyrics:",
           choices = y,
           selected = z,
           selectize = TRUE
         ),
         htmlOutput(t),
         copyright_notice()
  )
}

colors <- c("#009bae", "#66b7c2", "#eba83a", "#ff0020", "#009f8a",
            "#ff5c6a", "#e87f4a", "#6b9e89", "#00adc4", "#dfa099",
            "#6597ce", "#ac9286")

type_1_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    mutate(duration = round(as.numeric(duration_ms) / 1000, 0)) %>% 
    select(`Song name` = name, `Duration (in seconds)` = duration)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Duration (in seconds)`)) %>%
    hc_colors(colors[1]) %>% 
    hc_title(text = "Songs duration")
  
  return(p)
}

type_2_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Popularity` = popularity)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Popularity`)) %>%
    hc_colors(colors[2]) %>% 
    hc_title(text = "Songs popularity")
  
  return(p)
}

type_3_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Danceability` = danceability, `Energy` = energy) %>% 
    gather("key", "Value", -`Song name`)
    
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Value`, group = key)) %>%
    hc_colors(colors[3:4]) %>% 
    hc_title(text = "Songs danceability vs energy")
  
  return(p)
}

type_4_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Loudness (in dB)` = loudness)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Loudness (in dB)`)) %>%
    hc_colors(colors[5]) %>% 
    hc_title(text = "Songs loudness")
  
  return(p)
}

type_5_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Tempo (in BPM)` = tempo)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Tempo (in BPM)`)) %>%
    hc_colors(colors[6]) %>% 
    hc_title(text = "Songs tempo")
  
  return(p)
}

type_6_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Key (0 = C, 1 = C#/Db, etc.)` = key)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Key (0 = C, 1 = C#/Db, etc.)`)) %>%
    hc_colors(colors[7]) %>% 
    hc_title(text = "Songs key")
  
  return(p)
}

type_7_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Mode (0 = Minor, 1 = Major)` = mode)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Mode (0 = Minor, 1 = Major)`)) %>%
    hc_colors(colors[8]) %>% 
    hc_title(text = "Songs mode")
  
  return(p)
}

type_8_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Acousticness` = acousticness, `Speechiness` = speechiness) %>% 
    gather("key", "Value", -`Song name`)
  
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Value`, group = key)) %>%
    hc_colors(colors[9:10]) %>% 
    hc_title(text = "Songs acousticness vs speechiness")
  
  return(p)
}

type_9_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Liveness` = liveness)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Liveness`)) %>%
    hc_colors(colors[11]) %>% 
    hc_title(text = "Songs liveness")
  
  return(p)
}

type_10_chart <- function(x = "Heart to Mouth") {
  d <- lp_albums %>%
    filter(album == x) %>%
    select(`Song name` = name, `Valence` = valence)
  
  p <- hchart(d, "spline", hcaes(x = `Song name`, y = `Valence`)) %>%
    hc_colors(colors[12]) %>% 
    hc_title(text = "Songs valence (aka positiveness)")
  
  return(p)
}
