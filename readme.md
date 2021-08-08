
<!-- README.md is generated from README.Rmd. Please edit that file -->

`FDAopenR` : R package for accessing and manipulating openFDA API.

<!-- badges: start -->

[![Travis build
status](https://app.travis-ci.com/ck2136/FDAopenR.svg?branch=master)](https://travis-ci.com/ck2136/FDAopenR)
<!-- [![Codecov test coverage](https://codecov.io/gh//dplyr/branch/master/graph/badge.svg)](https://codecov.io/gh/tidyverse/dplyr?branch=master) -->
<!-- badges: end -->

The following functions are implemented:

-   ndcToString: Converting numeric ndc values to appropriate ndc string
    values for open FDA API search
-   listSF: Listing Search Field Parameters
-   extractFDA: Extracts relevant information from the [open FDA
    API](https://open.fda.gov/apis/)

### Installation

``` r
# you'll want to see the vignettes, trust me
library("devtools")
devtools::install_github("ck2136/FDAopenR")
# for now not on CRAN :(
```

### Usage

``` r
library("FDAopenR")
library("dplyr")
## 
## Attaching package: 'dplyr'
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union

# current verison
packageVersion("FDAopenR")
## [1] '0.2.0.9000'

# - - - - - - - - - - - - - - - - - - - - - #
# Instantiate example classes
# - - - - - - - - - - - - - - - - - - - - - #
drug1 <- new(Class="Drug", 
          ndc = 687889736,
          apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
)
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
device1 <- new(Class="Device",
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
food1 <- new(Class="Food",
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
other1 <- new(Class="Other",
               ndc=6382447364,
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
```

#### Convert NDC numeric to NDC string

``` r
drug1@ndcquery 
## character(0)
drug1 <- ndcToString(drug1)
drug1@ndcquery
## [1] "68788-9736"
#ndcToString(device1) # this will be an error!
other1 <- ndcToString(other1)
other1 %>% str(max.level=2)
## Formal class 'Other' [package "FDAopenR"] with 13 slots
##   ..@ nsdeTab      :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ ndc          : num 6.38e+09
##   ..@ ndcquery     : chr "63824-4736-4"
##   ..@ url          : chr "https://api.fda.gov/"
##   ..@ apikey       : chr "Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
##   ..@ endpointfront: chr "other"
##   ..@ endpointback : chr "nsde"
##   ..@ searchfield  : chr(0) 
##   ..@ aeTab        :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ prodTab      :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ ndcTab       :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ reTab        :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ dafTab       :'data.frame':    0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
```

#### Search Field

``` r
listSF(drug1,"event") %>% head
## [1] "authoritynumb"           "companynumb"             "duplicate"               "fulfillexpeditecriteria"
## [5] "occurcountry"            "patient"
listSF(drug1,"label") %>% head
## [1] "abuse"                   "abuse_table"             "accessories"             "accessories_table"      
## [5] "active_ingredient"       "active_ingredient_table"
listSF(drug1,"ndc") %>% head
## [1] "product_id"   "product_ndc"  "spl_id"       "product_type" "finished"     "brand_name"

listSF(device1,"510k") %>% head
## [1] "address_1"                      "address_2"                      "advisory_committee"            
## [4] "advisory_committee_description" "applicant"                      "city"
listSF(device1,"classification") %>% head
## [1] "definition"                "device_class"              "device_name"               "gmp_exempt_flag"          
## [5] "implant_flag"              "life_sustain_support_flag"
listSF(device1,"enforcement") %>% head
## [1] "address_1"                  "address_2"                  "center_classification_date" "city"                      
## [5] "classification"             "code_info"
listSF(device1,"event") %>% head
## [1] "adverse_event_flag"         "date_facility_aware"        "date_manufacturer_received" "date_of_event"             
## [5] "date_received"              "date_report"
listSF(device1,"pma") %>% head
## [1] "advisory_committee"             "advisory_committee_description" "ao_statement"                  
## [4] "applicant"                      "city"                           "date_received"
listSF(device1,"recall") %>% head
## [1] "event_date_initiated"  "event_date_created"    "event_date_posted"     "event_date_terminated"
## [5] "recall_status"         "recalling_firm"
listSF(device1,"registrationlisting") %>% head
## [1] "establishment_type" "k_number"           "pma_number"         "products"           "proprietary_name"  
## [6] "registration"
listSF(device1,"udi") %>% head
## [1] "brand_name"                       "catalog_number"                   "commercial_distribution_end_date"
## [4] "commercial_distribution_status"   "company_name"                     "customer_contacts"

listSF(food1,"enforcement") %>% head
## [1] "address_1"                  "address_2"                  "center_classification_date" "city"                      
## [5] "classification"             "code_info"
listSF(food1,"event") %>% head
## [1] "consumer"     "date_created" "date_started" "outcomes"     "products"     "reactions"

listSF(other1) %>% head
## [1] "package_ndc"                    "package_ndc11"                  "proprietary_name"              
## [4] "dosage_form"                    "marketing_category"             "application_number_or_citation"
```

#### Extract FDA information

``` r
extractFDA(drug1,"event","receivedate:[20040101+TO+20081231]&limit=15")[1:5,1:5]
##   receiptdateformat receiver seriousnessdeath      companynumb receivedateformat
## 1               102       NA                1       JACAN16471               102
## 2               102       NA                1    WAES 97101426               102
## 3               102       NA             <NA> CDN/97/00530/LEX               102
## 4               102       NA             <NA> USA/97/02459/LAS               102
## 5               102       NA             <NA>    1997002193-FJ               102
extractFDA(drug1,"ndc", "finished:true&limit=3")[1:5,1:5] 
##      product_ndc        generic_name                              labeler_name                           brand_name
## 1      72342-150             Alcohol                        J.R. Watkins, LLC.            Hand Sanitizer Peppermint
## 2      72476-916 Diphenhydramine HCl Care One (Retail Business Services, LLC.) Nighttime Sleep Aid Maximum Strength
## 3      72572-170    Fentanyl Citrate                              Civica, Inc.                     Fentanyl Citrate
## NA          <NA>                <NA>                                      <NA>                                 <NA>
## NA.1        <NA>                <NA>                                      <NA>                                 <NA>
##      brand_name_suffix
## 1           Peppermint
## 2     Maximum Strength
## 3                 <NA>
## NA                <NA>
## NA.1              <NA>

extractFDA(device1,"registrationlisting",'')[1:5,1:5] 
##                                proprietary_name
## 1    Nimbus RF Multi-tined Expandable Electrode
## NA                                         NULL
## NA.1                                       NULL
## NA.2                                       NULL
## NA.3                                       NULL
##                                                                                                   establishment_type
## 1    Develop Specifications But Do Not Manufacture At This Facility, Complaint File Establishment per 21 CFR 820.198
## NA                                                                                                              NULL
## NA.1                                                                                                            NULL
## NA.2                                                                                                            NULL
## NA.3                                                                                                            NULL
##      registration.registration_number registration.fei_number registration.status_code
## 1                          3017423051              3017423051                        1
## NA                               <NA>                    <NA>                     <NA>
## NA.1                             <NA>                    <NA>                     <NA>
## NA.2                             <NA>                    <NA>                     <NA>
## NA.3                             <NA>                    <NA>                     <NA>
##      registration.initial_importer_flag registration.reg_expiry_date_year registration.name registration.address_line_1
## 1                                     N                              2021   STRATUS MEDICAL               32303 FM 2978
## NA                                 <NA>                              <NA>              <NA>                        <NA>
## NA.1                               <NA>                              <NA>              <NA>                        <NA>
## NA.2                               <NA>                              <NA>              <NA>                        <NA>
## NA.3                               <NA>                              <NA>              <NA>                        <NA>
##      registration.address_line_2 registration.city registration.state_code registration.iso_country_code
## 1                                         Magnolia                      TX                            US
## NA                          <NA>              <NA>                    <NA>                          <NA>
## NA.1                        <NA>              <NA>                    <NA>                          <NA>
## NA.2                        <NA>              <NA>                    <NA>                          <NA>
## NA.3                        <NA>              <NA>                    <NA>                          <NA>
##      registration.zip_code registration.postal_code registration.owner_operator.firm_name
## 1                    77354                                                Stratus Medical
## NA                    <NA>                     <NA>                                  <NA>
## NA.1                  <NA>                     <NA>                                  <NA>
## NA.2                  <NA>                     <NA>                                  <NA>
## NA.3                  <NA>                     <NA>                                  <NA>
##      registration.owner_operator.owner_operator_number registration.owner_operator.official_correspondent.first_name
## 1                                             10077915                                                          Lisa
## NA                                                <NA>                                                          <NA>
## NA.1                                              <NA>                                                          <NA>
## NA.2                                              <NA>                                                          <NA>
## NA.3                                              <NA>                                                          <NA>
##      registration.owner_operator.official_correspondent.middle_initial
## 1                                                                     
## NA                                                                <NA>
## NA.1                                                              <NA>
## NA.2                                                              <NA>
## NA.3                                                              <NA>
##      registration.owner_operator.official_correspondent.last_name
## 1                                                       Pelletier
## NA                                                           <NA>
## NA.1                                                         <NA>
## NA.2                                                         <NA>
## NA.3                                                         <NA>
##      registration.owner_operator.official_correspondent.subaccount_company_name
## 1                                                                              
## NA                                                                         <NA>
## NA.1                                                                       <NA>
## NA.2                                                                       <NA>
## NA.3                                                                       <NA>
##      registration.owner_operator.official_correspondent.phone_number
## 1                                                    x-385-7073029-x
## NA                                                              <NA>
## NA.1                                                            <NA>
## NA.2                                                            <NA>
## NA.3                                                            <NA>
##      registration.owner_operator.contact_address.address_1 registration.owner_operator.contact_address.address_2
## 1                                            32303 FM 2978                                                      
## NA                                                    <NA>                                                  <NA>
## NA.1                                                  <NA>                                                  <NA>
## NA.2                                                  <NA>                                                  <NA>
## NA.3                                                  <NA>                                                  <NA>
##      registration.owner_operator.contact_address.city registration.owner_operator.contact_address.state_code
## 1                                            Magnolia                                                     TX
## NA                                               <NA>                                                   <NA>
## NA.1                                             <NA>                                                   <NA>
## NA.2                                             <NA>                                                   <NA>
## NA.3                                             <NA>                                                   <NA>
##      registration.owner_operator.contact_address.state_province
## 1                                                              
## NA                                                         <NA>
## NA.1                                                       <NA>
## NA.2                                                       <NA>
## NA.3                                                       <NA>
##      registration.owner_operator.contact_address.iso_country_code
## 1                                                              US
## NA                                                           <NA>
## NA.1                                                         <NA>
## NA.2                                                         <NA>
## NA.3                                                         <NA>
##      registration.owner_operator.contact_address.postal_code pma_number k_number
## 1                                                      77354             K121773
## NA                                                      <NA>       <NA>     <NA>
## NA.1                                                    <NA>       <NA>     <NA>
## NA.2                                                    <NA>       <NA>     <NA>
## NA.3                                                    <NA>       <NA>     <NA>
extractFDA(device1,"udi",'public_version_status:Update')[1:5,1:5] 
##      has_donation_id_number                                       mri_safety record_status is_labeled_as_nrl is_rx
## 1                     false Labeling does not contain MRI Safety Information     Published             false  true
## NA                     <NA>                                             <NA>          <NA>              <NA>  <NA>
## NA.1                   <NA>                                             <NA>          <NA>              <NA>  <NA>
## NA.2                   <NA>                                             <NA>          <NA>              <NA>  <NA>
## NA.3                   <NA>                                             <NA>          <NA>              <NA>  <NA>
extractFDA(device1,"pma",'decision_code:APPR&limit=3')[1:5,1:5] 
##      pma_number supplement_number                  applicant                street_1 street_2
## 1       P810002              S050     St. Jude Medical, Inc.      ONE LILLEHEI PLAZA         
## 2       P130009              S057 EDWARDS LIFESCIENCES, LLC.         One Edwards Way         
## 3       P150013              S001 Agilent Technologies, Inc. 5301 Stevens Creek Blvd         
## NA         <NA>              <NA>                       <NA>                    <NA>     <NA>
## NA.1       <NA>              <NA>                       <NA>                    <NA>     <NA>

extractFDA(food1, "enforcement", 'report_date:[20040101+TO+20131231]&limit=3')[1:5,1:5] 
##            country    city                      address_1
## 1    United States Medford             2500 S Pacific Hwy
## 2    United States  Newark                   170 Avenue L
## 3    United States  Boston 18 Bunker Hill Industrial Park
## NA            <NA>    <NA>                           <NA>
## NA.1          <NA>    <NA>                           <NA>
##                                                                                             reason_for_recall address_2
## 1    Product received from supplier is being recalled due to the potential to be contaminated with Salmonella          
## 2                                 Products have the potential to be contaminated with Listeria monocytogenes.          
## 3                                       Products contain recalled Gill's Onions due to Listeria monocytogenes          
## NA                                                                                                       <NA>      <NA>
## NA.1                                                                                                     <NA>      <NA>
extractFDA(food1, "event", 'date_created:[20040101+TO+20131231]&limit=5')[1:5,1:5] 
##   report_number                            outcomes date_created
## 1        102922                 Medically Important     20080501
## 2        110364         Hospitalization, Disability     20090220
## 3        115759 Patient Visited Healthcare Provider     20090717
## 4        121609                       Other Outcome     20091225
## 5        128962 Patient Visited Healthcare Provider     20100812
##                                                                                              reactions date_started
## 1 TENDERNESS, NAIL DISCOLOURATION, MYALGIA, FATIGUE, CUTANEOUS CONTOUR DEFORMITY, ARTHRALGIA, ALOPECIA     20080412
## 2                              TREMOR, SLEEP DISORDER, PSYCHOTIC DISORDER, PRURITUS, APPETITE DISORDER     20090214
## 3                                   VOMITING, LOSS OF CONSCIOUSNESS, INFLUENZA LIKE ILLNESS, DIARRHOEA     20090101
## 4                                              HYPERHIDROSIS, GAIT DISTURBANCE, FEELING HOT, BLINDNESS     20081110
## 5          TENDERNESS, GASTROENTERITIS SALMONELLA, GASTROENTERITIS, FEELING OF BODY TEMPERATURE CHANGE     20100717

extractFDA(other1, query='marketing_start_date:[20040101+TO+20131231]&limit=5')[1:5,1:5] 
##                                        proprietary_name marketing_end_date application_number_or_citation
## 1                               North Triple Antibiotic           20171219                       part333B
## 2                                        Salicylic Acid               <NA>                       part358B
## 3 Clario Ultra Blue Antibacterial Foaming Skin Cleanser           20200715                       part333E
## 4                                           Lamotrigine           20120731                     ANDA078625
## 5                                    Losartan Potassium           20190131                     ANDA078232
##              product_type marketing_start_date
## 1          HUMAN OTC DRUG             20130307
## 2          HUMAN OTC DRUG             20120105
## 3          HUMAN OTC DRUG             20121112
## 4 HUMAN PRESCRIPTION DRUG             20090127
## 5 HUMAN PRESCRIPTION DRUG             20101006
```

## Authors

-   [Chong Hoon Kim](mailto:chong.kim@ucdenver.edu)
