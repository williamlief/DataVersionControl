#' Update Version Control
#'
#' @description DATA_VC is a file that tracks which data files are currently
#' used in the program. This is used because git is not tracking changes in the data
#' files. Whenever a new file is saved or an old file updated,the record in DATA_VC
#' will be updated to include the current stamp. This function is used inside the
#' save wrapper functions (e.g. saveRDS_vc)
#'
#' @param file name of file being written
#' @param stamp value of stamp
#' @param version_control version control file
#' @param verbose logical, show record update values?
#'
#' @return invisibly updates
#' @keywords internal
update_version_control <- function(file,
                                   stamp,
                                   version_control,
                                   verbose = FALSE) {

  if(!file.exists(version_control)) {
    stop(paste("version control file:", version_control, "does not exist. Have you run make_data_vc?"))
  }

  update <- data.frame(file = file,
                       stamp = stamp,
                       stringsAsFactors = FALSE)

  current <- readr::read_csv(version_control, col_types = "cc")
  current <- current[current$file != file,]

  data_vc <- rbind(current, update)

  readr::write_csv(x = data_vc, path = version_control)

  if(verbose) {
    print(paste("Record updated for:", file, "with stamp:", stamp))
  }
}
