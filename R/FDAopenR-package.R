#'@importFrom dplyr       %>% 
#'@importFrom jsonlite    fromJSON 
#'@importFrom rvest       html_nodes html_text
#'@importFrom xml2        read_html
#'@importFrom methods     new
NULL

#globalVariables(c(".","fitmed", "fitpois"))

#' \pkg{FDAopenR}: R package for accessing and manipulating openFDA API.
#'
#' INSERT HERE DESCRIPTION OF THE PACKAGE 
#'
#' @section FDAopenR classess and functions:
#' The main classes are:
#' \tabular{ll}{
#'   \code{FDA}         \tab Parent class \cr
#'   \code{Drug}        \tab FDA tested Drug class \cr
#'   \code{Device}      \tab Devices class \cr
#'   \code{Food}        \tab Food class \cr
#'   \code{Other}       \tab Other non Food, Drug, and Device classes}
#' The main methods are:
#' \tabular{ll}{
#'   \code{listSF}          \tab List Search Field for Each Classes \cr
#'   \code{extractFDA}      \tab Extract FDA data \cr
#'   \code{ndcToString}     \tab Convert numeric NDC to appropriate string with hyphens}
#' @docType package
#' @name FDAopenR-pkg
#' @seealso \href{https://open.fda.gov/apis/}{openFDA API}
#' @note
#' Development of this package was kindly supported by 
#' FUNDER under THIS GRANT NUMBER
#' @references
#' Kim et al. (2019). \emph{R package for  accessing and manipulating
#' openFDA API}. In preparation.
NULL
