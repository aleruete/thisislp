shinyUI(
  birdPage("This is LP", color = "#ff963b",
    tabPanel("Tab 1",
             frontPage(
               title = "This is LP",
               subtitle = "A personal approach to LP music",
               background = "L.P._180814-0254+copy.jpg"
             )
            ),
    tabPanelWithTitle(
      "Tab2",
      "insert content"
    ),
    navbarMenu(
      "Tab 2",
      tabPanelWithTitle(
        "contents",
        "goes here"
      ),
      tabPanelWithTitle(
        "contents",
        "goes and here"
      ),
      tabPanelWithTitle(
        "contents",
        "also here"
      ),
      tabPanelWithTitle(
        "contents",
        "and here"
      )
    )
  )
)
