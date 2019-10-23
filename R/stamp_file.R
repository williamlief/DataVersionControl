#' Add the stamp to the file name
#'
#' @description this is a utility function to add the stamp to the file name.
#' The stamp is added before the last period (if no periods are present it is
#' added at the end). The stamp is delinetaed with a leading and trailing
#' underscore (`_`).
#'
#' @param file a text string with the user input file name
#' @param stamp the version control stamp to add
#'
#' @return character string
#' @keywords internal
stamp_file <- function(file, stamp) {
  if (grepl("\\.", file)) {
    sub("(.*)\\.", paste0("\\1", "_", stamp, "_."), file)
  } else {
    paste0(file, "_", stamp, "_")
  }
}
