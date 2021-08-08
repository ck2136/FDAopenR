# FILEINFO {{{
# Filename      : test_new.R
# Purpose       : testing that instantiation works for FDAopenR
# Date created  : Thu 8 Aug 2021 07:08:51 PM MDT
# Last modified : Thu 8 Aug 2021 07:55:05 AM MDT
# Created by    : ck1
# Modified by   : ck1
# }}}
context("Instantiating new FDAopenR classes")

test_that(
  "instantiation works using FDAopenR classes",
  {
    ## Create new instantiation of drug class
    drug1 <- new(Class="Drug",
                 ndc = 687889736,
                 apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )
    device1 <- new(Class="Device",
                   apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )
    food1 <- new(Class="Food",
                 apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )
    other1 <- new(Class="Other",
                  apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )
    tob1 <- new(Class="Tobacco",
                  apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )

    expect_s4_class(drug1, "Drug")
    expect_s4_class(device1, "Device")
    expect_s4_class(food1, "Food")
    expect_s4_class(other1, "Other")
    expect_s4_class(tob1, "Tobacco")

  }
)

# }}}
