# FILEINFO {{{
# Filename      : test_find_drug.R
# Purpose       : test that find_drug() works
# Date created  : Mon 9 Aug 2021 07:08:51 PM MDT
# Last modified : Mon 9 Aug 2021 07:55:05 AM MDT
# Created by    : ck1
# Modified by   : ck1
# }}}
context("Finding drugs using find_drug()")

test_that(
  "Method find_drug() works",
  {
    ## Create new instantiation of drug class
    find_drug(ndc=687889736)
    # ndc == null
    expect_error(find_drug(ndc=NULL))

    # query specified
    res_fd1 <- find_drug(query ="product_ndc=68788-9736")

    expect_type(res_fd1, "list")

    # using ndc 9 digit
    res_fd9 <- find_drug(ndc=687889736)
    res_fd10 <- find_drug(ndc=6878863539)

    # error with less than 9 or greater than 10
    expect_error(find_drug(ndc=6878863))
    expect_error(find_drug(ndc=687886312423))

    # bname
    res_fdbn <- find_drug(bname="4231First Aid Kit")
    expect_type(res_fdbn, "list")

    # gname
    res_fdgn <- find_drug(gname="4231 First Aid Kit")
    expect_type(res_fdgn, "list")

    # dea schedule
    res_fddeas <- find_drug(dea_schedule = 1)
    expect_type(res_fddeas, "list")


  }
)

# }}}
