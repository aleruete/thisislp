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
             "Bio",
             "insert content"
           ),
           navbarMenu(
             "Albums",
             tabPanelWithTitle(
               "Heart to Mouth (2018)",
               column(12,
                      br(),
                      column(3,
                             radioButtons(
                               "htm_input",
                               "Song:",
                               choices = names(htm),
                               selected = "Dreamcatcher"
                               # selectize = TRUE
                             )
                      ),
                      column(9,
                             htmlOutput("htm_song"),
                             HTML("<br><br><i>The lyrics belong to LP or their respective authors.</i><br><br>")
                      )
               )
             ),
             tabPanelWithTitle(
               "Forever For Now (2017)",
               "goes and here"
             ),
             tabPanelWithTitle(
               "Lost on You (2017)",
               "also here"
             )
           )
  )
)
