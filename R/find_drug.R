#' find_ndc Function: Find ndc from FDA ndc database
#'
#' \code{find_ndc} returns a list of items after connecting to the openFDA API.
#'
#' @seealso             \url{https://open.fda.gov/apis/drug/ndc/} for the actual
#' API description from openFDA. \code{\link{httr}} for accessing API.
#' @param src           String describing the source (e.g. \code{"fda"}).
#' @param ndc           Integer describing the NDC number of drug of interest
#'   (e.g. \code{"fda"})
#' @param bname         String indicating brand name (e.g. \code{"lorazepam"})
#' @param gname         String indicating generic name (e.g. \code{"lorazepam"})
#' @param dea_schedule  Integer indicating class(e.g. \code{"1"})
#' @param limit         Integer indicating limit on how many items to limit in
#'   the result (e.g. \code{"1"})
#' @param query         String indicating actual \code{httr::GET()} query to the
#'   API
#' @param ...           Additional parameters specified (TBD)
#' @return A list with components based on the parameters specified.
#' @examples
#' find_drug(src="fda", ndc=687889736)
#' find_drug(src="fda", bname="Acetaminophen")
#' find_drug(src="fda", gname="Codeine")
#'
#' \dontrun{
#'   find_drug(ndc="687889736")
#' }
#' @export
find_drug <- function(
  src="fda",
  ndc=NULL,
  bname=NULL,
  gname=NULL,
  dea_schedule=NULL,
  limit = NULL,
  query = NULL,
  ...) {

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  # Check for user inputs
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  if(
    is.null(ndc) && is.null(bname) && is.null(gname) && is.null(dea_schedule) && is.null(query)
  ) {
    stop(
      "Must Enter One of the Following Information:
        1) bname 2) gname 3) dea_schedule 4) query using API syntax
       * Information of dea_schedule: https://www.deadiversion.usdoj.gov/schedules/orangebook/c_cs_alpha.pdf
       * API syntax: https://open.fda.gov/apis/drug/ndc/example-api-queries/
      "
    )
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
  # Check for user inputs ----
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

  if(src=="fda"){
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    # User Specified Query ----
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
    if(!is.null(query)){
      apires <- httr::GET(
        'https://api.fda.gov/drug/ndc.json',
        query = list(
          search = utils::URLdecode(
            paste0(query)
          ),
          limit = limit
        )
      )
    } else {
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
      # Query not specified ----
      # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

      # NDC VALUE BASED ON LENGTH OF ndc specified
      if(!is.null(ndc)){
        if(nchar(ndc) == 9){
          search_ndc = "product_ndc"
          ndcval = paste0(substring(as.character(ndc), c(0,6),c(5,9)), collapse="-")
        } else if(nchar(ndc) == 10) {
          search_ndc = "package_ndc"
          ndcval = paste0(substring(as.character(ndc), c(0,6,10),c(5,9,10)), collapse="-")
        } else {
          stop("NDC character has to be 9 or 10!")
        }
        apires <- httr::GET(
          'https://api.fda.gov/drug/ndc.json',
          query = list(
            search = utils::URLdecode(
              paste0(search_ndc,':','"',ndcval,'"')
            ),
            limit = limit
          )
        )
      }

      if(!is.null(bname)){
        apires <- httr::GET(
          'https://api.fda.gov/drug/ndc.json',
          query = list(
            search = utils::URLdecode(
              paste0('brand_name:','"',bname,'"')
            ),
            limit = limit
          )
        )
      }

      if(!is.null(gname)){
        apires <- httr::GET(
          'https://api.fda.gov/drug/ndc.json',
          query = list(
            search = utils::URLdecode(
              paste0('generic_name:','"',gname,'"')
            ),
            limit = limit
          )
        )
      }

      if(!is.null(dea_schedule)){
        apires <- httr::GET(
          'https://api.fda.gov/drug/ndc.json',
          query = list(
            search = utils::URLdecode(
              paste0('dea_schedule:','"',dea_schedule,'"')
            ),
            limit = limit
          )
        )
      }

    }
  }

  return(apires)
}
