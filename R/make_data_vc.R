#' Initialize version control `DATA_VC` file
#'
#' @description Function should be run on project startup to initialize the
#' data version control file. For optimal use, do not change file name.
#'
#' @param file default is "DATA_VC, for optimal use do not change.
#' @param replace Allows overwriting of data_vc file.
#' @param default_stamp, what stamp should be appended to files? Default is `Sys.Date()`,
#' Also recommended is `Sys.time()` for more granular version tracking.
#'
#' @return null invisibly
#' @export
#'
#' @examples
#' \donttest{make_data_vc()}
make_data_vc <- function(file = "DATA_VC", replace = FALSE,
                         default_stamp = Sys.Date()
                         ) {

  if(file.exists(file) & !replace) {
    stop(paste("version control file:", file, "already exists. Set replace = TRUE to overwrite"))
  }

  data_vc <- data.frame(
    file = character(),
    stamp = character(),
    stringsAsFactors = FALSE
  )

  datafile <- file(file, open = "wt")
  on.exit(close(datafile))

  writeLines(c(paste("default_stamp =", default_stamp)), con = datafile)
  writeLines("", con = datafile) # placeholders if we need more config options
  writeLines("", con = datafile)
  writeLines("", con = datafile)
  writeLines("", con = datafile)

  readr::write_csv(x = data_vc, path = datafile)
}
