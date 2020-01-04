#' Read Stata Files, using pkg foreign
#'
#' This is a wrapper function for `foreign::read.dta`, use is identical to the original function.
#'
#' Internally it checks the data version control file and returns the stamp associated
#' with the current version of the desired `file`.
#'
#' @param file a filename or URL as a character string.
#' @param ... other params for read.dta see \code{\link[foreign]{read.dta}}
#' @param version_control name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.
#' @param verbose logical, report returned current file version? Default is FALSE
#'
#' @seealso \code{\link[foreign]{read.dta}}
#'
#' @return A data frame with attributes.
#' @export
#'
#' @examples
#' \donttest{
#' make_data_vc()
#' foreign::write.dta_vc(cars, "my_cars.dta", verbose = TRUE)
#' foreign::read.dta_vc("my_cars.dta", verbose = TRUE)
#' }
read.dta_vc <- function(file,
                       ...,
                       version_control = "DATA_VC",
                       verbose = FALSE) {

  if(!requireNamespace("foreign", quietly = TRUE)) {
    stop("Package \"foreign\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  file <- get_current_version(file, version_control, verbose)
  foreign::read.dta(file, ...)

}


#' Write Stata Files, using pkg foreign
#'
#' This is a wrapper for `foreign::write.dta()`, use is identical to the original function.
#'
#' Internally it checks for the data version control file, and inserts or updates
#' the record for the file that you are saving. The tracking is applied to the `file`
#'
#' @param dataframe a data frame
#' @param file character string giving filename.
#' @param ... other params for write.dta see \code{\link[foreign]{write.dta}}
#' @param stamp file suffix to disambiguate, default is Sys.date()
#' @param version_control name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.
#' @param verbose logical, report update to version control file? Default is FALSE
#'
#' @seealso \code{\link[foreign]{write.dta}}
#'
#' @return NULL
#' @export
#'
#' @examples
#' \donttest{
#' make_data_vc()
#' foreign::write.dta_vc(cars, "my_cars.dta", verbose = TRUE)
#' }
write.dta_vc  <- function(dataframe,
                       file,
                       ...,
                       stamp = Sys.Date(),
                       version_control = "DATA_VC",
                       verbose = FALSE
) {

  if(!requireNamespace("foreign", quietly = TRUE)) {
    stop("Package \"foreign\" needed for this function to work. Please install it.",
         call. = FALSE)
  }

  stamp <- paste(stamp)
  update_version_control(file, stamp, version_control, verbose)
  file_stamped <- stamp_file(file, stamp)

  foreign::write.dta(dataframe, file_stamped, ...)
}
