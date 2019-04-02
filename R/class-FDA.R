#' An S4 class to represent FDA objects
#'
#' \code{new("FDA")} will instatiate an object of class FDA which holds
#' attributes and methods for useful for accessing the \href{https://open.fda.gov/apis/}{openFDA API}
#'
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @slot  url           Base url. Default = \code{"https://api.fda.gov/"}.
#' @slot  apikey        String of API key from  \href{https://open.fda.gov/apis/}{openFDA API}
#' @slot  endpointfront String of API access point. This will vary by different classess. 
#' For example, the \code{Drug} class will have \code{"drug"} as the \code{endpointfront} value.
#' @slot  endpointback  String of API access point. This will vary by different classess. 
#' For example, the \code{Drug} class will have a variety of options based on the 
#'  \code{\link{listSF}}. Specifically \code{"event"} may be an option.
#' @slot  searchfield   String of search field provided by open FDA. 
#' This will vary by different classess. 
#' @return An object of a class FDA.
#' @examples
#' drug1 <- new("FDA", apikey="Sd8Jfad834FDS")
#'
#' \dontrun{
#'   drugnorun <- new("FDA")
#' }
#' @export
FDA <- setClass(Class="FDA",
         representation=representation(
                                       url="character",
                                       apikey="character",
                                       endpointfront="character",
                                       endpointback="character",
                                       searchfield = "character"
         ),
         prototype=prototype(
                             url="https://api.fda.gov/"
         ),
         validity=function(object){
             cat("*** FDA Class Inspection *** \n")
             if(length(object@apikey) == 0){
                 stop("[ERROR: Please Enter a API key (apikey)]")
             }else{
             cat("*** FDA Class Inspection Complete: APIKEYFOUND*** \n")
             }
             return(TRUE)
         }
)
