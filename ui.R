shinyUI(
  birdPage("This is LP", color = "#ff963b",
           tabPanel("Home",
                    frontPage(
                      title = "This is LP",
                      subtitle = "\"When I get on the mic and start doing melodies, I can feel that direct line from my heart to my mouth\". LP",
                      background = "L.P._180814-0254+copy.jpg"
                    )
           ),
           tabPanelWithTitle(
             "Materials and Methods",
             column(12,
                    p("I used the packages Rspotify, tidyverse, and highcharter. In addition I created the shinybird
                      package for the Shiny layout and the lp package to have the lyrics in R.")
            )
           ),
           navbarMenu(
             "Albums",
             tabPanelWithTitle(
               "Heart to Mouth (2018)",
               "Heart to Mouth is the fifth studio album by LP.
               It was preceded by the singles \"Girls Go Wild\" and \"Recovery\".",
               get_album(),
               column(9, 
                      column(6, highchartOutput("htm_analytics_1")),
                      column(6, highchartOutput("htm_analytics_2")),
                      column(12, highchartOutput("htm_analytics_3")),
                      column(6, highchartOutput("htm_analytics_4")),
                      column(6, highchartOutput("htm_analytics_5")),
                      column(6, highchartOutput("htm_analytics_6")),
                      column(6, highchartOutput("htm_analytics_7")),
                      column(12, highchartOutput("htm_analytics_8")),
                      column(6, highchartOutput("htm_analytics_9")),
                      column(6, highchartOutput("htm_analytics_10"))
               )
             ),
             tabPanelWithTitle(
               "Lost on You (2016)",
               "Lost on You is the fourth studio album by LP.
               It was preceded by the singles \"Muddy Waters\",  \"Lost on You\" and 
               \"Other People\".",
               get_album("loy_input", names(loy), "Muddy Waters", "loy_songs"),
               column(9, 
                      column(6, highchartOutput("loy_analytics_1")),
                      column(6, highchartOutput("loy_analytics_2")),
                      column(12, highchartOutput("loy_analytics_3")),
                      column(6, highchartOutput("loy_analytics_4")),
                      column(6, highchartOutput("loy_analytics_5")),
                      column(6, highchartOutput("loy_analytics_6")),
                      column(6, highchartOutput("loy_analytics_7")),
                      column(12, highchartOutput("loy_analytics_8")),
                      column(6, highchartOutput("loy_analytics_9")),
                      column(6, highchartOutput("loy_analytics_10"))
               )
             ),
             tabPanelWithTitle(
               "Forever For Now (2014)",
               "Forever for Now is the third studio album by LP.
               It was preceded by the singles \"Night Like This\" and  \"Someday\".",
               get_album("ffn_input", names(ffn), "Heavenly Light", "ffn_songs"),
               column(9, 
                      column(6, highchartOutput("ffn_analytics_1")),
                      column(6, highchartOutput("ffn_analytics_2")),
                      column(12, highchartOutput("ffn_analytics_3")),
                      column(6, highchartOutput("ffn_analytics_4")),
                      column(6, highchartOutput("ffn_analytics_5")),
                      column(6, highchartOutput("ffn_analytics_6")),
                      column(6, highchartOutput("ffn_analytics_7")),
                      column(12, highchartOutput("ffn_analytics_8")),
                      column(6, highchartOutput("ffn_analytics_9")),
                      column(6, highchartOutput("ffn_analytics_10"))
               )
             ),
             tabPanelWithTitle(
               "Suburban Sprawl and Alcohol (2004)",
               "Suburban Sprawl and Alcohol is the second studio album by LP.
               It was edited independently.",
               get_album("ssa_input", names(ssa), "Wasted", "ssa_songs"),
               column(9,
                      HTML("This album is not available in Spotify, so here's an Easter Egg :-)<br><br>
                           <iframe width='100%' height='550' src='https://www.youtube.com/embed/0vyUlO3qgLg' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"))
             ),
             tabPanelWithTitle(
               "Heart-Shaped Scar (2001)",
               "Heart-Shaped Scar is the first studio album by LP.
               It was edited independently.",
               get_album("hss_input", names(hss), "Perfect", "hss_songs"),
               column(9, 
                      column(6, highchartOutput("hss_analytics_1")),
                      column(6, highchartOutput("hss_analytics_2")),
                      column(12, highchartOutput("hss_analytics_3")),
                      column(6, highchartOutput("hss_analytics_4")),
                      column(6, highchartOutput("hss_analytics_5")),
                      column(6, highchartOutput("hss_analytics_6")),
                      column(6, highchartOutput("hss_analytics_7")),
                      column(12, highchartOutput("hss_analytics_8")),
                      column(6, highchartOutput("hss_analytics_9")),
                      column(6, highchartOutput("hss_analytics_10"))
               )
             )
           )
  )
)
