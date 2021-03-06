% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/csv.R
\name{write.csv_vc}
\alias{write.csv_vc}
\title{Wrapper for write.csv}
\usage{
write.csv_vc(x, file, ..., stamp = Sys.Date(),
  version_control = "DATA_VC", verbose = FALSE)
}
\arguments{
\item{x}{the object to be written, preferably a matrix or data frame. If not, it is attempted to coerce x to a data frame.}

\item{file}{either a character string naming a file or a connection open for writing. "" indicates output to the console.}

\item{...}{other params for write.csv see \code{\link[utils]{write.csv}}}

\item{stamp}{file suffix to disambiguate, default is Sys.Date()}

\item{version_control}{name of data version control file. Default is `data_vc`. Should match name used in `make_data_vc`.}

\item{verbose}{logical, report update to version control file? Default is FALSE}
}
\value{
NULL invisibly
}
\description{
This is a wrapper for write.csv, you can use it exactly as you would use write.csv.
Internally it checks for the data version control file, and inserts or updates
the record for the file that you are saving. The tracking is applied to the `file`
}
\examples{
\donttest{
make_data_vc()
write.csv_vc(cars, "my_cars.csv", verbose = TRUE)
}
}
\seealso{
\code{\link[utils]{write.csv}}
}
