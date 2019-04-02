#' An S4 method to list Search Field for Each child Object of FDA class
#'
#' \code{listSF(Obj} will search for search fields appropriate for the 
#' instantiated \code{Obj}.Users can use the search field outputted in 
#' \code{extractFDA()} to extract relevant information
#'
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @param  Obj          An Obj of class FDA or child thereof. 
#' @param  endpoint     string indicating the endpoint for the specific class.
#' For example, for the class \code{"Drug"}, the endpoint may be \code{"event"}.
#' @param \dots         Passed down to searchlist within the function
#' @return An object of a class Food
#' @examples
#' drug1 <- new("Drug", apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8")
#' drug1sf <- listSF(drug1, "event")
#'
#' \dontrun{
#'   drug1sf <- listSF("Food")
#'   drug1sf <- listSF(drug1,"random") # there is no access point
#' }
#' @export
#' @docType methods
#' @rdname  lisfSF-methods
#' @aliases listSF,character,ANY-method
setGeneric(
           name = "listSF",
           def=function(Obj,endpoint,...){
               standardGeneric("listSF")
           }
)

#' @rdname  lisfSF-methods
#' @aliases listSF,character,ANY-method
setMethod(
          f="listSF",
          signature="FDA",
          definition=function(Obj,endpoint,...){

              Obj@endpointback <- endpoint
              searchlist <- read_html(
                                      paste0(
                                             "https://open.fda.gov/apis/",
                                             Obj@endpointfront,"/",Obj@endpointback,
                                             "/searchable-fields",...)
              )
              return(
                     searchlist %>%
                         html_nodes("li button") %>%
                         html_text()
              )
          }
)

#' @rdname  lisfSF-methods
#' @aliases listSF,character,ANY-method
setMethod(
          f="listSF",
          signature="Other",
          definition=function(Obj,...){

              searchlist <- read_html(
                                      paste0(
                                             "https://open.fda.gov/apis/",
                                             Obj@endpointfront,"/",Obj@endpointback,
                                             "/searchable-fields",...)
              )
              return(
                     searchlist %>%
                         html_nodes("li button") %>%
                         html_text()
              )
          }
)
