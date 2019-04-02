#' An S4 class to represent Drug objects
#'
#' \code{new("Drug")} will instatiate an object of class Drug which holds
#' attributes and methods for useful for accessing the \href{https://open.fda.gov/apis/}{openFDA API}
#'
#' @include class-FDA.R
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @slot  aeTab         data.frame object of Adverse Events.
#' @slot  prodTab       data.frame object of Product Information
#' @slot  ndcTab        data.frame object of NDC information 
#' @slot  reTab         data.frame object of Recall Enforcement 
#' @slot  ndc           Numeric ndc value. This will be converted later using the
#' \code{\link{ndcToString}} method into \code{Obj@ndcquery} value.
#' @slot  ndcquery      String of ndc value converted using \code{\link{ndcToString}}.
#' @return An object of a class Drug
#' @examples
#' drug1 <- new("Drug", apikey="Sd8Jfad834FDS")
#'
#' \dontrun{
#'   drugnorun <- new("Drug")
#' }
#' @export
Drug <- setClass(Class = "Drug",
         representation=representation(
                                       aeTab='data.frame',
                                       prodTab='data.frame',
                                       ndcTab='data.frame',
                                       reTab='data.frame',
                                       ndc="numeric",
                                       ndcquery="character"
         ),
         prototype=list(
                        endpointfront = "drug",
                        endpointback = "label"
         ),
         contains="FDA"
)

