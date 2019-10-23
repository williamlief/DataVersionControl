#' Wrapper for saveRDS
#'
#' This is a wrapper for saveRDS, you can use it exactly as you would use saveRDS.
#' Internally it checks for the data version control file, and inserts or updates
#' the record for the file that you are saving. The tracking is applied to the `file`
#'
#' @param object `R` object to serialize.
#' @param file a connection or the name of the file where the `R` object is saved to or read from
#' @param ... other params for saveRDS see \code{\link[base]{saveRDS}}
#' @param stamp file suffix to disambiguate, default is Sys.time()
#' @param version_control name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.
#' @param verbose logical, report update to version control file? Default is FALSE
#'
#' @seealso \code{\link[base]{saveRDS}}
#'
#' @return NULL invisibly
#' @export
#'
#' @examples
#' \donttest{
#' make_data_vc()
#' saveRDS_vc(cars, "my_cars.rds", verbose = TRUE)
#' }
saveRDS_vc <- function(object,
                       file,
                       ...,
                       stamp = Sys.Date(),
                       version_control = "DATA_VC",
                       verbose = FALSE
                       ) {

  stamp <- paste(stamp)
  update_version_control(file, stamp, version_control, verbose)
  file_stamped <- stamp_file(file, stamp)

  saveRDS(object, file_stamped, ...)
}
