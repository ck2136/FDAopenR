# - - - - - - - - - - - - - - - - - - - - - #
# File Name: 	'test_find_ndc.R'
# Purpose:
# Created on: 	22-02-2019
# Modified on 	17-12-2018
# Created by:
# Contact Info: ck
# - - - - - - - - - - - - - - - - - - - - - #

# - - - - - - - - - - - - - - - - - - - - #
# Environment configuration
# - - - - - - - - - - - - - - - - - - - - #

## Remove objects in workspace
rm(list=ls())
## Set working directory
library(pacman)
p_load(here, httr, dplyr, Rxfinder)
# if you are in the code folder get out!
setwd(here())

# - - - - - - - - - - - - - - - - - - - - #
# Data Import and testing
# - - - - - - - - - - - - - - - - - - - - #

# Run with ndc code
res <- find_ndc(
  src="fda",
  ndc=687889736)

content(res)

# Run with brand name
res <- find_ndc(
  src="fda",
  bname="Acetaminophen")

content(res)

# Run with brand name
res <- find_ndc(
  src="fda",
  gname="Codeine",
  dea_schedule=NULL,
  limit = NULL,
  query = NULL)

content(res)

# Run with schedule number 'CIII" C + Roman Numeral
res <- find_ndc(
  src="fda",
  dea_schedule="CIII",
  limit = 20,
  query = NULL)

content(res)

# Run with query based on how it would be done on the html
res <- find_ndc(
  src="fda",
  query = '(dea_schedule:"CII"+generic_name:"Codeine")',
  limit = 5)

res
content(res)
