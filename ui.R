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
               "Heart to Mouth is the fifth studio album by LP.
               It was preceded by the singles \"Girls Go Wild\" and \"Recovery\".",
               get_album()
             ),
             tabPanelWithTitle(
               "Lost on You (2016)",
               "Lost on You is the fourth studio album by LP.
               It was preceded by the singles \"Muddy Waters\",  \"Lost on You\" and 
               \"Other People\".",
               get_album("loy_input", names(loy), "Muddy Waters", "loy_songs")
             ),
             tabPanelWithTitle(
               "Forever For Now (2014)",
               "Forever for Now is the third studio album by LP.
               It was preceded by the singles \"Night Like This\" and  \"Someday\".",
               get_album("ffn_input", names(ffn), "Heavenly Light", "ffn_songs")
             ),
             tabPanelWithTitle(
               "Suburban Sprawl and Alcohol (2004)",
               "Suburban Sprawl and Alcohol is the second studio album by LP.
               It was edited independently.",
               get_album("ssa_input", names(ssa), "Wasted", "ssa_songs")
             ),
             tabPanelWithTitle(
               "Heart-Shaped Scar (2001)",
               "Heart-Shaped Scar is the first studio album by LP.
               It was edited independently.",
               get_album("hss_input", names(hss), "Perfect", "hss_songs")
             )
           )
  )
)
