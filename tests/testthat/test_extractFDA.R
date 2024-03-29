# FILEINFO {{{
# Filename      : test_extractFDA.R
# Purpose       : test that extractFDA() works
# Date created  : Thu 8 Aug 2021 07:08:51 PM MDT
# Last modified : Thu 8 Aug 2021 07:55:05 AM MDT
# Created by    : ck1
# Modified by   : ck1
# }}}
context("Extract information from FDA")

test_that(
  "Extracting info from FDA works using extractFDA()",
  {
    ## Create new instantiation of drug class
    drug1 <- new(Class="Drug",
                 ndc = 687889736,
                 apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
    )

    extractedinfo <- extractFDA(drug1,"event","receivedate:[20040101+TO+20081231]&limit=15")[1:5,]

    expect_is(extractedinfo, "data.frame")

    expect_true(any(grepl("receiptdateformat", names(extractedinfo))))
    expect_true(any(grepl("receiver", names(extractedinfo))))
    expect_true(any(grepl("sender", names(extractedinfo))))
    expect_true(any(grepl("patient", names(extractedinfo))))
    expect_true(any(grepl("serious", names(extractedinfo))))

    # For Other class
    other1 <- new(Class="Other",
               ndc=6382447364,
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )

    extractotherinfo <- extractFDA(other1, query='marketing_start_date:[20040101+TO+20131231]&limit=5')[1:5,1:5]
    expect_is(extractotherinfo, "data.frame")
    expect_true(any(grepl("proprietary_name", names(extractotherinfo))))
    expect_true(any(grepl("marketing", names(extractotherinfo))))
    expect_true(any(grepl("application_number", names(extractotherinfo))))
    expect_true(any(grepl("product_type", names(extractotherinfo))))
    expect_true(any(grepl("marketing_start", names(extractotherinfo))))

  }
)

# }}}
