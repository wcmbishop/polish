
#' @title Convert to a Polish HTML Document. 
#'
#' @description
#' Custom format rendering that converts from R Markdown to a Polish style HTML
#' document. This is an extension of the \pkg{rmarkdown} 
#' \code{\link[rmarkdown]{html_document}} function.
#'
#' @param toc TRUE to include a table of contents in the output
#' @param toc_float TRUE to float the table of contents to the left of the main document content.
#' @param code_folding Enable document readers to toggle the display of R code chunks. 
#'                     Specify "none" to display all code chunks (assuming they 
#'                     were knit with echo = TRUE). Specify "hide" to hide all R 
#'                     code chunks by default (users can show hidden code chunks 
#'                     either individually or document-wide). Specify "show" to 
#'                     show all R code chunks by default.
#' @param contact email address (as a string) to show as a point of contact
#' @param source URL link (as a string) to your source code (e.g in GitHub)
#' @param type css styling type: either "default" or "inverse" (for inverse coloring)
#' @param home URL link (as string) to provide a link to a "home" site
#' @param ... optional named inputs passed into \code{\link[rmarkdown]{html_document}}.
#' 
#' @return R Markdown output format from \pkg{rmarkdown} 
#' \code{\link[rmarkdown]{html_document}}.
#' 
#' @export
polish_html <- function(toc = TRUE, toc_float = TRUE, code_folding = "hide",
                        contact = NULL, source = NULL, type = "default",
                        home = NULL, ...) {
  # css
  icon_css <- system.file(
    "www", "libs", "fontawesome-free-5.7.2-web", "css", "all.css", 
    package = "polish", mustWork = TRUE)
  bootstrap_css <- system.file(
    "www", "css", "polish.theme.css",
    package = "polish", mustWork = TRUE)
  css <- c(bootstrap_css, icon_css)
  # header
  header_html <- build_header(
    source = source, contact = contact, type = type, home = home)
  header_file <- normalizePath(
    tempfile(tmpdir = normalizePath(tempdir()), 
             fileext = ".html"), mustWork = FALSE)
  save_html_raw(header_html, file = header_file)
  # footer
  footer_file <- system.file("www", "include", "polish_html_footer.html",
                             package = "polish", mustWork = TRUE)
  # render the rmarkdown!
  rmarkdown::html_document(
    toc = toc,
    toc_float = toc_float,
    code_folding = code_folding,
    css = css,
    includes = rmarkdown::includes(in_header = header_file,
                                   after_body = footer_file),
    ...)
}
