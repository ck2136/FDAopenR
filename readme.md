
<!-- README.md is generated from README.Rmd. Please edit that file -->
`FDAopenR` : R package for accessing and manipulating openFDA API.

The following functions are implemented:

-   ndcToString: Converting numeric ndc values to appropriate ndc string values for open FDA API search
-   listSF: Listing Search Field Parameters
-   extractFDA: Extracts relevant information from the [open FDA API](https://open.fda.gov/apis/)

### Installation

``` r
# you'll want to see the vignettes, trust me
library("devtools")
devtools::install_github("ck2136/FDAopenR")
# for now not on CRAN :(
```

### Usage

``` r
library(FDAopenR)

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
               reg_num="878.4370",
               apikey="Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
               )
## *** FDA Class Inspection *** 
## *** FDA Class Inspection Complete: APIKEYFOUND***
food1 <- new(Class="Food",
               event_id="68589",
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
## Formal class 'Other' [package ".GlobalEnv"] with 21 slots
##   ..@ nsdeTab            :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ ndc                : num 6.38e+09
##   ..@ package_ndc        : chr(0) 
##   ..@ product_type       : chr(0) 
##   ..@ prop_Name          : chr(0) 
##   ..@ app_num            : chr(0) 
##   ..@ url                : chr "https://api.fda.gov/"
##   ..@ apikey             : chr "Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
##   ..@ endpointfront      : chr "other"
##   ..@ endpointback       : chr "nsde"
##   ..@ searchfield        : chr(0) 
##   ..@ aeTab              :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ prodLab            :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ ndcTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ recTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   ..@ ndcquery           : chr "63824-4736-4"
##   ..@ generic_name       : chr(0) 
##   ..@ brand_name         : chr(0) 
##   ..@ dosage_form        : chr(0) 
##   ..@ dea_schedule       : chr(0) 
##   ..@ pacakge_description: chr(0)
```

#### Search Field

``` r
listSF(drug1,"event") %>% head
## [1] "authoritynumb"           "companynumb"             "duplicate"               "fulfillexpeditecriteria"
## [5] "occurcountry"            "patient"
listSF(drug1,"label") %>% head
## [1] "abuse"                                 "accessories"                          
## [3] "active_ingredient"                     "adverse_reactions"                    
## [5] "alarms"                                "animal_pharmacology_and_or_toxicology"
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
## [1] "event_date_terminated"        "firm_fei_number"              "k_numbers"                   
## [4] "openfda"                      "other_submission_description" "pma_numbers"
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
##   receiptdateformat receiver      companynumb receivedateformat primarysource.qualification
## 1               102       NA HQWYE821915MAR04               102                        <NA>
## 2               102       NA       JACAN16471               102                           3
## 3               102       NA    WAES 97101426               102                        <NA>
## 4               102       NA CDN/97/00530/LEX               102                        <NA>
## 5               102       NA USA/97/02459/LAS               102                           1
##   primarysource.reportercountry
## 1                          <NA>
## 2                        CANADA
## 3                          <NA>
## 4                        CANADA
## 5                          <NA>
extractFDA(drug1,"ndc", "finished:true&limit=3")[1:5,1:5] 
##      product_ndc                   generic_name              labeler_name
## 1      0486-1111 Potassium Phosphate, Monobasic      Beach Products, Inc.
## 2      68084-523              Zolpidem Tartrate American Health Packaging
## 3      68084-524             Potassium Chloride American Health Packaging
## NA          <NA>                           <NA>                      <NA>
## NA.1        <NA>                           <NA>                      <NA>
##                                                                                                                                                                    packaging
## 1               19770329, 19770329, 0486-1111-05, 0486-1111-01, 500 TABLET, SOLUBLE in 1 BOTTLE (0486-1111-05), 100 TABLET, SOLUBLE in 1 BOTTLE (0486-1111-01), FALSE, FALSE
## 2    20190531, 20111122, 68084-523-21, 30 BLISTER PACK in 1 BOX, UNIT-DOSE (68084-523-21)  > 1 TABLET, FILM COATED, EXTENDED RELEASE in 1 BLISTER PACK (68084-523-11), FALSE
## 3             20130205, 68084-524-01, 100 BLISTER PACK in 1 BOX, UNIT-DOSE (68084-524-01)  > 1 TABLET, FILM COATED, EXTENDED RELEASE in 1 BLISTER PACK (68084-524-11), FALSE
## NA                                                                                                                                                                      NULL
## NA.1                                                                                                                                                                    NULL
##      brand_name_suffix
## 1             Original
## 2                 <NA>
## 3                 <NA>
## NA                <NA>
## NA.1              <NA>

extractFDA(device1,"registrationlisting",'')[1:5,1:5] 
##                                                    establishment_type                       proprietary_name
## 1    Sterilize Medical Device for Another Party (Contract Sterilizer) Ortho Development - ODC B2 Bipolar Cup
## NA                                                               NULL                                   NULL
## NA.1                                                             NULL                                   NULL
## NA.2                                                             NULL                                   NULL
## NA.3                                                             NULL                                   NULL
##      registration.status_code registration.iso_country_code registration.city registration.registration_number
## 1                           1                            US           EL PASO                          1643817
## NA                       <NA>                          <NA>              <NA>                             <NA>
## NA.1                     <NA>                          <NA>              <NA>                             <NA>
## NA.2                     <NA>                          <NA>              <NA>                             <NA>
## NA.3                     <NA>                          <NA>              <NA>                             <NA>
##      registration.zip_code registration.owner_operator.owner_operator_number registration.owner_operator.firm_name
## 1                    79936                                           1527821                    STERIS Corporation
## NA                    <NA>                                              <NA>                                  <NA>
## NA.1                  <NA>                                              <NA>                                  <NA>
## NA.2                  <NA>                                              <NA>                                  <NA>
## NA.3                  <NA>                                              <NA>                                  <NA>
##      registration.owner_operator.contact_address.city registration.owner_operator.contact_address.iso_country_code
## 1                                              Mentor                                                           US
## NA                                               <NA>                                                         <NA>
## NA.1                                             <NA>                                                         <NA>
## NA.2                                             <NA>                                                         <NA>
## NA.3                                             <NA>                                                         <NA>
##      registration.owner_operator.contact_address.address_1 registration.owner_operator.contact_address.address_2
## 1                                          5960 Heisley Rd                                                    --
## NA                                                    <NA>                                                  <NA>
## NA.1                                                  <NA>                                                  <NA>
## NA.2                                                  <NA>                                                  <NA>
## NA.3                                                  <NA>                                                  <NA>
##      registration.owner_operator.contact_address.state_province registration.owner_operator.contact_address.postal_code
## 1                                                                                                                 44060
## NA                                                         <NA>                                                    <NA>
## NA.1                                                       <NA>                                                    <NA>
## NA.2                                                       <NA>                                                    <NA>
## NA.3                                                       <NA>                                                    <NA>
##      registration.owner_operator.contact_address.state_code       registration.name registration.address_line_1
## 1                                                        OH ISOMEDIX OPERATIONS INC         1435 ISOMEDIX PLACE
## NA                                                     <NA>                    <NA>                        <NA>
## NA.1                                                   <NA>                    <NA>                        <NA>
## NA.2                                                   <NA>                    <NA>                        <NA>
## NA.3                                                   <NA>                    <NA>                        <NA>
##      registration.fei_number registration.initial_importer_flag registration.address_line_2 registration.postal_code
## 1                    1643817                                  N                                                     
## NA                      <NA>                               <NA>                        <NA>                     <NA>
## NA.1                    <NA>                               <NA>                        <NA>                     <NA>
## NA.2                    <NA>                               <NA>                        <NA>                     <NA>
## NA.3                    <NA>                               <NA>                        <NA>                     <NA>
##      registration.state_code registration.reg_expiry_date_year pma_number k_number
## 1                         TX                              2019                    
## NA                      <NA>                              <NA>       <NA>     <NA>
## NA.1                    <NA>                              <NA>       <NA>     <NA>
## NA.2                    <NA>                              <NA>       <NA>     <NA>
## NA.3                    <NA>                              <NA>       <NA>     <NA>
extractFDA(device1,"udi",'public_version_status:Update')[1:5,1:5] 
##      has_donation_id_number                                       mri_safety record_status is_rx is_labeled_as_nrl
## 1                     false Labeling does not contain MRI Safety Information     Published  true             false
## NA                     <NA>                                             <NA>          <NA>  <NA>              <NA>
## NA.1                   <NA>                                             <NA>          <NA>  <NA>              <NA>
## NA.2                   <NA>                                             <NA>          <NA>  <NA>              <NA>
## NA.3                   <NA>                                             <NA>          <NA>  <NA>              <NA>
extractFDA(device1,"udi",'has_serial_number:truelimit=10')[1:5,1:5] 
##      has_donation_id_number                                       mri_safety record_status is_rx is_labeled_as_nrl
## 1                     false Labeling does not contain MRI Safety Information     Published  true             false
## NA                     <NA>                                             <NA>          <NA>  <NA>              <NA>
## NA.1                   <NA>                                             <NA>          <NA>  <NA>              <NA>
## NA.2                   <NA>                                             <NA>          <NA>  <NA>              <NA>
## NA.3                   <NA>                                             <NA>          <NA>  <NA>              <NA>
extractFDA(device1,"pma",'decision_code:APPR&limit=3')[1:5,1:5] 
##      decision_code supplement_number                  supplement_type decision_date product_code
## 1             APPR              S058 Normal 180 Day Track No User Fee    2011-04-21          LNR
## 2             APPR              S007                                     1985-07-10          HQL
## 3             APPR              S244                Real-Time Process    2011-11-01          NVZ
## NA            <NA>              <NA>                             <NA>          <NA>         <NA>
## NA.1          <NA>              <NA>                             <NA>          <NA>         <NA>

extractFDA(food1, "enforcement", 'report_date:[20040101+TO+20131231]&limit=3')[1:5,1:5] 
##            country    city
## 1    United States Medford
## 2    United States  Newark
## 3    United States  Boston
## NA            <NA>    <NA>
## NA.1          <NA>    <NA>
##                                                                                             reason_for_recall
## 1    Product received from supplier is being recalled due to the potential to be contaminated with Salmonella
## 2                                 Products have the potential to be contaminated with Listeria monocytogenes.
## 3                                       Products contain recalled Gill's Onions due to Listeria monocytogenes
## NA                                                                                                       <NA>
## NA.1                                                                                                     <NA>
##                           address_1 address_2
## 1                2500 S Pacific Hwy          
## 2                      170 Avenue L          
## 3    18 Bunker Hill Industrial Park          
## NA                             <NA>      <NA>
## NA.1                           <NA>      <NA>
extractFDA(food1, "event", 'date_created:[20040101+TO+20131231]&limit=5')[1:5,1:5] 
##   report_number                                                                                   outcomes date_created
## 1         98178                                                                                                20071120
## 2         97634                                                    Patient Visited ER, Medically Important     20071101
## 3         97672 Patient Visited ER, Life Threatening, Patient Visited Healthcare Provider, Hospitalization     20071101
## 4         97702                                                                                                20071102
## 5         97788                                   Medically Important, Patient Visited Healthcare Provider     20071106
##                                                                reactions date_started
## 1                                                               LETHARGY         <NA>
## 2                                                  CHEMICAL BURN OF SKIN     20070928
## 3                                                    BACTERIAL INFECTION         <NA>
## 4                                                               VOMITING         <NA>
## 5 SOMNOLENCE, COGNITIVE DISORDER, MALAISE, DYSARTHRIA, CONFUSIONAL STATE     20071101

extractFDA(other1, query='marketing_start_date:[20040101+TO+20131231]&limit=5')[1:5,1:5] 
##   marketing_end_date                   proprietary_name            product_type application_number_or_citation
## 1           20181212 Childrens Mucinex Chest Congestion          HUMAN OTC DRUG                        part341
## 2               <NA>                       Axe Dry Clix          HUMAN OTC DRUG                        part350
## 3           20140430             Rolaids Extra Strength          HUMAN OTC DRUG                        part331
## 4               <NA>              Clobetasol Propionate HUMAN PRESCRIPTION DRUG                     ANDA074221
## 5               <NA>            Laxative Enteric Coated          HUMAN OTC DRUG                        part334
##   marketing_start_date
## 1             20100622
## 2             20110601
## 3             20080501
## 4             20100607
## 5             20111024
```

Authors
-------

-   [Chong Hoon Kim](mailto:chong.kim@ucdenver.edu)
