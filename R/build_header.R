# builder_header.R

#' @import htmltools
build_header <- function(source = NULL, contact = NULL, home = NULL, 
                         type = "default") {
  # build 'contact' icon link
  if (is.null(contact)) {
    contact_li <- NULL
  } else {
    contact_li <- tags$li(
      tags$a(href = glue::glue("mailto:{contact}", contact = contact),
             tags$span(class = "fa fa-envelope"),
             glue::glue("contact: {contact}", contact = contact)))
  }
  # build 'source code' icon link
  if (is.null(source)) {
    source_li <- NULL
  } else {
    source_li <- tags$li(
      tags$a(href = source, tags$span(class = "fa fa-code"), "code"))
  }
  # build 'home' icon link
  if (is.null(home)) {
    home_li <- NULL
  } else {
    home_li <- tags$li(
      tags$a(href = home, tags$span(class = "fa fa-home"), "home"))
  }
  # sample icon
  polish_img <- system.file("images", "black-camera.png", 
                           package = "polish", mustWork = TRUE)
  # build header html
  div(id = "header",
    div(
      class = glue::glue(
        "navbar navbar-{type}  navbar-static-top",
        type = ifelse(type == "default", "default", "inverse")),
      role = "navigation",
      div(
        class = "container-fluid",
        div(
          class = "navbar-header",
          tags$button(
            type = "button", class = "navbar-toggle collapsed",
            `data-toggle` = "collapse", `data-target` = "#navbar",
            tags$span('class = "icon-bar"'),
            tags$span('class = "icon-bar"'),
            tags$span('class = "icon-bar"')),
          tags$img(src = polish_img, width = "58px", height = "36px", 
                   style = "margin-top:2px")
          ),
        div(
          id = "navbar", class = "navbar-collapse collapse",
          # right navbar
          tags$ul(
            class = "nav navbar-nav navbar-right",
            home_li,
            source_li,
            contact_li)
          )
        )
      )
    )
}
