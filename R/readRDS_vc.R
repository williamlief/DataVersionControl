
#' Wrapper for readRDS
#'
#' This is a wrapper function for readRDS. You can use it exactly as you would readRDS.
#' Internally it checks the data version control file and returns the stamp associated
#' with the current version of the desired `file`.
#'
#' @param file a connection or the name of the file where the `R` object is saved to or read from
#' @param ... other params for readRDS see \code{\link[base]{readRDS}}
#' @param version_control name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.
#' @param verbose logical, report returned current file version? Default is FALSE
#'
#' @return a string `stamp`_`file`
#' @export
#'
#' @examples
#' \donttest{
#' make_data_vc()
#' saveRDS_vc(cars, "my_cars.rds", verbose = TRUE)
#' readRDS_vc("my_cars.rds", verbose = TRUE)
#' }
readRDS_vc <- function(file,
                       ...,
                       version_control = "DATA_VC",
                       verbose = FALSE) {

  file <- get_current_version(file, version_control, verbose)
  readRDS(file, ...)

}
