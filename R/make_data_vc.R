#' Initialize version control `DATA_VC` file
#'
#' @description Function should be run on project startup to initialize the
#' data version control file. For optimal use, do not change file name.
#'
#' @param file default is "DATA_VC, for optimal use do not change.
#' @param replace Allows overwriting of data_vc file.
#'
#' @return null invisibly
#' @export
#'
#' @examples
#' \donttest{make_data_vc()}
make_data_vc <- function(file = "DATA_VC", replace = FALSE) {

  if(file.exists(file) & !replace) {
    stop(paste("version control file:", file, "already exists. Set replace = TRUE to overwrite"))
  }

  data_vc <- data.frame(
    file = character(),
    stamp = character(),
    stringsAsFactors = FALSE
  )

  readr::write_csv(x = data_vc, path = file)
}
