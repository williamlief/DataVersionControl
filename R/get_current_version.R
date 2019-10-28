
#' Get Current - internal helper function
#'
#' @param file name of file to be read
#' @param version_control  version control file
#' @param verbose logical, show record returned?
#'
#' @return character string
#' @keywords internal
get_current_version <- function(file, version_control, verbose = FALSE){

  if(!file.exists(version_control)) {
    stop(paste("version control file:", version_control, "does not exist. Have you run make_data_vc?"))
  }

  current <- readr::read_csv(version_control, col_types = "cc")
  record <- current[current$file == file,]

  if(nrow(record) == 0) {
    stop(paste("Data", file, "is not tracked in",  version_control))
  }

  if(nrow(record) > 1) {
    stop(
      paste("Data", file, "has multiple entries in", version_control),
      paste("\n"),
      paste(version_control, "may be corrupted, consider re-initializing"))
  }

  if(verbose) {
    print(paste("Returned version for file:", file, "is:", record$stamp))
  }

  return(stamp_file(record$file, record$stamp))
}
