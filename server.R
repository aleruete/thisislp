shinyServer(function(session, input, output) {
  get_htm_song <- reactive({
    HTML(
      paste(
        htm[input$htm_input][[1]],
        collapse = "<br>"
      )
    )
  })
  output$htm_song <- renderText({ get_htm_song() })
})
