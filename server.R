shinyServer(function(session, input, output) {
  # lyrics ----
  
  get_hss_songs <- reactive({
    HTML(
      paste(
        hss[input$hss_input][[1]],
        collapse = "<br>"
      )
    )
  })
  
  get_ssa_songs <- reactive({
    HTML(
      paste(
        ssa[input$ssa_input][[1]],
        collapse = "<br>"
      )
    )
  })
  
  get_htm_songs <- reactive({
    HTML(
      paste(
        htm[input$htm_input][[1]],
        collapse = "<br>"
      )
    )
  })
  
  get_ffn_songs <- reactive({
    HTML(
      paste(
        ffn[input$ffn_input][[1]],
        collapse = "<br>"
      )
    )
  })
  
  get_loy_songs <- reactive({
    HTML(
      paste(
        loy[input$loy_input][[1]],
        collapse = "<br>"
      )
    )
  })
  
  # output ----
  
  output$hss_songs <- renderText({ get_hss_songs() })
  output$ssa_songs <- renderText({ get_ssa_songs() })
  output$htm_songs <- renderText({ get_htm_songs() })
  output$ffn_songs <- renderText({ get_ffn_songs() })
  output$loy_songs <- renderText({ get_loy_songs() })
  
  output$hss_analytics_1 <- renderHighchart({ type_1_chart("Heart Shaped Scar") })
  output$hss_analytics_2 <- renderHighchart({ type_2_chart("Heart Shaped Scar") })
  output$hss_analytics_3 <- renderHighchart({ type_3_chart("Heart Shaped Scar") })
  output$hss_analytics_4 <- renderHighchart({ type_4_chart("Heart Shaped Scar") })
  output$hss_analytics_5 <- renderHighchart({ type_5_chart("Heart Shaped Scar") })
  output$hss_analytics_6 <- renderHighchart({ type_6_chart("Heart Shaped Scar") })
  output$hss_analytics_7 <- renderHighchart({ type_7_chart("Heart Shaped Scar") })
  output$hss_analytics_8 <- renderHighchart({ type_8_chart("Heart Shaped Scar") })
  output$hss_analytics_9 <- renderHighchart({ type_9_chart("Heart Shaped Scar") })
  output$hss_analytics_10 <- renderHighchart({ type_10_chart("Heart Shaped Scar") })
  
  output$htm_analytics_1 <- renderHighchart({ type_1_chart() })
  output$htm_analytics_2 <- renderHighchart({ type_2_chart() })
  output$htm_analytics_3 <- renderHighchart({ type_3_chart() })
  output$htm_analytics_4 <- renderHighchart({ type_4_chart() })
  output$htm_analytics_5 <- renderHighchart({ type_5_chart() })
  output$htm_analytics_6 <- renderHighchart({ type_6_chart() })
  output$htm_analytics_7 <- renderHighchart({ type_7_chart() })
  output$htm_analytics_8 <- renderHighchart({ type_8_chart() })
  output$htm_analytics_9 <- renderHighchart({ type_9_chart() })
  output$htm_analytics_10 <- renderHighchart({ type_10_chart() })
  
  output$ffn_analytics_1 <- renderHighchart({ type_1_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_2 <- renderHighchart({ type_2_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_3 <- renderHighchart({ type_3_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_4 <- renderHighchart({ type_4_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_5 <- renderHighchart({ type_5_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_6 <- renderHighchart({ type_6_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_7 <- renderHighchart({ type_7_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_8 <- renderHighchart({ type_8_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_9 <- renderHighchart({ type_9_chart("Forever For Now (Deluxe Edition)") })
  output$ffn_analytics_10 <- renderHighchart({ type_10_chart("Forever For Now (Deluxe Edition)") })
  
  output$loy_analytics_1 <- renderHighchart({ type_1_chart("Lost on You") })
  output$loy_analytics_2 <- renderHighchart({ type_2_chart("Lost on You") })
  output$loy_analytics_3 <- renderHighchart({ type_3_chart("Lost on You") })
  output$loy_analytics_4 <- renderHighchart({ type_4_chart("Lost on You") })
  output$loy_analytics_5 <- renderHighchart({ type_5_chart("Lost on You") })
  output$loy_analytics_6 <- renderHighchart({ type_6_chart("Lost on You") })
  output$loy_analytics_7 <- renderHighchart({ type_7_chart("Lost on You") })
  output$loy_analytics_8 <- renderHighchart({ type_8_chart("Lost on You") })
  output$loy_analytics_9 <- renderHighchart({ type_9_chart("Lost on You") })
  output$loy_analytics_10 <- renderHighchart({ type_10_chart("Lost on You") })
  
  # Bookmarking ----
  
  # observe({
  #   # Trigger this observer every time an input changes
  #   # strip shiny related URL parameters
  #   reactiveValuesToList(input)
  #   setBookmarkExclude(c("foobar"))
  #   session$doBookmark()
  # })
  
  # onBookmarked(function(url) {
  #   updateQueryString(url)
  # })
})
