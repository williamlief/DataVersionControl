% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/csv.R
\name{write_csv_vc}
\alias{write_csv_vc}
\title{Wrapper for readr::write_csv}
\usage{
write_csv_vc(x, path, ..., stamp = Sys.Date(),
  version_control = "DATA_VC", verbose = FALSE)
}
\arguments{
\item{x}{A data frame to write to disk}

\item{path}{Path or connection to write to.}

\item{...}{other params for write.csv see \code{\link[readr]{write_csv}}}

\item{stamp}{file suffix to disambiguate, default is Sys.Date()}

\item{version_control}{name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.}

\item{verbose}{logical, report update to version control file? Default is FALSE}
}
\value{
NULL invisibly
}
\description{
This is a wrapper for readr::write_csv, you can use it exactly as you would use write_csv.
Internally it checks for the data version control file, and inserts or updates
the record for the file that you are saving. The tracking is applied to the `file`
}
\examples{
\donttest{
make_data_vc()
write_csv_vc(cars, "my_cars.csv", verbose = TRUE)
}
}
\seealso{
\code{\link[readr]{write_csv}}
}
