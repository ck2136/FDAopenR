# FILEINFO {{{
# Filename      : test_ndcToString.R
# Purpose       : test that ndc values convert to string
# Date created  : Thu 8 Aug 2021 07:08:51 PM MDT
# Last modified : Thu 8 Aug 2021 07:55:05 AM MDT
# Created by    : ck1
# Modified by   : ck1
# }}}
context("Convert ndc to string for FDAopenR class Drug")

test_that(
  "instantiation works using FDAopenR classes",
  {
    ## Create new instantiation of drug class
    drug1 <- new(Class="Drug",
                 ndc = 687889736,
                 apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )

    drug1 <- ndcToString(drug1)

    expect_equal(class(drug1@ndcquery), "character")

  }
)

# }}}
