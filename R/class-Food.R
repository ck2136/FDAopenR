#' An S4 class to represent Food objects
#'
#' \code{new("Food")} will instatiate an object of class Food which holds
#' attributes and methods for useful for accessing the \href{https://open.fda.gov/apis/}{openFDA API}
#'
#' @include class-FDA.R
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @slot  reTab         data.frame object of Recall Enforcement Reports
#' @slot  aeTab         data.frame object of Adverse Events.
#' @return An object of a class Food
#' @examples
#' drug1 <- new("Food", apikey="Sd8Jfad834FDS")
#'
#' \dontrun{
#'   drugnorun <- new("Food")
#' }
#' @export
setClass(Class = "Food",
         representation=representation(
                                       reTab = "data.frame",
                                       aeTab = "data.frame"
         ),
         prototype=list(
                        endpointfront = "food",
                        endpointback = "enforcement"
         ),
         contains="FDA"
)
