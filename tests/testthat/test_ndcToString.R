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

    drug2 <- new(Class="Drug",
                 ndc = 6878863539,
                 apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )

    drug3 <- new(Class="Drug",
                 ndc = 68788635,
                 apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )

    drug1 <- ndcToString(drug1)
    drug2 <- ndcToString(drug2)

    # error if ndc string is less than 9 or greater than 10
    expect_error(ndcToString(drug3))

    expect_equal(class(drug1@ndcquery), "character")
    expect_equal(class(drug2@ndcquery), "character")

    ## Create new instantiation of other class
    other1 <- new(Class="Other",
               ndc=638244736,
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )

    other2 <- new(Class="Other",
               ndc=6382447364,
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )

    other3 <- new(Class="Other",
               ndc=63824473,
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )

    other1 <- ndcToString(other1)
    other2 <- ndcToString(other2)

    # error if ndc string is less than 9 or greater than 10
    expect_error(ndcToString(other3))

    expect_equal(class(drug1@ndcquery), "character")
    expect_equal(class(drug2@ndcquery), "character")

  }
)

# }}}
