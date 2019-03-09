  # onload.R

.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath("www", system.file("www", package = "polish"))
}
