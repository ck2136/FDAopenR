# FILEINFO {{{
# Filename      : test_listSF.R
# Purpose       : test that search fields are listed with listSF()
# Date created  : Thu 8 Aug 2021 07:08:51 PM MDT
# Last modified : Thu 8 Aug 2021 07:55:05 AM MDT
# Created by    : ck1
# Modified by   : ck1
# }}}
context("Search fields are listed with listSF()")

test_that(
  "Search fields are listed with listSF()",
  {
    ## Create new instantiation of drug class
    drug1 <- new(Class="Drug",
                 ndc = 687889736,
                 apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )

    listSF(drug1,"event") %>%
      expect_type("character") %>%
      expect_length(27)

    listSF(drug1,"label") %>%
      expect_type("character")

    expect_true(any(grepl("meta", listSF(drug1,"label"))))
    expect_true(any(grepl("openfda", listSF(drug1,"label"))))
    expect_true(any(grepl("id", listSF(drug1,"label"))))
    expect_true(any(grepl("components", listSF(drug1,"label"))))
    expect_true(any(grepl("alarms", listSF(drug1,"label"))))
  }
)

# }}}
