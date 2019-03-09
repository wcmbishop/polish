# write_html_raw.R

save_html_raw <- function(html, file) {
  rendered <- htmltools::renderTags(html)
  if (!dir.exists(dirname(file)))
    dir.create(dirname(file))
  writeLines(rendered$html, file, useBytes = TRUE)
}
