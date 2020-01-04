#' Wrapper for write.csv
#'
#' This is a wrapper for write.csv, you can use it exactly as you would use write.csv.
#' Internally it checks for the data version control file, and inserts or updates
#' the record for the file that you are saving. The tracking is applied to the `file`
#'
#' @param x the object to be written, preferably a matrix or data frame. If not, it is attempted to coerce x to a data frame.
#' @param file 	either a character string naming a file or a connection open for writing. "" indicates output to the console.
#' @param ... other params for write.csv see \code{\link[base]{write.csv}}
#' @param stamp file suffix to disambiguate, default is Sys.time()
#' @param version_control name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.
#' @param verbose logical, report update to version control file? Default is FALSE
#'
#' @seealso \code{\link[base]{write.csv}}
#'
#' @return NULL invisibly
#' @export
#'
#' @examples
#' \donttest{
#' make_data_vc()
#' write.csv_vc(cars, "my_cars.csv", verbose = TRUE)
#' }
write.csv_vc <- function(x,
                         file,
                         ...,
                         stamp = Sys.Date(),
                         version_control = "DATA_VC",
                         verbose = FALSE
) {

  stamp <- paste(stamp)
  update_version_control(file, stamp, version_control, verbose)

  file_stamped <- stamp_file(file, stamp)
  write.csv(x, file_stamped, ...)
}


#' Wrapper for read.csv
#'
#' This is a wrapper function for read.csv. You can use it exactly as you would read.csv.
#' Internally it checks the data version control file and returns the stamp associated
#' with the current version of the desired `file`.
#'
#' @param file the name of the file which the data are to be read from.
#' @param ... other params for read.csv see \code{\link[base]{read.csv}}
#' @param version_control name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.
#' @param verbose logical, report returned current file version? Default is FALSE
#'
#' @return a string `stamp`_`file`
#' @export
#'
#' @examples
#' \donttest{
#' make_data_vc()
#' write.csv_vc(cars, "my_cars.csv", verbose = TRUE)
#' read.csv_vc("my_cars.csv", verbose = TRUE)
#' }
read.csv_vc <- function(file,
                       ...,
                       version_control = "DATA_VC",
                       verbose = FALSE) {

  file <- get_current_version(file, version_control, verbose)
  read.csv(file, ...)

}
