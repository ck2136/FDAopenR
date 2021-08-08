#' An S4 class to represent Tobacco objects
#'
#' \code{new("Tobacco")} will instatiate an object of class Tobacco which holds
#' attributes and methods for useful for accessing the \href{https://open.fda.gov/apis/}{openFDA API}
#'
#' @include class-FDA.R
#' @seealso             \url{https://open.fda.gov/apis/tobacco/problem/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @slot  prTab         data.frame object of Problem Reports
#' @return An object of a class Tobacco
#' @examples
#' tob1 <- new("Tobacco", apikey="Sd8Jfad834FDS")
#'
#' \dontrun{
#'   drugnorun <- new("Tobacco")
#' }
#' @export
setClass(Class = "Tobacco",
         representation=representation(
                                       prTab = "data.frame"
         ),
         prototype=list(
                        endpointfront = "tobacco",
                        endpointback = "enforcement"
         ),
         contains="FDA"
)
