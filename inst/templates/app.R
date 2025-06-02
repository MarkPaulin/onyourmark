#' {{app_name}}
#'
#' @param ... Additional arguments passed on to [shiny::shinyApp()]
#' @export
{{app_name}} <- function(...) {
  ui <- function() {
    shiny::fluidPage()
  }

  server <- function(input, output, session) {
  }

  shiny::shinyApp(ui, server, ...)
}
