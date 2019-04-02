#' An S4 method to Convert numeric NDC values to string values for Drug and Other class
#'
#' \code{ndcToString(Obj} will use the \code{Obj@ndc} slot to convert 
#' to appropriate ndc string for extracting information 
#'
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{jsonlite}} for accessing API.
#' @param  Obj          An Obj of class Drug or Other
#' @return An object of a class Food
#' @examples
#' drug1 <- new("Food", apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8")
#'
#' \dontrun{
#'   drugnorun <- new("Food")
#' }
#' @export
#' @docType methods
#' @rdname  ndcToString-methods
#' @aliases ndcToString,character,ANY-method
setGeneric(
           name = "ndcToString",
           def=function(Obj){
               standardGeneric("ndcToString")
           }
)

#' @rdname  ndcToString-methods
#' @aliases ndcToString,character,ANY-method
setMethod(
          f = "ndcToString",
          signature="Drug",
          definition = function(Obj){
              if(nchar(Obj@ndc) == 9){
                  Obj@ndcquery <- paste0(substring(as.character(Obj@ndc), c(0,6),c(5,9)), collapse="-")
              } else if(nchar(Obj@ndc) == 10) {
                  Obj@ndcquery <- paste0(substring(as.character(Obj@ndc), c(0,6,10),c(5,9,10)), collapse="-")
              } else {
                  stop("NDC character has to be 9 or 10!")
              }
              return(Obj)
          }
)

#' @rdname  ndcToString-methods
#' @aliases ndcToString,character,ANY-method
setMethod(
          f = "ndcToString",
          signature="Other",
          definition = function(Obj){
              if(nchar(Obj@ndc) == 9){
                  Obj@ndcquery <- paste0(substring(as.character(Obj@ndc), c(0,6),c(5,9)), collapse="-")
              } else if(nchar(Obj@ndc) == 10) {
                  Obj@ndcquery <- paste0(substring(as.character(Obj@ndc), c(0,6,10),c(5,9,10)), collapse="-")
              } else {
                  stop("NDC character has to be 9 or 10!")
              }
              return(Obj)
          }
)
