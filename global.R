library(shinybird)
library(lp)
library(stringr)

htm <- heart_to_mouth
htm_names <- str_replace_all(names(htm) , "_", " ")
htm_names <- str_replace_all(htm_names, "i m", "I'm")
htm_names <- str_to_title(htm_names)
names(htm) <- htm_names
