shinyServer(function(session, input, output) {
  get_ssa_songs <- reactive({
    HTML(
      paste(
        ssa[input$ssa_input][[1]],
        collapse = "<br>"
      )
    )
  })
  
  get_hss_songs <- reactive({
    HTML(
      paste(
        hss[input$hss_input][[1]],
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
  
  output$ssa_songs <- renderText({ get_ssa_songs() })
  output$hss_songs <- renderText({ get_hss_songs() })
  output$htm_songs <- renderText({ get_htm_songs() })
  output$ffn_songs <- renderText({ get_ffn_songs() })
  output$loy_songs <- renderText({ get_loy_songs() })
})
