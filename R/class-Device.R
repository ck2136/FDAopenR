#' An S4 class to represent Device objects
#'
#' \code{new("Device")} will instatiate an object of class Device which holds
#' attributes and methods for useful for accessing the \href{https://open.fda.gov/apis/}{openFDA API}
#'
#' @include class-FDA.R
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @slot  ftTab         data.frame object of 510(k) 
#' @slot  classTab      data.frame object of Classification
#' @slot  recTab        data.frame object of Recall Enforcement Reports
#' @slot  aeTab         data.frame object of Adverse Events.
#' @slot  pmaTab        data.frame object of Pre-market Approval
#' @slot  rcTab         data.frame object of Recalls
#' @slot  rlTab         data.frame object of Registrations and Listings
#' @slot  udiTab        data.frame object of Unique Device Identifier
#' @return An object of a class Device
#' @examples
#' drug1 <- new("Device", apikey="Sd8Jfad834FDS")
#'
#' \dontrun{
#'   drugnorun <- new("Device")
#' }
#' @export
setClass(Class = "Device",
         representation=representation(
                                       ftTab = "data.frame",
                                       classTab = "data.frame",
                                       recTab = "data.frame",
                                       aeTab = "data.frame",
                                       pmaTab = "data.frame",
                                       rcTab = "data.frame",
                                       rlTab = "data.frame",
                                       udiTab = "data.frame"
         ),
         prototype=list(
                        endpointfront = "device",
                        endpointback = "udi"
         ),
         contains="FDA"
)
