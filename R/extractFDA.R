#' An S4 method to extract information from the open FDA API
#'
#' \code{extractFDA(Obj, endpointtype, query)} for classes other than \code{Other}
#' will extract tables based on the \code{query}. The \code{Other} class only has one
#' API endpoint therefore doesn't require endpointtype (i.e. \code{extractFDA(Obj, endpointtype, query)})
#'
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @param  Obj          An Obj of class FDA or child thereof.
#' @param  endpointtype The endpoint after the class endpoint. For example,
#' If the \code{Obj} is of type indicating the endpoint for the specific class.
#' For example, for the class \code{Drug}, the endpointtype may be \code{"event"}.
#' @param query         string of query to access FDA API. For example,
#' If we want to do \code{"https://api.fda.gov/drug/event.json?search=receivedate:[20040101+TO+20081231]&limit=1"},
#' we would do \code{extractFDA(drugObj, endpointtype="event", query="receivedate:[20040101+TO+20081231]&limit=1"}
#' @param \dots         Passed down to searchlist within the function
#' @return An object of a class data.frame
#' @examples
#' drug1 <- new("Drug", apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8")
#' drug1tab <- extractFDA(drug1, "event", "receivedate:[20040101+TO+20081231]&limit=1")
#'
#' \dontrun{
#'   drugnorun <- extractFDA("Food")
#'   drugnorun <- extractFDA(drug1, "random") # not a valid access endpoint
#'   drugnorun <- extractFDA(drug1, "event", "randomquery") # not a valid query
#' }
#' @export
#' @docType methods
#' @rdname  extractFDA-methods
#' @aliases extractFDA,character,ANY-method
setGeneric(
           name = "extractFDA",
           def=function(Obj,endpointtype,query,...){
               standardGeneric("extractFDA")
           }
)

#' @rdname  extractFDA-methods
#' @aliases extractFDA,character,ANY-method
setMethod(
          f = "extractFDA",
          signature="FDA",
          definition = function(Obj,endpointtype,query,...){

              # - - - - - - - - - - - - - - - - - - - - - #
              # Set endpoint back url
              # - - - - - - - - - - - - - - - - - - - - - #
              accesspoint <- paste0(
                                    Obj@url, # base url
                                    Obj@endpointfront,"/", # endpoint front
                                    endpointtype, # endpoint back
                                    ".json?api_key=",Obj@apikey, # api key
                                    "&search=",query # search query
                                    )

              req <- fromJSON(accesspoint,...)
              # - - - - - - - - - - - - - - - - - - - - - #
              # Retrieve String using GET
              # - - - - - - - - - - - - - - - - - - - - - #

              return(req$results)
          }
)

#' @rdname  extractFDA-methods
#' @aliases extractFDA,character,ANY-method
setMethod(
          f = "extractFDA",
          signature="Other",
          definition = function(Obj,query,...){

              # - - - - - - - - - - - - - - - - - - - - - #
              # Set endpoint back url
              # - - - - - - - - - - - - - - - - - - - - - #
              accesspoint <- paste0(
                                    Obj@url, # base url
                                    Obj@endpointfront,"/", # endpoint front
                                    Obj@endpointback, # endpoint back
                                    ".json?api_key=",Obj@apikey, # api key
                                    "&search=",query # search query
                                    )

              req <- fromJSON(accesspoint,...)
              # - - - - - - - - - - - - - - - - - - - - - #
              # Retrieve String using GET
              # - - - - - - - - - - - - - - - - - - - - - #

              return(req$results)
          }
)
