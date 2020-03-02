library(shinybird)
library(lp)
library(dplyr)
library(stringr)

names_for_menus <- function(x) {
  y <- names(x) %>% 
    str_replace_all("_", " ") %>% 
    str_replace_all("i m", "I'm") %>% 
    str_to_title()  
  
  return(y)
}

htm <- heart_to_mouth
names(htm) <- names_for_menus(htm)

ffn <- forever_for_now
names(ffn) <- names_for_menus(ffn)

loy <- lost_on_you
names(loy) <- names_for_menus(loy)

copyright_notice <- function() { HTML("<br><br><i>The lyrics belong to LP or their respective authors.</i><br><br>") }

get_album <- function(x = "htm_input", y = names(htm), z = "Dreamcatcher", t = "htm_songs") {
  column(12,
         br(),
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
  )
}
