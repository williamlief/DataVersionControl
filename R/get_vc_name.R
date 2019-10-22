#' Copy the stamped file name to the clip board
#'
#' @description Given a file, gets its stamped name from `DATA_VC` for cases when
#' you want to hardcode a file reference. The stamped file name is pushed to the
#' system clipboard using the `clipr` package and can be immediately pasted.
#'
#'
#' @param file name of file to retrieve stamped name
#' @param version_control name of version control file, default is `DATA_VC`
#' @param verbose logical, print output to console?
#'
#' @return writes string to system clipboard, invisibly
#' @export
#'
#' @examples
#' \donttest{
#' make_data_vc()
#' saveRDS_vc(cars, "my_cars.rds", verbose = TRUE)
#' get_vc_name("my_cars.rds")
#' }
get_vc_name <- function(file,
                        version_control = "DATA_VC",
                        verbose = FALSE) {

  x <- get_current_version(file, version_control, verbose)

  if(verbose) {print(x)}
  clipr::write_clip(x)

}
