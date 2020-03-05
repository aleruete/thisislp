shinyUI(
  birdPage("This is LP", color = "#ff963b",
           tabPanel("Home",
                    frontPage(
                      title = "This is LP",
                      subtitle = "LP (born 1981) is an American artist. In her words: \"When I get on the mic and start doing melodies, I can feel that direct line from my heart to my mouth\".",
                      background = "L.P._180814-0254+copy.jpg"
                    )
           ),
           tabPanelWithTitle(
             "Heart to Mouth",
             "Heart to Mouth (2018) is the fifth studio album by LP.
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
             "Lost on You",
             "Lost on You (2016) is the fourth studio album by LP.
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
             "Forever For Now",
             "Forever for Now (2014) is the third studio album by LP.
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
             "Suburban Sprawl and Alcohol",
             "Suburban Sprawl and Alcohol (2004) is the second studio album by LP.
               It was edited independently.",
             get_album("ssa_input", names(ssa), "Wasted", "ssa_songs"),
             column(9,
                    HTML("This album is not available in Spotify, so here's an Easter Egg :-)<br><br>
                           <iframe width='100%' height='550' src='https://www.youtube.com/embed/0vyUlO3qgLg' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"))
           ),
           tabPanelWithTitle(
             "Heart-Shaped Scar",
             "Heart-Shaped Scar (2001) is the first studio album by LP.
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
           ),
           tabPanelWithTitle(
             "How I made this",
             column(12,
                    HTML("<p>I used the packages Rspotify, tidyverse, and highcharter.
                         In addition I created the <a target='_blank' href='https://github.com/pachamaltese/shinybird'>shinybird package</a>
                         for the Shiny layout and the <a target='_blank' href='https://github.com/pachamaltese/lp'>lp package</a>
                         to have the lyrics in R.<p>")
             )
           )
  )
)
