#' An S4 class to represent Other objects
#'
#' \code{new("Other")} will instatiate an object of class Other which holds
#' attributes and methods for useful for accessing the \href{https://open.fda.gov/apis/}{openFDA API}
#'
#' @include class-FDA.R
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @slot  nsdeTab       data.frame object of NDC SPL Data Elements File (NSDE)
#' @slot  ndc           Numeric ndc value. This will be converted later using the
#' \code{\link{ndcToString}} method into \code{Obj@ndcquery} value.
#' @slot  ndcquery      String of ndc value converted using \code{\link{ndcToString}}.
#' @return An object of a class Other
#' @examples
#' drug1 <- new("Other", apikey="Sd8Jfad834FDS")
#'
#' \dontrun{
#'   drugnorun <- new("Other")
#' }
#' @export
setClass(Class = "Other",
         representation=representation(
                                       nsdeTab = "data.frame",
                                       ndc='numeric',
                                       ndcquery='character'
         ),
         prototype=list(
                        endpointfront = "other",
                        endpointback = "nsde"
         ),
         contains=c("FDA","Drug")
)
