% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class-Drug.R
\docType{class}
\name{Drug-class}
\alias{Drug-class}
\alias{Drug}
\title{An S4 class to represent Drug objects}
\value{
An object of a class Drug
}
\description{
\code{new("Drug")} will instatiate an object of class Drug which holds
attributes and methods for useful for accessing the \href{https://open.fda.gov/apis/}{openFDA API}
}
\section{Slots}{

\describe{
\item{\code{aeTab}}{data.frame object of Adverse Events.}

\item{\code{prodTab}}{data.frame object of Product Information}

\item{\code{ndcTab}}{data.frame object of NDC information}

\item{\code{reTab}}{data.frame object of Recall Enforcement}

\item{\code{ndc}}{Numeric ndc value. This will be converted later using the
\code{\link{ndcToString}} method into \code{Obj@ndcquery} value.}

\item{\code{ndcquery}}{String of ndc value converted using \code{\link{ndcToString}}.}
}}

\examples{
drug1 <- new("Drug", apikey="Sd8Jfad834FDS")

\dontrun{
  drugnorun <- new("Drug")
}
}
\seealso{
\url{https://open.fda.gov/apis/drug/ndc/} for the actual
API description from openFDA. \code{\link{jsonlite}} for accessing API.
}
