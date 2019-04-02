
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
drug1 %>% str
## Formal class 'Drug' [package ".GlobalEnv"] with 16 slots
##   ..@ aeTab              :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ prodLab            :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ ndcTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ recTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ ndc                : num 6.88e+08
##   ..@ ndcquery           : chr(0) 
##   ..@ generic_name       : chr(0) 
##   ..@ brand_name         : chr(0) 
##   ..@ dosage_form        : chr(0) 
##   ..@ dea_schedule       : chr(0) 
##   ..@ pacakge_description: chr(0) 
##   ..@ url                : chr "https://api.fda.gov/"
##   ..@ apikey             : chr "Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
##   ..@ endpointfront      : chr "drug"
##   ..@ endpointback       : chr "label"
##   ..@ searchfield        : chr(0)
drug1 <- ndcToString(drug1)
drug1 %>% str
## Formal class 'Drug' [package ".GlobalEnv"] with 16 slots
##   ..@ aeTab              :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ prodLab            :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ ndcTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ recTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ ndc                : num 6.88e+08
##   ..@ ndcquery           : chr "68788-9736"
##   ..@ generic_name       : chr(0) 
##   ..@ brand_name         : chr(0) 
##   ..@ dosage_form        : chr(0) 
##   ..@ dea_schedule       : chr(0) 
##   ..@ pacakge_description: chr(0) 
##   ..@ url                : chr "https://api.fda.gov/"
##   ..@ apikey             : chr "Y3CgaZj67AotB7b4XLhzHJTY7oBWKUC3u1fYulw8"
##   ..@ endpointfront      : chr "drug"
##   ..@ endpointback       : chr "label"
##   ..@ searchfield        : chr(0)
#ndcToString(device1) # this will be an error!
other1 <- ndcToString(other1)
other1 %>% str
## Formal class 'Other' [package ".GlobalEnv"] with 21 slots
##   ..@ nsdeTab            :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
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
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ prodLab            :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ ndcTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ recTab             :'data.frame':  0 obs. of  0 variables
## Formal class 'data.frame' [package "methods"] with 4 slots
##   .. .. ..@ .Data    : list()
##   .. .. ..@ names    : chr(0) 
##   .. .. ..@ row.names: int(0) 
##   .. .. ..@ .S3Class : chr "data.frame"
##   ..@ ndcquery           : chr "63824-4736-4"
##   ..@ generic_name       : chr(0) 
##   ..@ brand_name         : chr(0) 
##   ..@ dosage_form        : chr(0) 
##   ..@ dea_schedule       : chr(0) 
##   ..@ pacakge_description: chr(0)
```

#### Search Field

``` r
listSF(drug1,"event") 
##  [1] "authoritynumb"                "companynumb"                  "duplicate"                   
##  [4] "fulfillexpeditecriteria"      "occurcountry"                 "patient"                     
##  [7] "primarysource"                "primarysourcecountry"         "receiptdate"                 
## [10] "receiptdateformat"            "receivedate"                  "receivedateformat"           
## [13] "receiver"                     "reportduplicate"              "reporttype"                  
## [16] "safetyreportid"               "safetyreportversion"          "sender"                      
## [19] "serious"                      "seriousnesscongenitalanomali" "seriousnessdeath"            
## [22] "seriousnessdisabling"         "seriousnesshospitalization"   "seriousnesslifethreatening"  
## [25] "seriousnessother"             "transmissiondate"             "transmissiondateformat"
listSF(drug1,"label") 
##  [1] "abuse"                                                     
##  [2] "accessories"                                               
##  [3] "active_ingredient"                                         
##  [4] "adverse_reactions"                                         
##  [5] "alarms"                                                    
##  [6] "animal_pharmacology_and_or_toxicology"                     
##  [7] "ask_doctor"                                                
##  [8] "ask_doctor_or_pharmacist"                                  
##  [9] "assembly_or_installation_instructions"                     
## [10] "boxed_warning"                                             
## [11] "calibration_instructions"                                  
## [12] "carcinogenesis_and_mutagenesis_and_impairment_of_fertility"
## [13] "cleaning"                                                  
## [14] "clinical_pharmacology"                                     
## [15] "clinical_studies"                                          
## [16] "compatible_accessories"                                    
## [17] "components"                                                
## [18] "contraindications"                                         
## [19] "controlled_substance"                                      
## [20] "dependence"                                                
## [21] "description"                                               
## [22] "diagram_of_device"                                         
## [23] "disposal_and_waste_handling"                               
## [24] "do_not_use"                                                
## [25] "dosage_and_administration"                                 
## [26] "dosage_forms_and_strengths"                                
## [27] "drug_abuse_and_dependence"                                 
## [28] "drug_and_or_laboratory_test_interactions"                  
## [29] "drug_interactions"                                         
## [30] "effective_time"                                            
## [31] "environmental_warning"                                     
## [32] "food_safety_warning"                                       
## [33] "general_precautions"                                       
## [34] "geriatric_use"                                             
## [35] "guaranteed_analysis_of_feed"                               
## [36] "health_care_provider_letter"                               
## [37] "health_claim"                                              
## [38] "how_supplied"                                              
## [39] "id"                                                        
## [40] "inactive_ingredient"                                       
## [41] "indications_and_usage"                                     
## [42] "information_for_owners_or_caregivers"                      
## [43] "information_for_patients"                                  
## [44] "instructions_for_use"                                      
## [45] "intended_use_of_the_device"                                
## [46] "keep_out_of_reach_of_children"                             
## [47] "labor_and_delivery"                                        
## [48] "laboratory_tests"                                          
## [49] "mechanism_of_action"                                       
## [50] "microbiology"                                              
## [51] "nonclinical_toxicology"                                    
## [52] "nonteratogenic_effects"                                    
## [53] "nursing_mothers"                                           
## [54] "openfda"                                                   
## [55] "other_safety_information"                                  
## [56] "overdosage"                                                
## [57] "package_label_principal_display_panel"                     
## [58] "patient_medication_information"                            
## [59] "pediatric_use"                                             
## [60] "pharmacodynamics"                                          
## [61] "pharmacogenomics"                                          
## [62] "pharmacokinetics"                                          
## [63] "precautions"                                               
## [64] "pregnancy"                                                 
## [65] "pregnancy_or_breast_feeding"                               
## [66] "purpose"                                                   
## [67] "questions"                                                 
## [68] "recent_major_changes"                                      
## [69] "references"                                                
## [70] "residue_warning"                                           
## [71] "risks"                                                     
## [72] "route"                                                     
## [73] "safe_handling_warning"                                     
## [74] "set_id"                                                    
## [75] "spl_indexing_data_elements"                                
## [76] "spl_medguide"                                              
## [77] "spl_patient_package_insert"                                
## [78] "spl_product_data_elements"                                 
## [79] "spl_unclassified_section"                                  
## [80] "statement_of_identity"                                     
## [81] "stop_use"                                                  
## [82] "storage_and_handling"                                      
## [83] "summary_of_safety_and_effectiveness"                       
## [84] "teratogenic_effects"                                       
## [85] "troubleshooting"                                           
## [86] "use_in_specific_populations"                               
## [87] "user_safety_warnings"                                      
## [88] "version"                                                   
## [89] "warnings"                                                  
## [90] "warnings_and_cautions"                                     
## [91] "when_using"                                                
## [92] "meta"
listSF(drug1,"ndc") 
##  [1] "product_id"              "product_ndc"             "spl_id"                  "product_type"           
##  [5] "finished"                "brand_name"              "brand_name_base"         "brand_name_suffix"      
##  [9] "generic_name"            "dosage_form"             "route"                   "marketing_start_date"   
## [13] "marketing_end_date"      "marketing_category"      "application_number"      "active_ingredients"     
## [17] "pharm_class"             "dea_schedule"            "listing_expiration_date" "packaging"              
## [21] "openfda"

listSF(device1,"510k") 
##  [1] "address_1"                      "address_2"                      "advisory_committee"            
##  [4] "advisory_committee_description" "applicant"                      "city"                          
##  [7] "clearance_type"                 "contact"                        "country_code"                  
## [10] "date_received"                  "decision_code"                  "decision_date"                 
## [13] "decision_description"           "device_name"                    "expedited_review_flag"         
## [16] "k_number"                       "openfda"                        "postal_code"                   
## [19] "product_code"                   "review_advisory_committee"      "state"                         
## [22] "statement_or_summary"           "third_party_flag"               "zip_code"                      
## [25] "meta"
listSF(device1,"classification") 
##  [1] "definition"                    "device_class"                  "device_name"                  
##  [4] "gmp_exempt_flag"               "implant_flag"                  "life_sustain_support_flag"    
##  [7] "medical_specialty"             "medical_specialty_description" "openfda"                      
## [10] "product_code"                  "regulation_number"             "review_code"                  
## [13] "review_panel"                  "submission_type_id"            "third_party_flag"             
## [16] "unclassified_reason"
listSF(device1,"enforcement") 
##  [1] "address_1"                  "address_2"                  "center_classification_date" "city"                      
##  [5] "classification"             "code_info"                  "country"                    "distribution_pattern"      
##  [9] "event_id"                   "initial_firm_notification"  "more_code_info"             "openfda"                   
## [13] "product_code"               "product_description"        "product_quantity"           "product_type"              
## [17] "reason_for_recall"          "recall_initiation_date"     "recall_number"              "recalling_firm"            
## [21] "report_date"                "state"                      "status"                     "termination_date"          
## [25] "voluntary_mandated"         "meta"
listSF(device1,"event") 
##  [1] "adverse_event_flag"                "date_facility_aware"               "date_manufacturer_received"       
##  [4] "date_of_event"                     "date_received"                     "date_report"                      
##  [7] "date_report_to_fda"                "date_report_to_manufacturer"       "device"                           
## [10] "device_date_of_manufacturer"       "distributor_address_1"             "distributor_address_2"            
## [13] "distributor_city"                  "distributor_name"                  "distributor_state"                
## [16] "distributor_zip_code"              "distributor_zip_code_ext"          "event_key"                        
## [19] "event_location"                    "event_type"                        "expiration_date_of_device"        
## [22] "health_professional"               "initial_report_to_fda"             "manufacturer_address_1"           
## [25] "manufacturer_address_2"            "manufacturer_city"                 "manufacturer_contact_address_1"   
## [28] "manufacturer_contact_address_2"    "manufacturer_contact_area_code"    "manufacturer_contact_city"        
## [31] "manufacturer_contact_country"      "manufacturer_contact_exchange"     "manufacturer_contact_extension"   
## [34] "manufacturer_contact_f_name"       "manufacturer_contact_l_name"       "manufacturer_contact_pcity"       
## [37] "manufacturer_contact_pcountry"     "manufacturer_contact_phone_number" "manufacturer_contact_plocal"      
## [40] "manufacturer_contact_postal_code"  "manufacturer_contact_state"        "manufacturer_contact_t_name"      
## [43] "manufacturer_contact_zip_code"     "manufacturer_contact_zip_ext"      "manufacturer_country"             
## [46] "manufacturer_g1_address_1"         "manufacturer_g1_address_2"         "manufacturer_g1_city"             
## [49] "manufacturer_g1_country"           "manufacturer_g1_name"              "manufacturer_g1_postal_code"      
## [52] "manufacturer_g1_state"             "manufacturer_g1_zip_code"          "manufacturer_g1_zip_code_ext"     
## [55] "manufacturer_link_flag"            "manufacturer_name"                 "manufacturer_postal_code"         
## [58] "manufacturer_state"                "manufacturer_zip_code"             "manufacturer_zip_code_ext"        
## [61] "mdr_report_key"                    "mdr_text"                          "number_devices_in_event"          
## [64] "number_patients_in_event"          "patient"                           "previous_use_code"                
## [67] "product_problem_flag"              "product_problems"                  "remedial_action"                  
## [70] "removal_correction_number"         "report_date"                       "report_number"                    
## [73] "report_source_code"                "report_to_fda"                     "report_to_manufacturer"           
## [76] "reporter_occupation_code"          "reprocessed_and_reused_flag"       "single_use_flag"                  
## [79] "source_type"                       "type_of_report"
listSF(device1,"pma") 
##  [1] "advisory_committee"             "advisory_committee_description" "ao_statement"                  
##  [4] "applicant"                      "city"                           "date_received"                 
##  [7] "decision_code"                  "decision_date"                  "docket_number"                 
## [10] "expedited_review_flag"          "fed_reg_notice_date"            "generic_name"                  
## [13] "openfda"                        "pma_number"                     "product_code"                  
## [16] "state"                          "street_1"                       "street_2"                      
## [19] "supplement_number"              "supplement_reason"              "supplement_type"               
## [22] "trade_name"                     "zip"                            "zip_ext"
listSF(device1,"recall") 
##  [1] "event_date_terminated"        "firm_fei_number"              "k_numbers"                   
##  [4] "openfda"                      "other_submission_description" "pma_numbers"                 
##  [7] "product_code"                 "product_res_number"           "res_event_number"            
## [10] "root_cause_description"       "meta"
listSF(device1,"registrationlisting") 
## [1] "establishment_type" "k_number"           "pma_number"         "products"           "proprietary_name"  
## [6] "registration"
listSF(device1,"udi") 
##  [1] "brand_name"                       "catalog_number"                   "commercial_distribution_end_date"
##  [4] "commercial_distribution_status"   "company_name"                     "customer_contacts"               
##  [7] "device_count_in_base_package"     "device_description"               "device_sizes"                    
## [10] "gmdn_terms"                       "has_donation_id_number"           "has_expiration_date"             
## [13] "has_lot_or_batch_number"          "has_manufacturing_date"           "has_serial_number"               
## [16] "identifiers"                      "is_combination_product"           "is_direct_marking_exempt"        
## [19] "is_hct_p"                         "is_kit"                           "is_labeled_as_no_nrl"            
## [22] "is_labeled_as_nrl"                "is_otc"                           "is_pm_exempt"                    
## [25] "is_rx"                            "is_single_use"                    "labeler_duns_number"             
## [28] "mri_safety"                       "premarket_submissions"            "product_codes"                   
## [31] "publish_date"                     "public_version_date"              "public_version_number"           
## [34] "public_version_status"            "record_key"                       "record_status"                   
## [37] "sterilization"                    "storage"                          "version_or_model_number"

listSF(food1,"enforcement") 
##  [1] "address_1"                  "address_2"                  "center_classification_date" "city"                      
##  [5] "classification"             "code_info"                  "country"                    "distribution_pattern"      
##  [9] "event_id"                   "initial_firm_notification"  "more_code_info"             "openfda"                   
## [13] "product_code"               "product_description"        "product_quantity"           "product_type"              
## [17] "reason_for_recall"          "recall_initiation_date"     "recall_number"              "recalling_firm"            
## [21] "report_date"                "state"                      "status"                     "termination_date"          
## [25] "voluntary_mandated"         "meta"
listSF(food1,"event") 
## [1] "consumer"      "date_created"  "date_started"  "outcomes"      "products"      "reactions"     "report_number"
## [8] "meta"

listSF(other1) 
##  [1] "package_ndc"                    "package_ndc11"                  "proprietary_name"              
##  [4] "dosage_form"                    "marketing_category"             "application_number_or_citation"
##  [7] "product_type"                   "marketing_start_date"           "marketing_end_date"            
## [10] "billing_unit"                   "meta"
```

#### Extract FDA information

``` r
extractFDA(drug1,"event","receivedate:[20040101+TO+20081231]&limit=15") %>% str
## 'data.frame':    15 obs. of  19 variables:
##  $ receiptdateformat         : chr  "102" "102" "102" "102" ...
##  $ receiver                  : logi  NA NA NA NA NA NA ...
##  $ companynumb               : chr  "HQWYE821915MAR04" "JACAN16471" "WAES 97101426" "CDN/97/00530/LEX" ...
##  $ receivedateformat         : chr  "102" "102" "102" "102" ...
##  $ primarysource             :'data.frame':  15 obs. of  2 variables:
##   ..$ qualification  : chr  NA "3" NA NA ...
##   ..$ reportercountry: chr  NA "CANADA" NA "CANADA" ...
##  $ seriousnessother          : chr  "1" NA NA NA ...
##  $ transmissiondateformat    : chr  "102" "102" "102" "102" ...
##  $ fulfillexpeditecriteria   : chr  "1" "1" "1" "1" ...
##  $ safetyreportid            : chr  "4322505-4" "5801206-7" "4318221-5" "5015436-8" ...
##  $ sender                    :'data.frame':  15 obs. of  1 variable:
##   ..$ senderorganization: chr  "FDA-Public Use" "FDA-Public Use" "FDA-Public Use" "FDA-Public Use" ...
##  $ receivedate               : chr  "20040319" "20080707" "20040315" "20060601" ...
##  $ patient                   :'data.frame':  15 obs. of  7 variables:
##   ..$ patientonsetage    : chr  "56" "26" "8" "22" ...
##   ..$ reaction           :List of 15
##   .. ..$ :'data.frame':  3 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "ARTHRALGIA" "OEDEMA PERIPHERAL" "PURPURA"
##   .. ..$ :'data.frame':  2 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "DRUG ADMINISTRATION ERROR" "OVERDOSE"
##   .. ..$ :'data.frame':  4 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "ENTERITIS NECROTICANS" "GASTROINTESTINAL PERFORATION" "NEONATAL DISORDER" "SEPSIS"
##   .. ..$ :'data.frame':  6 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "ABDOMINAL PAIN" "AGRANULOCYTOSIS" "HICCUPS" "NEUTROPENIA" ...
##   .. ..$ :'data.frame':  10 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "BAND NEUTROPHIL PERCENTAGE INCREASED" "BIOPSY BONE MARROW ABNORMAL" "CHILLS" "GRANULOCYTES MATURATION ARREST" ...
##   .. ..$ :'data.frame':  10 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "ANAEMIA" "BLOOD AMYLASE INCREASED" "BLOOD TRIGLYCERIDES INCREASED" "BONE MARROW DEPRESSION" ...
##   .. ..$ :'data.frame':  3 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "PSYCHOMOTOR SKILLS IMPAIRED" "SMALL FOR DATES BABY" "STRABISMUS"
##   .. ..$ :'data.frame':  4 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "ARRHYTHMIA" "PREMATURE BABY" "SEPSIS NEONATAL" "SMALL FOR DATES BABY"
##   .. ..$ :'data.frame':  21 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "APHTHOUS STOMATITIS" "ASTHENIA" "BACK DISORDER" "CEREBROVASCULAR ACCIDENT" ...
##   .. ..$ :'data.frame':  2 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "INTESTINAL PERFORATION" "PERITONITIS"
##   .. ..$ :'data.frame':  1 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr "ANAPHYLACTIC REACTION"
##   .. ..$ :'data.frame':  2 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "OLIGURIA" "RENAL FAILURE"
##   .. ..$ :'data.frame':  8 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "BURNING SENSATION" "CONVULSION" "DELUSIONAL DISORDER, PERSECUTORY TYPE" "EPILEPSY" ...
##   .. ..$ :'data.frame':  2 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "CATARACT" "VISUAL ACUITY REDUCED"
##   .. ..$ :'data.frame':  4 obs. of  1 variable:
##   .. .. ..$ reactionmeddrapt: chr  "BACTERIAL INFECTION" "CULTURE URINE POSITIVE" "DEHYDRATION" "VOMITING"
##   ..$ patientonsetageunit: chr  "801" "801" "804" "801" ...
##   ..$ patientsex         : chr  "1" "1" "2" "1" ...
##   ..$ drug               :List of 15
##   .. ..$ :'data.frame':  4 obs. of  13 variables:
##   .. .. ..$ drugstartdateformat      : chr  "102" NA NA NA
##   .. .. ..$ drugindication           : chr  "PYELONEPHRITIS" NA NA NA
##   .. .. ..$ drugadministrationroute  : chr  "048" NA NA NA
##   .. .. ..$ drugtreatmentduration    : chr  "4" NA NA NA
##   .. .. ..$ drugcharacterization     : chr  "1" "2" "2" "2"
##   .. .. ..$ drugstartdate            : chr  "20031227" NA NA NA
##   .. .. ..$ drugenddateformat        : chr  "102" NA NA NA
##   .. .. ..$ drugtreatmentdurationunit: chr  "804" NA NA NA
##   .. .. ..$ drugdosagetext           : chr  "ORAL" NA NA NA
##   .. .. ..$ drugauthorizationnumb    : chr  "50621" NA NA NA
##   .. .. ..$ drugenddate              : chr  "20031230" NA NA NA
##   .. .. ..$ medicinalproduct         : chr  "OROKEN (CEFIXIME, UNSPEC)" "PYOSTACINE (PRISTINAMYCIN)" "ROCEPHIN" "OFLOXACIN"
##   .. .. ..$ openfda                  :'data.frame':  4 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "55111-160" "55111-161" "60505-0560" "0404-7189" ...
##   .. .. .. ..$ package_ndc       :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "13985-602-05" "55111-161-50" "64980-515-01" "17478-713-11" ...
##   .. .. .. ..$ generic_name      :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "OFLOXACIN" "OFLOXAXIN"
##   .. .. .. ..$ spl_set_id        :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "ef145ece-56d8-4dea-a136-ec462b335641" "8db221b1-32f3-f6ca-e404-71f56a860d08" "1d19a6db-6da5-e7de-f929-2d18bdfa2cf5" "6a3dcc79-bde4-4c32-8a0e-ea14a1e1a191" ...
##   .. .. .. ..$ brand_name        :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "OFLOXACIN OTIC" "OFLOXACIN OPHTHALMIC" "OFLOXACIN" "OCUFLOX"
##   .. .. .. ..$ manufacturer_name :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "Akorn, Inc." "Altaire Pharmaceuticals Inc." "PharmaForce, Inc." "Dr. Reddy's Laboratories Limited" ...
##   .. .. .. ..$ unii              :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "A4P49JAZ9H"
##   .. .. .. ..$ rxcui             :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "207202" "312075" "198048" "198049" ...
##   .. .. .. ..$ spl_id            :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "509dde59-6f4d-410b-9835-81eb6a3e7623" "2d731281-5564-43ff-9889-07931fb2c555" "3e4a3dc8-8e55-cc6e-6fb1-3796147f4607" "d2b7e684-27f1-4ee7-b235-58b632ac9694" ...
##   .. .. .. ..$ substance_name    :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "OFLOXACIN"
##   .. .. .. ..$ product_type      :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. ..$ route             :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "AURICULAR (OTIC)" "ORAL" "OPHTHALMIC"
##   .. .. .. ..$ application_number:List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "ANDA076407" "ANDA076830" "ANDA091656" "ANDA076128" ...
##   .. ..$ :'data.frame':  1 obs. of  5 variables:
##   .. .. ..$ drugindication         : chr "DRUG ABUSE"
##   .. .. ..$ drugadministrationroute: chr "041"
##   .. .. ..$ drugcharacterization   : chr "1"
##   .. .. ..$ drugauthorizationnumb  : chr "019813"
##   .. .. ..$ medicinalproduct       : chr "DURAGESIC-100"
##   .. ..$ :'data.frame':  3 obs. of  12 variables:
##   .. .. ..$ drugstartdateformat      : chr  "102" "102" NA
##   .. .. ..$ drugindication           : chr  "PATENT DUCTUS ARTERIOSUS" "PATENT DUCTUS ARTERIOSUS" NA
##   .. .. ..$ drugadministrationroute  : chr  "042" "042" NA
##   .. .. ..$ drugtreatmentduration    : chr  "1" "1" NA
##   .. .. ..$ drugcharacterization     : chr  "1" "1" "2"
##   .. .. ..$ drugstartdate            : chr  "19970123" "19970124" NA
##   .. .. ..$ drugenddateformat        : chr  "102" "102" NA
##   .. .. ..$ drugtreatmentdurationunit: chr  "804" "804" NA
##   .. .. ..$ drugauthorizationnumb    : chr  "18878" "18878" NA
##   .. .. ..$ drugenddate              : chr  "19970123" "19970124" NA
##   .. .. ..$ medicinalproduct         : chr  "INDOCIN I.V." "INDOCIN I.V." "DOPAMINE HCL"
##   .. .. ..$ openfda                  :'data.frame':  3 obs. of  0 variables
##   .. ..$ :'data.frame':  3 obs. of  12 variables:
##   .. .. ..$ drugstartdateformat      : chr  "102" "102" NA
##   .. .. ..$ drugindication           : chr  "SCHIZOPHRENIFORM DISORDER" NA NA
##   .. .. ..$ drugadministrationroute  : chr  "048" NA NA
##   .. .. ..$ drugtreatmentduration    : chr  "154" "70560" NA
##   .. .. ..$ drugcharacterization     : chr  "1" "1" "2"
##   .. .. ..$ drugstartdate            : chr  "19970410" "20060403" NA
##   .. .. ..$ drugenddateformat        : chr  "102" "102" NA
##   .. .. ..$ drugtreatmentdurationunit: chr  "804" "806" NA
##   .. .. ..$ openfda                  :'data.frame':  3 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 3
##   .. .. .. .. ..$ : chr  "69809-0126" "69809-0127"
##   .. .. .. .. ..$ : chr  "69809-0126" "69809-0127"
##   .. .. .. .. ..$ : chr  "65977-5046" "65977-5044" "65977-5045" "62559-340" ...
##   .. .. .. ..$ package_ndc       :List of 3
##   .. .. .. .. ..$ : chr  "69809-0126-5" "69809-0127-5"
##   .. .. .. .. ..$ : chr  "69809-0126-5" "69809-0127-5"
##   .. .. .. .. ..$ : chr  "68462-224-10" "68462-221-10" "68462-221-11" "62756-430-08" ...
##   .. .. .. ..$ generic_name      :List of 3
##   .. .. .. .. ..$ : chr "CLOZAPINE"
##   .. .. .. .. ..$ : chr "CLOZAPINE"
##   .. .. .. .. ..$ : chr  "LITHIUM CARBONATE" "LITHIUM CARBONATE EXTENDED-RELEASE TABLET"
##   .. .. .. ..$ spl_set_id        :List of 3
##   .. .. .. .. ..$ : chr "90876802-0e3a-44c9-9ff7-1754dfbe736a"
##   .. .. .. .. ..$ : chr "90876802-0e3a-44c9-9ff7-1754dfbe736a"
##   .. .. .. .. ..$ : chr  "8e950a50-689d-4bf8-87ce-cffd43c6d5c2" "2ecc35ce-ad33-4954-8735-9afd344dfb4b" "68f8e2a1-0fe9-70e4-e053-2a91aa0a981d" "b2bb813c-844d-409c-bd53-d5e009c19b73" ...
##   .. .. .. ..$ brand_name        :List of 3
##   .. .. .. .. ..$ : chr "CLOZARIL"
##   .. .. .. .. ..$ : chr "CLOZARIL"
##   .. .. .. .. ..$ : chr  "LITHIUM CARBONATE" "LITHIUM CARBONATE LITHIUM CARBONATE" "LITHOBID" "RHEUMATSM" ...
##   .. .. .. ..$ manufacturer_name :List of 3
##   .. .. .. .. ..$ : chr "HLS Therapeutics (USA), Inc."
##   .. .. .. .. ..$ : chr "HLS Therapeutics (USA), Inc."
##   .. .. .. .. ..$ : chr  "West-Ward Pharmaceuticals Corp" "Boiron" "Alembic Pharmaceuticals Limited" "Alembic Pharmaceuticals Inc." ...
##   .. .. .. ..$ unii              :List of 3
##   .. .. .. .. ..$ : chr "J60AR2IKIC"
##   .. .. .. .. ..$ : chr "J60AR2IKIC"
##   .. .. .. .. ..$ : chr  "2BMD2GNA4V" "5Z6E9K79YV"
##   .. .. .. ..$ rxcui             :List of 3
##   .. .. .. .. ..$ : chr  "197535" "197536" "104776" "104775"
##   .. .. .. .. ..$ : chr  "197535" "197536" "104776" "104775"
##   .. .. .. .. ..$ : chr  "197892" "197893" "197890" "197891" ...
##   .. .. .. ..$ spl_id            :List of 3
##   .. .. .. .. ..$ : chr "4745070e-5c09-3ccd-daf8-74df1b553946"
##   .. .. .. .. ..$ : chr "4745070e-5c09-3ccd-daf8-74df1b553946"
##   .. .. .. .. ..$ : chr  "760bee09-05a4-4a0d-bff8-4cc2540575ad" "68f8e2a1-0fea-70e4-e053-2a91aa0a981d" "ae064eb1-eb6f-4427-9ccc-ef6fabfa6975" "cde132d5-8637-447a-ad23-a160fd708111" ...
##   .. .. .. ..$ substance_name    :List of 3
##   .. .. .. .. ..$ : chr "CLOZAPINE"
##   .. .. .. .. ..$ : chr "CLOZAPINE"
##   .. .. .. .. ..$ : chr "LITHIUM CARBONATE"
##   .. .. .. ..$ product_type      :List of 3
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr  "HUMAN OTC DRUG" "HUMAN PRESCRIPTION DRUG"
##   .. .. .. ..$ route             :List of 3
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. ..$ application_number:List of 3
##   .. .. .. .. ..$ : chr "NDA019758"
##   .. .. .. .. ..$ : chr "NDA019758"
##   .. .. .. .. ..$ : chr  "ANDA076832" "ANDA204779" "ANDA078715" "ANDA204445" ...
##   .. .. ..$ drugauthorizationnumb    : chr  "19758" "019758" NA
##   .. .. ..$ drugenddate              : chr  "19970917" "20060521" NA
##   .. .. ..$ medicinalproduct         : chr  "CLOZARIL" "CLOZARIL" "LITHIUM CARBONATE"
##   .. ..$ :'data.frame':  4 obs. of  11 variables:
##   .. .. ..$ drugstartdateformat      : chr  "102" "102" NA NA
##   .. .. ..$ drugindication           : chr  "NAIL TINEA" NA NA NA
##   .. .. ..$ drugadministrationroute  : chr  "048" NA NA NA
##   .. .. ..$ drugtreatmentduration    : chr  "14400" "48960" NA NA
##   .. .. ..$ drugcharacterization     : chr  "1" "1" "2" "2"
##   .. .. ..$ drugstartdate            : chr  "19970809" "19970717" NA NA
##   .. .. ..$ drugenddateformat        : chr  "102" "102" NA NA
##   .. .. ..$ drugtreatmentdurationunit: logi  NA NA NA NA
##   .. .. ..$ openfda                  :'data.frame':  4 obs. of  18 variables:
##   .. .. .. ..$ product_ndc       :List of 4
##   .. .. .. .. ..$ : chr  "0067-6296" "0067-6297" "0078-0179" "0067-6292" ...
##   .. .. .. .. ..$ : chr  "0078-0423" "0078-0358" "0078-0359" "0078-0360"
##   .. .. .. .. ..$ : chr  "11523-4328" "11523-4329" "11523-7237" "11523-7160" ...
##   .. .. .. .. ..$ : chr  "62011-0028" "70000-0178" "62011-0021" "62011-0020" ...
##   .. .. .. ..$ package_ndc       :List of 4
##   .. .. .. .. ..$ : chr  "0067-6297-01" "0067-6292-83" "0067-6293-83" "0067-6296-01" ...
##   .. .. .. .. ..$ : chr  "0078-0360-34" "0078-0358-34" "0078-0423-15" "0078-0359-34"
##   .. .. .. .. ..$ : chr  "11523-7237-9" "11523-7237-8" "11523-7237-1" "11523-4328-9" ...
##   .. .. .. .. ..$ : chr  "35418-232-02" "11534-073-05" "21130-645-06" "50844-218-07" ...
##   .. .. .. ..$ generic_name      :List of 4
##   .. .. .. .. ..$ : chr "TERBINAFINE HYDROCHLORIDE"
##   .. .. .. .. ..$ : chr "VALSARTAN"
##   .. .. .. .. ..$ : chr "LORATADINE"
##   .. .. .. .. ..$ : chr  "ASPIRIN 325 MG" "ASPIRIN 81 MG" "ASPIRIN"
##   .. .. .. ..$ spl_set_id        :List of 4
##   .. .. .. .. ..$ : chr  "8a8f2d12-a621-4334-b790-7879704aeff8" "7c6c1494-fb92-4442-bcff-764b77397495" "a262ea43-d9c5-4574-8ba9-2bb3c09e8160" "03659e44-7406-4064-8141-f552315dd05f" ...
##   .. .. .. .. ..$ : chr "5ddba454-f3e6-43c2-a7a6-58365d297213"
##   .. .. .. .. ..$ : chr  "8e14b61f-faf6-43a8-a080-75f64514217a" "b681ea25-d00b-4c8a-8054-cc6f983ce337" "660ac9df-f1b1-4c89-94dd-9fae0a013f3c" "20938e05-bc3e-51aa-e054-00144ff88e88" ...
##   .. .. .. .. ..$ : chr  "2c3f02ed-8612-453d-9819-ae1088f3a1c7" "9975b0da-1a3c-4ff6-a779-ab478c3a5807" "318cc982-23a9-4804-b6fb-248f772d7a38" "0a7ffe70-a861-003e-e054-00144ff8d46c" ...
##   .. .. .. ..$ brand_name        :List of 4
##   .. .. .. .. ..$ : chr  "LAMISIL AT" "LAMISIL AT CONTINUOUS" "LAMISIL"
##   .. .. .. .. ..$ : chr "DIOVAN"
##   .. .. .. .. ..$ : chr  "CLARITIN" "CLARITIN REDITABS" "CLARITIN LIQUI-GELS"
##   .. .. .. .. ..$ : chr  "HENRY SCHEIN ASPIRIN" "HEALTH MART ASPIRIN" "PHARBEST ASPIRIN 325MG" "ASPIRIN THIN COATED" ...
##   .. .. .. ..$ manufacturer_name :List of 4
##   .. .. .. .. ..$ : chr  "Novartis Pharmaceuticals Corporation" "GlaxoSmithKline Consumer Healthcare Holdings (US) LLC"
##   .. .. .. .. ..$ : chr "Novartis Pharmaceuticals Corporation"
##   .. .. .. .. ..$ : chr  "Bayer HealthCare LLC" "Bayer HealthCare LLC." "Bayer Healthcare LLC"
##   .. .. .. .. ..$ : chr  "Meijer" "HEB" "DOLGENCORP, LLC" "Paddock Laboratories, LLC" ...
##   .. .. .. ..$ unii              :List of 4
##   .. .. .. .. ..$ : chr "012C11ZU6G"
##   .. .. .. .. ..$ : chr "80M03YXJ7I"
##   .. .. .. .. ..$ : chr "7AJO3BO7QN"
##   .. .. .. .. ..$ : chr  "R16CO5Y76E" "H0G9379FGK"
##   .. .. .. ..$ rxcui             :List of 4
##   .. .. .. .. ..$ : chr  "105330" "313222"
##   .. .. .. .. ..$ : chr  "349483" "352001" "352274" "349200" ...
##   .. .. .. .. ..$ : chr  "668469" "744830" "206805" "828269" ...
##   .. .. .. .. ..$ : chr  "979118" "1722689" "1052678" "318272" ...
##   .. .. .. ..$ spl_id            :List of 4
##   .. .. .. .. ..$ : chr  "ad5e60d1-c357-4bca-b0f1-4e71a87fafb8" "7412f2bd-7496-481d-9b59-9e56fd5af5b7" "49a90243-d16c-458c-ab1b-9d56c750d57a" "a3509c56-cf19-4fe9-be43-d90605bb6da5" ...
##   .. .. .. .. ..$ : chr "3a7a5b56-f823-4f60-ae6d-89b42252382f"
##   .. .. .. .. ..$ : chr  "3454e6c8-e526-13fd-e054-00144ff88e88" "7093af92-b669-3183-e053-2a91aa0a69ac" "6a9d5637-e7cc-5b22-e053-2a91aa0a5b32" "482ed192-0467-0439-e054-00144ff88e88" ...
##   .. .. .. .. ..$ : chr  "616d8c4a-241b-d56c-e053-2991aa0aadec" "33fbcf19-6b19-44c6-9823-0f8aa1e345a0" "1f4e0bbe-f09e-452c-b559-64e8fdc9a2d5" "0e5df7fb-718d-4df6-e054-00144ff8d46c" ...
##   .. .. .. ..$ substance_name    :List of 4
##   .. .. .. .. ..$ : chr "TERBINAFINE HYDROCHLORIDE"
##   .. .. .. .. ..$ : chr "VALSARTAN"
##   .. .. .. .. ..$ : chr "LORATADINE"
##   .. .. .. .. ..$ : chr  "CALCIUM CARBONATE" "ASPIRIN"
##   .. .. .. ..$ product_type      :List of 4
##   .. .. .. .. ..$ : chr  "HUMAN OTC DRUG" "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN OTC DRUG"
##   .. .. .. .. ..$ : chr "HUMAN OTC DRUG"
##   .. .. .. ..$ route             :List of 4
##   .. .. .. .. ..$ : chr  "TOPICAL" "ORAL"
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. .. ..$ : chr  "ORAL" "RECTAL"
##   .. .. .. ..$ application_number:List of 4
##   .. .. .. .. ..$ : chr  "NDA021124" "NDA020539"
##   .. .. .. .. ..$ : chr "NDA021283"
##   .. .. .. .. ..$ : chr  "NDA021891" "NDA021952" "NDA019658" "NDA021993" ...
##   .. .. .. .. ..$ : chr  "part341" "part343"
##   .. .. .. ..$ nui               :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "N0000008832" "N0000008836" "N0000175721" "N0000000160" ...
##   .. .. .. ..$ pharm_class_cs    :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "Nonsteroidal Anti-inflammatory Compounds [Chemical/Ingredient]"
##   .. .. .. ..$ pharm_class_pe    :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "Decreased Prostaglandin Production [PE]" "Decreased Platelet Aggregation [PE]"
##   .. .. .. ..$ pharm_class_moa   :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "Cyclooxygenase Inhibitors [MoA]"
##   .. .. .. ..$ pharm_class_epc   :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "Nonsteroidal Anti-inflammatory Drug [EPC]" "Platelet Aggregation Inhibitor [EPC]"
##   .. .. ..$ drugenddate              : chr  "19970819" "19970819" NA NA
##   .. .. ..$ medicinalproduct         : chr  "LAMISIL" "DIOVAN" "CLARITIN" "ASPIRIN"
##   .. ..$ :'data.frame':  12 obs. of  11 variables:
##   .. .. ..$ drugstartdateformat    : chr  "102" "102" "102" "102" ...
##   .. .. ..$ drugindication         : chr  "RENAL TRANSPLANT" "RENAL TRANSPLANT" "RENAL TRANSPLANT" "RENAL TRANSPLANT" ...
##   .. .. ..$ drugadministrationroute: chr  "048" "048" "048" "048" ...
##   .. .. ..$ drugcharacterization   : chr  "1" "1" "1" "1" ...
##   .. .. ..$ drugstartdate          : chr  "19960511" "19960511" "19960513" "19960514" ...
##   .. .. ..$ drugenddateformat      : chr  "102" "102" "102" "102" ...
##   .. .. ..$ drugdosagetext         : chr  "SEE IMAGE" "SEE IMAGE" "SEE IMAGE" "SEE IMAGE" ...
##   .. .. ..$ openfda                :'data.frame':    12 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 12
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0469-1230" "0469-0657" "0469-0617" "0469-0607" ...
##   .. .. .. .. ..$ : chr  "0009-0056" "59746-001" "59746-003" "59746-002" ...
##   .. .. .. .. ..$ : chr  "70771-1141" "70771-1140" "68382-120" "68382-119" ...
##   .. .. .. ..$ package_ndc       :List of 12
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "0469-0617-73" "0469-1230-50" "0469-0657-11" "0469-3016-01" ...
##   .. .. .. .. ..$ : chr  "70771-1351-4" "0009-0049-02" "68382-917-01" "59746-015-04" ...
##   .. .. .. .. ..$ : chr  "65649-231-41" "65841-602-01" "65841-602-05" "68382-119-01" ...
##   .. .. .. ..$ generic_name      :List of 12
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "METHYLPREDNISOLONE"
##   .. .. .. .. ..$ : chr "AZATHIOPRINE"
##   .. .. .. ..$ spl_set_id        :List of 12
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr "7f667de1-9dfa-4bd6-8ba0-15ee2d78873b"
##   .. .. .. .. ..$ : chr  "b1908c2a-c596-4e2a-b2bd-0745d4fea31a" "97431ce3-85a9-41c3-817d-68963f9536cc" "fe9c15b5-4264-45f1-87b5-f7e1d6e6ddee" "e86fbda8-00e4-4d54-841a-59dea6c15e70" ...
##   .. .. .. .. ..$ : chr  "9050af7a-19c6-4670-937a-9445605de995" "1cd03d78-d567-4449-be98-0e8652ceff6a" "c49b7cc5-0eed-43b7-b7ad-cbb1b6f0cd2c" "ceab8e8b-d022-4d0c-a552-cc5782446248" ...
##   .. .. .. ..$ brand_name        :List of 12
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr "PROGRAF"
##   .. .. .. .. ..$ : chr  "METHYLPREDNISOLONE SODIUM SUCCINATE" "MEDROL" "METHYLPREDNISOLONE"
##   .. .. .. .. ..$ : chr  "AZATHIOPRINE" "IMURAN" "AZASAN"
##   .. .. .. ..$ manufacturer_name :List of 12
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr "Astellas Pharma US, Inc."
##   .. .. .. .. ..$ : chr  "Ingenus Pharmaceuticals, LLC" "JUBILANT CADISTA PHARMACEUTICALS INC." "Amneal Biosciences LLC" "Zydus Pharmaceuticals (USA) Inc." ...
##   .. .. .. .. ..$ : chr  "Amneal Pharmaceuticals LLC" "Glenmark Pharmaceuticals, Inc" "Salix Pharmaceuticals" "Zydus Pharmaceuticals (USA) Inc." ...
##   .. .. .. ..$ unii              :List of 12
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr "WM0HAQ4WNM"
##   .. .. .. .. ..$ : chr  "X4W7ZR7023" "LEC9GKY20K"
##   .. .. .. .. ..$ : chr "MRK240IY2L"
##   .. .. .. ..$ rxcui             :List of 12
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "198378" "198379" "2052704" "198377" ...
##   .. .. .. .. ..$ : chr  "197971" "762675" "197973" "311659" ...
##   .. .. .. .. ..$ : chr  "404476" "404475" "359229" "359228" ...
##   .. .. .. ..$ spl_id            :List of 12
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr "d87689bb-d370-4c05-ab06-ce9187a1dd59"
##   .. .. .. .. ..$ : chr  "91f8f6d9-a66c-4b57-9244-c24fb85c0293" "c634cd6f-9f29-4339-9601-68f0bf57ae24" "70f1f834-99d4-4531-befc-61072f5e82f5" "ce6f7014-0dac-45c3-b953-86c6262bf4dc" ...
##   .. .. .. .. ..$ : chr  "52d9d9c5-cb11-4901-ab91-bc03805af972" "8df3d52c-190c-4e32-9b06-183b3098e3de" "df47ff8b-81a6-4a2c-aac5-ac089a736ecb" "7d4e4d80-154c-d9b8-e053-2a91aa0a6f7b" ...
##   .. .. .. ..$ substance_name    :List of 12
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr "TACROLIMUS"
##   .. .. .. .. ..$ : chr  "METHYLPREDNISOLONE SODIUM SUCCINATE" "METHYLPREDNISOLONE"
##   .. .. .. .. ..$ : chr "AZATHIOPRINE"
##   .. .. .. ..$ product_type      :List of 12
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. ..$ route             :List of 12
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "INTRAMUSCULAR" "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. ..$ application_number:List of 12
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA050708" "NDA050709" "NDA210115"
##   .. .. .. .. ..$ : chr  "NDA011153" "ANDA204072" "ANDA040194" "ANDA207549" ...
##   .. .. .. .. ..$ : chr  "ANDA075252" "NDA016324" "ANDA077621" "ANDA074069" ...
##   .. .. ..$ drugauthorizationnumb  : chr  "50708" "50708" "50708" "50708" ...
##   .. .. ..$ drugenddate            : chr  "19960511" "19960512" "19960513" "19960514" ...
##   .. .. ..$ medicinalproduct       : chr  "PROGRAF" "PROGRAF" "PROGRAF" "PROGRAF" ...
##   .. ..$ :'data.frame':  10 obs. of  8 variables:
##   .. .. ..$ drugindication           : chr  "DRUG USE FOR UNKNOWN INDICATION" "DRUG USE FOR UNKNOWN INDICATION" "DRUG USE FOR UNKNOWN INDICATION" NA ...
##   .. .. ..$ drugadministrationroute  : chr  "015" "015" "015" "015" ...
##   .. .. ..$ drugtreatmentduration    : chr  "107" "92" "90" NA ...
##   .. .. ..$ drugcharacterization     : chr  "1" "1" "1" "1" ...
##   .. .. ..$ drugtreatmentdurationunit: chr  "804" "804" "804" NA ...
##   .. .. ..$ openfda                  :'data.frame':  10 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 10
##   .. .. .. .. ..$ : chr "50458-255"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "0781-5379" "0187-0063" "0187-0064" "0187-0065" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ package_ndc       :List of 10
##   .. .. .. .. ..$ : chr "50458-255-01"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "64125-904-01" "50383-705-30" "64125-904-05" "0641-6047-01" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ generic_name      :List of 10
##   .. .. .. .. ..$ : chr "HALOPERIDOL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "LORAZEPAM"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_set_id        :List of 10
##   .. .. .. .. ..$ : chr "27cfe684-7d11-4f37-9c8b-b2bdd6b5348e"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "5ca13415-4b77-4131-a9d2-6db26bc49167" "ad2a0633-50fe-4180-b743-c1e49fc110c6" "2c8bba31-eb1e-432c-b82d-e239ce8b34dd" "1e9f779d-5859-4b11-9b7a-d3efcbe83693" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ brand_name        :List of 10
##   .. .. .. .. ..$ : chr "HALDOL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "LORAZEPAM" "ATIVAN"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ manufacturer_name :List of 10
##   .. .. .. .. ..$ : chr "Janssen Pharmaceuticals, Inc."
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "Amneal Pharmaceuticals LLC" "Akorn, Inc." "Ranbaxy Pharmaceuticals Inc." "Excellium Pharmaceutical Inc." ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ unii              :List of 10
##   .. .. .. .. ..$ : chr "6387S86PK3"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "O26FZP769L"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ rxcui             :List of 10
##   .. .. .. .. ..$ : chr  "1719669" "1719646"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "763028" "1665326" "1665327" "104719" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_id            :List of 10
##   .. .. .. .. ..$ : chr "9c65afc5-4139-490c-9fda-2c0b9645db28"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "b38df9b3-29c5-4bdc-a9e6-5dbdd188da48" "30a1b292-640f-477d-b193-f564e84d0436" "6a554600-ab95-45e7-aecc-988ecb821b5b" "028a7a1b-160e-40d2-b243-e18362ce9f37" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ substance_name    :List of 10
##   .. .. .. .. ..$ : chr "HALOPERIDOL LACTATE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "LORAZEPAM"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ product_type      :List of 10
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ route             :List of 10
##   .. .. .. .. ..$ : chr "INTRAMUSCULAR"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "INTRAMUSCULAR" "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ application_number:List of 10
##   .. .. .. .. ..$ : chr "NDA015923"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "ANDA074282" "NDA017794" "ANDA077754" "ANDA072926" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. ..$ drugauthorizationnumb    : chr  "15923" NA NA NA ...
##   .. .. ..$ medicinalproduct         : chr  "HALDOL" "FLUNITRAZEPAM" "DIAMORPHINE" "LEVOMETHADONE" ...
##   .. ..$ :'data.frame':  6 obs. of  8 variables:
##   .. .. ..$ drugadministrationroute  : chr  "015" "015" "015" "015" ...
##   .. .. ..$ drugtreatmentduration    : chr  "8" "8" "8" "13" ...
##   .. .. ..$ drugcharacterization     : chr  "1" "1" "1" "1" ...
##   .. .. ..$ drugtreatmentdurationunit: chr  "803" "803" "804" "804" ...
##   .. .. ..$ openfda                  :'data.frame':  6 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 6
##   .. .. .. .. ..$ : chr "50458-255"
##   .. .. .. .. ..$ : chr "50458-255"
##   .. .. .. .. ..$ : chr  "67457-352" "63323-388" "63323-389" "0781-9242" ...
##   .. .. .. .. ..$ : chr  "0187-0659" "0187-0658" "0409-1273" "0527-1767" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ package_ndc       :List of 6
##   .. .. .. .. ..$ : chr "50458-255-01"
##   .. .. .. .. ..$ : chr "50458-255-01"
##   .. .. .. .. ..$ : chr  "63323-389-10" "44567-100-10" "43858-112-95" "0781-9402-95" ...
##   .. .. .. .. ..$ : chr  "52959-047-01" "52959-047-00" "52959-047-03" "52959-047-02" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ generic_name      :List of 6
##   .. .. .. .. ..$ : chr "HALOPERIDOL"
##   .. .. .. .. ..$ : chr "HALOPERIDOL"
##   .. .. .. .. ..$ : chr  "AMPICILLIN INJECTION" "AMPICILLIN SODIUM" "AMPICILLIN"
##   .. .. .. .. ..$ : chr "DIAZEPAM"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_set_id        :List of 6
##   .. .. .. .. ..$ : chr "27cfe684-7d11-4f37-9c8b-b2bdd6b5348e"
##   .. .. .. .. ..$ : chr "27cfe684-7d11-4f37-9c8b-b2bdd6b5348e"
##   .. .. .. .. ..$ : chr  "b371e1a5-1fef-4df2-8940-c4fc02b9e2f0" "3d1c4b4d-18e2-4e8f-9701-badaa462c733" "66146d45-0fe4-46b9-b2b1-b67c219088b7" "38ec7b7a-9caf-45f2-88a1-0f78f089a1e4" ...
##   .. .. .. .. ..$ : chr  "75c7d502-0178-5ba1-e053-2a91aa0a7d67" "a84a73a7-8e3a-4985-8be0-04b3028f5e49" "b1b2848b-b265-4f6f-9141-bf106dec0726" "7733052d-177b-49da-949e-4d950bd2afeb" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ brand_name        :List of 6
##   .. .. .. .. ..$ : chr "HALDOL"
##   .. .. .. .. ..$ : chr "HALDOL"
##   .. .. .. .. ..$ : chr "AMPICILLIN"
##   .. .. .. .. ..$ : chr  "DIAZEPAM" "VALIUM" "DIASTAT"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ manufacturer_name :List of 6
##   .. .. .. .. ..$ : chr "Janssen Pharmaceuticals, Inc."
##   .. .. .. .. ..$ : chr "Janssen Pharmaceuticals, Inc."
##   .. .. .. .. ..$ : chr  "Athenex Pharmaceutical Division, LLC." "Putney Inc" "AuroMedics Pharma LLC" "Mylan Institutional LLC" ...
##   .. .. .. .. ..$ : chr  "Dash Pharmaceuticals LLC" "RedPharm Drug Inc." "Teva Pharmaceuticals USA, Inc." "West-Ward Pharmaceuticals Corp." ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ unii              :List of 6
##   .. .. .. .. ..$ : chr "6387S86PK3"
##   .. .. .. .. ..$ : chr "6387S86PK3"
##   .. .. .. .. ..$ : chr  "HXQ6A1N7R6" "JFN36L5S8K"
##   .. .. .. .. ..$ : chr "Q3JTX2Q7TU"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ rxcui             :List of 6
##   .. .. .. .. ..$ : chr  "1719669" "1719646"
##   .. .. .. .. ..$ : chr  "1719669" "1719646"
##   .. .. .. .. ..$ : chr  "313800" "1721476" "1721475" "1721474" ...
##   .. .. .. .. ..$ : chr  "1807452" "104700" "104701" "1807459" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_id            :List of 6
##   .. .. .. .. ..$ : chr "9c65afc5-4139-490c-9fda-2c0b9645db28"
##   .. .. .. .. ..$ : chr "9c65afc5-4139-490c-9fda-2c0b9645db28"
##   .. .. .. .. ..$ : chr  "b8ee4974-d097-4537-875c-b164227dce5c" "b325be54-1128-4a27-9b00-bd4c88f77889" "070ecd68-a99b-4f07-bb3c-08bc8f057e58" "ebb03f54-9951-49fd-86da-8a5fc91f93d6" ...
##   .. .. .. .. ..$ : chr  "712d18f3-27c3-461d-938f-f11ab99cebde" "131dfcce-0c13-4f32-a6ac-3199f3c08bad" "c37701d6-b0f8-4dfa-a064-08c13b501296" "a8a5ad77-bbc9-4db9-80f3-d096082201b0" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ substance_name    :List of 6
##   .. .. .. .. ..$ : chr "HALOPERIDOL LACTATE"
##   .. .. .. .. ..$ : chr "HALOPERIDOL LACTATE"
##   .. .. .. .. ..$ : chr  "AMPICILLIN SODIUM" "AMPICILLIN TRIHYDRATE"
##   .. .. .. .. ..$ : chr "DIAZEPAM"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ product_type      :List of 6
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ route             :List of 6
##   .. .. .. .. ..$ : chr "INTRAMUSCULAR"
##   .. .. .. .. ..$ : chr "INTRAMUSCULAR"
##   .. .. .. .. ..$ : chr  "INTRAMUSCULAR" "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : chr  "INTRAMUSCULAR" "ORAL" "INTRAVENOUS" "RECTAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ application_number:List of 6
##   .. .. .. .. ..$ : chr "NDA015923"
##   .. .. .. .. ..$ : chr "NDA015923"
##   .. .. .. .. ..$ : chr  "ANDA062882" "ANDA061395" "ANDA201404" "ANDA062772" ...
##   .. .. .. .. ..$ : chr  "ANDA072079" "ANDA070325" "ANDA071136" "NDA013263" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. ..$ medicinalproduct         : chr  "HALDOL" "HALDOL" "AMPICILLIN" "DIAZEPAM" ...
##   .. .. ..$ drugindication           : chr  NA "DRUG USE FOR UNKNOWN INDICATION" "DRUG USE FOR UNKNOWN INDICATION" "DRUG USE FOR UNKNOWN INDICATION" ...
##   .. .. ..$ drugauthorizationnumb    : chr  NA "015923" NA NA ...
##   .. ..$ :'data.frame':  8 obs. of  11 variables:
##   .. .. ..$ drugstartdateformat      : chr  "102" NA NA NA ...
##   .. .. ..$ drugindication           : chr  "DIABETES MELLITUS" NA NA NA ...
##   .. .. ..$ drugbatchnumb            : chr  "OME64M" NA NA NA ...
##   .. .. ..$ drugtreatmentduration    : chr  "9" NA NA NA ...
##   .. .. ..$ drugcharacterization     : chr  "1" "2" "2" "2" ...
##   .. .. ..$ drugstartdate            : chr  "19930101" NA NA NA ...
##   .. .. ..$ drugtreatmentdurationunit: chr  "801" NA NA NA ...
##   .. .. ..$ drugdosagetext           : chr  "55 U DAY" NA NA NA ...
##   .. .. ..$ openfda                  :'data.frame':  8 obs. of  18 variables:
##   .. .. .. ..$ product_ndc       :List of 8
##   .. .. .. .. ..$ : chr  "0002-8803" "0002-8715"
##   .. .. .. .. ..$ : chr  "0009-0064" "0009-0287" "0009-0286" "0009-0050"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "0007-3650"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "36000-065" "36000-064" "0054-4297" "69315-116" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "62011-0028" "70000-0178" "62011-0021" "62011-0020" ...
##   .. .. .. ..$ package_ndc       :List of 8
##   .. .. .. .. ..$ : chr  "0002-8715-99" "0002-8803-61" "0002-8803-59" "0002-8803-01" ...
##   .. .. .. .. ..$ : chr  "0009-0050-11" "0009-0050-02" "0009-0286-03" "0009-0064-04" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "0007-3650-30" "0007-3650-22"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "0054-4297-31" "30698-067-10" "0378-0232-05" "0378-0232-01" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "35418-232-02" "11534-073-05" "21130-645-06" "50844-218-07" ...
##   .. .. .. ..$ generic_name      :List of 8
##   .. .. .. .. ..$ : chr "INSULIN HUMAN"
##   .. .. .. .. ..$ : chr "MEDROXYPROGESTERONE ACETATE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "HYDROCHLOROTHIAZIDE AND TRIAMTERENE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "FUROSEMIDE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "ASPIRIN 325 MG" "ASPIRIN 81 MG" "ASPIRIN"
##   .. .. .. ..$ spl_set_id        :List of 8
##   .. .. .. .. ..$ : chr "e245e0c5-b2d6-418b-baa4-1c3324292885"
##   .. .. .. .. ..$ : chr "a586be28-96af-4fed-a13f-9b94fd4c7405"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "f6eba4b6-9cd0-4c86-46a8-05a202641c89"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "1b9117d5-0dd9-4577-a1fd-bb0aaf7e68ec" "d5b9f12e-d1e9-42de-90f2-c9ba33a86457" "2c9b4d8f-0770-482d-a9e6-9c616a440b1a" "5c50b5a3-9b39-4cad-8be5-c2a8dd3f7df5" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "2c3f02ed-8612-453d-9819-ae1088f3a1c7" "9975b0da-1a3c-4ff6-a779-ab478c3a5807" "318cc982-23a9-4804-b6fb-248f772d7a38" "0a7ffe70-a861-003e-e054-00144ff8d46c" ...
##   .. .. .. ..$ brand_name        :List of 8
##   .. .. .. .. ..$ : chr "HUMULIN 70/30"
##   .. .. .. .. ..$ : chr "PROVERA"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "DYAZIDE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "LASIX" "FUROSEMIDE" "TOXYCOLOGY MEDICATED COLLECTION SYSTEM" "DIASCREEN 12-PANEL MEDICATED COLLECTION SYSTEM"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "HENRY SCHEIN ASPIRIN" "HEALTH MART ASPIRIN" "PHARBEST ASPIRIN 325MG" "ASPIRIN THIN COATED" ...
##   .. .. .. ..$ manufacturer_name :List of 8
##   .. .. .. .. ..$ : chr "Eli Lilly and Company"
##   .. .. .. .. ..$ : chr "Pharmacia and Upjohn Company LLC"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "GlaxoSmithKline LLC"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "New Horizon Rx Group, LLC" "IT3 Medical LLC" "Excellium Pharmaceutical Inc." "Solco Healthcare LLC" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "Meijer" "HEB" "DOLGENCORP, LLC" "Paddock Laboratories, LLC" ...
##   .. .. .. ..$ unii              :List of 8
##   .. .. .. .. ..$ : chr "1Y17CTI5SR"
##   .. .. .. .. ..$ : chr "C2QI4IOI2G"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "WS821Z52LQ" "0J48LPH2TH"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "7LXU5N7ZO5"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "R16CO5Y76E" "H0G9379FGK"
##   .. .. .. ..$ rxcui             :List of 8
##   .. .. .. .. ..$ : chr  "311048" "847189" "106892" "847187"
##   .. .. .. .. ..$ : chr  "1000114" "1000124" "1000139" "1000141" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "198316" "208124"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "1719286" "1719290" "1719291" "200809" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "979118" "1722689" "1052678" "318272" ...
##   .. .. .. ..$ spl_id            :List of 8
##   .. .. .. .. ..$ : chr "d5ae821a-6f55-42d3-85f2-3166a4970809"
##   .. .. .. .. ..$ : chr "7511005f-6bee-43d3-a751-353159b606da"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "f78d9586-d2db-4744-b0e8-8bc1fd9ac2a2"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "526c46f4-1491-478c-a944-4d7f08570d46" "c477ffc4-7adb-450a-9211-dac20125d919" "e69a1faa-ce50-4abf-be3a-74fdf56b58d9" "ff63b8b1-0945-4ae9-b8d2-de31c4863c12" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "616d8c4a-241b-d56c-e053-2991aa0aadec" "33fbcf19-6b19-44c6-9823-0f8aa1e345a0" "1f4e0bbe-f09e-452c-b559-64e8fdc9a2d5" "0e5df7fb-718d-4df6-e054-00144ff8d46c" ...
##   .. .. .. ..$ substance_name    :List of 8
##   .. .. .. .. ..$ : chr "INSULIN HUMAN"
##   .. .. .. .. ..$ : chr "MEDROXYPROGESTERONE ACETATE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "HYDROCHLOROTHIAZIDE" "TRIAMTERENE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "FUROSEMIDE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "CALCIUM CARBONATE" "ASPIRIN"
##   .. .. .. ..$ product_type      :List of 8
##   .. .. .. .. ..$ : chr "HUMAN OTC DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "HUMAN OTC DRUG"
##   .. .. .. ..$ route             :List of 8
##   .. .. .. .. ..$ : chr "SUBCUTANEOUS"
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "INTRAMUSCULAR" "ORAL" "INTRAVENOUS"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "ORAL" "RECTAL"
##   .. .. .. ..$ application_number:List of 8
##   .. .. .. .. ..$ : chr "NDA019717"
##   .. .. .. .. ..$ : chr "NDA011839"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "NDA016042"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "ANDA070434" "ANDA070082" "ANDA202747" "NDA018823" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "part341" "part343"
##   .. .. .. ..$ nui               :List of 8
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "N0000008832" "N0000008836" "N0000175721" "N0000000160" ...
##   .. .. .. ..$ pharm_class_cs    :List of 8
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "Nonsteroidal Anti-inflammatory Compounds [Chemical/Ingredient]"
##   .. .. .. ..$ pharm_class_pe    :List of 8
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "Decreased Prostaglandin Production [PE]" "Decreased Platelet Aggregation [PE]"
##   .. .. .. ..$ pharm_class_moa   :List of 8
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "Cyclooxygenase Inhibitors [MoA]"
##   .. .. .. ..$ pharm_class_epc   :List of 8
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr  "Nonsteroidal Anti-inflammatory Drug [EPC]" "Platelet Aggregation Inhibitor [EPC]"
##   .. .. ..$ drugauthorizationnumb    : chr  "18780" NA NA NA ...
##   .. .. ..$ medicinalproduct         : chr  "HUMULIN 70/30" "PROVERA" "PEMARIN (ESTROGENS CONJUGTED)" "DYAZIDE" ...
##   .. ..$ :'data.frame':  2 obs. of  6 variables:
##   .. .. ..$ drugstartdateformat    : chr  "102" "102"
##   .. .. ..$ drugadministrationroute: chr  "049" NA
##   .. .. ..$ drugcharacterization   : chr  "1" "2"
##   .. .. ..$ drugstartdate          : chr  "19890924" "19890924"
##   .. .. ..$ openfda                :'data.frame':    2 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 2
##   .. .. .. .. ..$ : chr  "50580-317" "50580-338" "50580-134"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ package_ndc       :List of 2
##   .. .. .. .. ..$ : chr  "50580-338-18" "50580-317-01" "50580-134-44" "50580-317-03" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ generic_name      :List of 2
##   .. .. .. .. ..$ : chr  "LOPERAMIDE HYDROCHLORIDE" "LOPERAMIDE HYDROCHLORIDE AND DIMETHICONE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_set_id        :List of 2
##   .. .. .. .. ..$ : chr  "ecb91e47-2b0c-47c8-9256-4623d8bc825e" "76a976d5-8bee-4158-a94d-7fbfc5544fd4" "01da76d0-1979-4c45-9d39-c72ae4e4ffe2"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ brand_name        :List of 2
##   .. .. .. .. ..$ : chr  "IMODIUM A-D" "IMODIUM MULTI-SYMPTOM RELIEF"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ manufacturer_name :List of 2
##   .. .. .. .. ..$ : chr "Johnson & Johnson Consumer Inc., McNeil Consumer Healthcare Division"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ unii              :List of 2
##   .. .. .. .. ..$ : chr  "92RU3N3Y1O" "77TI35393C"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ rxcui             :List of 2
##   .. .. .. .. ..$ : chr  "978010" "978013" "978001" "1426827" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_id            :List of 2
##   .. .. .. .. ..$ : chr  "ea7c07ee-efee-4e5a-ab03-19a8021e3588" "5b2da502-a49a-47cd-ad67-9d246bdd916c" "4a17e6a4-059a-48b0-b716-c9683f4867ab"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ substance_name    :List of 2
##   .. .. .. .. ..$ : chr  "LOPERAMIDE HYDROCHLORIDE" "DIMETHICONE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ product_type      :List of 2
##   .. .. .. .. ..$ : chr "HUMAN OTC DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ route             :List of 2
##   .. .. .. .. ..$ : chr "ORAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ application_number:List of 2
##   .. .. .. .. ..$ : chr  "NDA021140" "NDA019487" "ANDA075232"
##   .. .. .. .. ..$ : NULL
##   .. .. ..$ medicinalproduct       : chr  "IMODIUM" "ANTIBIOTIQUES"
##   .. ..$ :'data.frame':  2 obs. of  10 variables:
##   .. .. ..$ drugstartdateformat    : chr  "102" NA
##   .. .. ..$ drugindication         : chr  "VAGINAL CANDIDIASIS" NA
##   .. .. ..$ drugadministrationroute: chr  "067" NA
##   .. .. ..$ drugcharacterization   : chr  "1" "2"
##   .. .. ..$ drugstartdate          : chr  "19960528" NA
##   .. .. ..$ drugenddateformat      : chr  "102" NA
##   .. .. ..$ openfda                :'data.frame':    2 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 2
##   .. .. .. .. ..$ : chr  "67777-316" "89141-250" "15071-804" "50382-050" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ package_ndc       :List of 2
##   .. .. .. .. ..$ : chr  "67777-316-01" "50382-050-01" "89141-250-14" "89141-250-02" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ generic_name      :List of 2
##   .. .. .. .. ..$ : chr  "MICONAZOLE" "MICONAZOLE NITRATE" "ANTIFUNGAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_set_id        :List of 2
##   .. .. .. .. ..$ : chr  "4114c685-acd1-4c65-842b-1cb7840852dc" "853f5d10-99c3-4fdc-87b9-0ee6826e84ad" "99a36af9-ec04-48fd-a7b7-73d870c087bb" "1e335cf8-eb08-40b4-abad-7a71bd2283d7" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ brand_name        :List of 2
##   .. .. .. .. ..$ : chr  "RASH RELIEF ANTIFUNGAL" "MICONAZOLE" "ORAVIG" "DYNAREX ANTIFUNGAL POWDER" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ manufacturer_name :List of 2
##   .. .. .. .. ..$ : chr  "Galentic Pharma (India) Priva Te Limited" "Kinray, Inc." "Midatech Pharma US, Inc." "Cherry Hill Sales Co" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ unii              :List of 2
##   .. .. .. .. ..$ : chr  "SOI2LOH54Z" "VW4H1CYW1K" "7NNO0D7S5M" "92RU3N3Y1O"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ rxcui             :List of 2
##   .. .. .. .. ..$ : chr  "998548" "1000009" "1089121" "998550" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_id            :List of 2
##   .. .. .. .. ..$ : chr  "847787bb-34b1-037a-e053-2a91aa0a6fc9" "3484819a-ee23-4388-bafa-c3ee839ddae8" "560c02ad-d329-4458-a761-c50d8b737d69" "2d4f02ce-0bf1-4f31-9eb8-ee649af17ec2" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ substance_name    :List of 2
##   .. .. .. .. ..$ : chr  "MICONAZOLE" "MICONAZOLE NITRATE" "DIMETHICONE" "ZINC OXIDE"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ product_type      :List of 2
##   .. .. .. .. ..$ : chr  "HUMAN OTC DRUG" "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ route             :List of 2
##   .. .. .. .. ..$ : chr  "BUCCAL" "TOPICAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ application_number:List of 2
##   .. .. .. .. ..$ : chr  "NDA022404" "part333C"
##   .. .. .. .. ..$ : NULL
##   .. .. ..$ drugauthorizationnumb  : chr  "018888" NA
##   .. .. ..$ drugenddate            : chr  "19960528" NA
##   .. .. ..$ medicinalproduct       : chr  "MICONAZOLE" "UNKNOWN"
##   .. ..$ :'data.frame':  4 obs. of  12 variables:
##   .. .. ..$ drugstartdateformat      : chr  "102" "102" "102" "102"
##   .. .. ..$ drugindication           : chr  "PATENT DUCTUS ARTERIOSUS" "PATENT DUCTUS ARTERIOSUS" "PATENT DUCTUS ARTERIOSUS" "PATENT DUCTUS ARTERIOSUS"
##   .. .. ..$ drugadministrationroute  : chr  "042" "042" "042" "042"
##   .. .. ..$ drugtreatmentduration    : chr  "1" "1" "1" "1"
##   .. .. ..$ drugcharacterization     : chr  "1" "1" "1" "1"
##   .. .. ..$ drugstartdate            : chr  "19971005" "19971006" "19971009" "19971011"
##   .. .. ..$ drugenddateformat        : chr  "102" "102" "102" "102"
##   .. .. ..$ drugtreatmentdurationunit: chr  "806" "806" "804" "806"
##   .. .. ..$ drugdosagetext           : chr  "SEE IMAGE" "SEE IMAGE" "SEE IMAGE" "SEE IMAGE"
##   .. .. ..$ drugauthorizationnumb    : chr  "18878" "18878" "18878" "18878"
##   .. .. ..$ drugenddate              : chr  "19971005" "19971006" "19971009" "19971011"
##   .. .. ..$ medicinalproduct         : chr  "INDOCIN I.V." "INDOCIN I.V." "INDOCIN I.V." "INDOCIN I.V."
##   .. ..$ :'data.frame':  4 obs. of  10 variables:
##   .. .. ..$ drugstartdateformat    : chr  "102" NA NA NA
##   .. .. ..$ drugindication         : chr  "RELAPSING-REMITTING MULTIPLE SCLEROSIS" NA NA NA
##   .. .. ..$ drugadministrationroute: chr  "058" NA NA NA
##   .. .. ..$ drugcharacterization   : chr  "1" "2" "2" "2"
##   .. .. ..$ drugstartdate          : chr  "19970528" NA NA NA
##   .. .. ..$ drugenddateformat      : chr  "102" NA NA NA
##   .. .. ..$ drugdosagetext         : chr  "0.5 AMP, EVERY 2D, SUBCUTANEOUS" NA NA NA
##   .. .. ..$ openfda                :'data.frame':    4 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 4
##   .. .. .. .. ..$ : chr "50419-524"
##   .. .. .. .. ..$ : chr  "58281-563" "58281-562" "58281-561" "58281-560"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_id            :List of 4
##   .. .. .. .. ..$ : chr "e3e2b7da-7bf8-42e2-9def-2e575054f777"
##   .. .. .. .. ..$ : chr "824b1807-be48-4239-bfdc-2d1d15b42c71"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ product_type      :List of 4
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ package_ndc       :List of 4
##   .. .. .. .. ..$ : chr  "50419-524-81" "50419-524-01" "50419-524-35" "50419-524-05" ...
##   .. .. .. .. ..$ : chr  "58281-561-02" "58281-560-02" "58281-560-01" "58281-563-02" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ generic_name      :List of 4
##   .. .. .. .. ..$ : chr "INTERFERON BETA-1B"
##   .. .. .. .. ..$ : chr "BACLOFEN"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ spl_set_id        :List of 4
##   .. .. .. .. ..$ : chr "66311f74-0472-4fa3-848a-06002ca0def5"
##   .. .. .. .. ..$ : chr "351cde63-00fa-404a-92df-cb055e991840"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ brand_name        :List of 4
##   .. .. .. .. ..$ : chr "BETASERON"
##   .. .. .. .. ..$ : chr "LIORESAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ manufacturer_name :List of 4
##   .. .. .. .. ..$ : chr "Bayer HealthCare Pharmaceuticals Inc."
##   .. .. .. .. ..$ : chr "Medtronic Neuromodulation"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ application_number:List of 4
##   .. .. .. .. ..$ : chr "BLA103471"
##   .. .. .. .. ..$ : chr "NDA020075"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ rxcui             :List of 4
##   .. .. .. .. ..$ : chr  "198360" "207059"
##   .. .. .. .. ..$ : chr  "805678" "805679" "1666620" "1666622" ...
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ unii              :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "H789N3FKE8"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ substance_name    :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "BACLOFEN"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. .. ..$ route             :List of 4
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : chr "INTRATHECAL"
##   .. .. .. .. ..$ : NULL
##   .. .. .. .. ..$ : NULL
##   .. .. ..$ drugenddate            : chr  "19970601" NA NA NA
##   .. .. ..$ medicinalproduct       : chr  "BETASERON" "LIORESAL" "DECORTIN-H" "RIOPAN"
##   .. ..$ :'data.frame':  1 obs. of  7 variables:
##   .. .. ..$ drugstartdateformat  : chr "102"
##   .. .. ..$ drugindication       : chr "BREAST CANCER"
##   .. .. ..$ drugcharacterization : chr "1"
##   .. .. ..$ drugstartdate        : chr "19961129"
##   .. .. ..$ openfda              :'data.frame':  1 obs. of  13 variables:
##   .. .. .. ..$ product_ndc       :List of 1
##   .. .. .. .. ..$ : chr  "0310-0950" "70720-951" "0310-0951"
##   .. .. .. ..$ package_ndc       :List of 1
##   .. .. .. .. ..$ : chr  "70720-951-30" "0310-0951-30" "0310-0950-36"
##   .. .. .. ..$ generic_name      :List of 1
##   .. .. .. .. ..$ : chr "GOSERELIN ACETATE"
##   .. .. .. ..$ spl_set_id        :List of 1
##   .. .. .. .. ..$ : chr  "e4cb3c20-2738-400a-b522-3f36f71fe6c5" "6bd94a89-f18a-45e5-d0a4-b343a4f0f03d" "4ff62a5a-77ba-4bf5-0497-95ccca842315"
##   .. .. .. ..$ brand_name        :List of 1
##   .. .. .. .. ..$ : chr "ZOLADEX"
##   .. .. .. ..$ manufacturer_name :List of 1
##   .. .. .. .. ..$ : chr  "AstraZeneca Pharmaceuticals LP" "TerSera Therapeutics LLC"
##   .. .. .. ..$ unii              :List of 1
##   .. .. .. .. ..$ : chr "6YUU2PV0U8"
##   .. .. .. ..$ rxcui             :List of 1
##   .. .. .. .. ..$ : chr  "105641" "314008" "310592" "211544"
##   .. .. .. ..$ spl_id            :List of 1
##   .. .. .. .. ..$ : chr  "921f48c8-1d9d-402a-85c2-6b626133b5e9" "d2b7dda4-472d-49e4-8907-c2b9829eed96" "46b6a91f-557e-42f6-a4d5-b10705314542"
##   .. .. .. ..$ substance_name    :List of 1
##   .. .. .. .. ..$ : chr "GOSERELIN ACETATE"
##   .. .. .. ..$ product_type      :List of 1
##   .. .. .. .. ..$ : chr "HUMAN PRESCRIPTION DRUG"
##   .. .. .. ..$ route             :List of 1
##   .. .. .. .. ..$ : chr "SUBCUTANEOUS"
##   .. .. .. ..$ application_number:List of 1
##   .. .. .. .. ..$ : chr  "NDA020578" "NDA019726"
##   .. .. ..$ drugauthorizationnumb: chr "19726"
##   .. .. ..$ medicinalproduct     : chr "ZOLADEX"
##   .. ..$ :'data.frame':  1 obs. of  3 variables:
##   .. .. ..$ drugcharacterization : chr "1"
##   .. .. ..$ drugauthorizationnumb: chr "20509"
##   .. .. ..$ medicinalproduct     : chr "GEMCITABINE HYDROCHLORIDE-IV (GEMCITABINE)"
##   ..$ patientdeath       :'data.frame':  15 obs. of  2 variables:
##   .. ..$ patientdeathdate      : chr  NA "19971004" NA NA ...
##   .. ..$ patientdeathdateformat: chr  NA "102" NA NA ...
##   ..$ patientweight      : chr  NA NA NA NA ...
##  $ seriousnesshospitalization: chr  "1" NA "1" "1" ...
##  $ transmissiondate          : chr  "20041129" "20090109" "20041129" "20061013" ...
##  $ serious                   : chr  "1" "1" "1" "1" ...
##  $ receiptdate               : chr  "20040315" "20080625" "20040228" "19970918" ...
##  $ seriousnessdeath          : chr  NA "1" "1" NA ...
##  $ seriousnesslifethreatening: chr  NA NA "1" "1" ...
##  $ seriousnessdisabling      : chr  NA NA NA NA ...
extractFDA(drug1,"ndc", "finished:true&limit=3") %>% str
## 'data.frame':    3 obs. of  22 variables:
##  $ product_ndc            : chr  "0486-1111" "68084-523" "68084-524"
##  $ generic_name           : chr  "Potassium Phosphate, Monobasic" "Zolpidem Tartrate" "Potassium Chloride"
##  $ labeler_name           : chr  "Beach Products, Inc." "American Health Packaging" "American Health Packaging"
##  $ packaging              :List of 3
##   ..$ :'data.frame': 2 obs. of  4 variables:
##   .. ..$ marketing_start_date: chr  "19770329" "19770329"
##   .. ..$ package_ndc         : chr  "0486-1111-05" "0486-1111-01"
##   .. ..$ description         : chr  "500 TABLET, SOLUBLE in 1 BOTTLE (0486-1111-05)" "100 TABLET, SOLUBLE in 1 BOTTLE (0486-1111-01)"
##   .. ..$ sample              : logi  FALSE FALSE
##   ..$ :'data.frame': 1 obs. of  5 variables:
##   .. ..$ marketing_end_date  : chr "20190531"
##   .. ..$ marketing_start_date: chr "20111122"
##   .. ..$ package_ndc         : chr "68084-523-21"
##   .. ..$ description         : chr "30 BLISTER PACK in 1 BOX, UNIT-DOSE (68084-523-21)  > 1 TABLET, FILM COATED, EXTENDED RELEASE in 1 BLISTER PACK (68084-523-11)"
##   .. ..$ sample              : logi FALSE
##   ..$ :'data.frame': 1 obs. of  4 variables:
##   .. ..$ marketing_start_date: chr "20130205"
##   .. ..$ package_ndc         : chr "68084-524-01"
##   .. ..$ description         : chr "100 BLISTER PACK in 1 BOX, UNIT-DOSE (68084-524-01)  > 1 TABLET, FILM COATED, EXTENDED RELEASE in 1 BLISTER PAC"| __truncated__
##   .. ..$ sample              : logi FALSE
##  $ brand_name_suffix      : chr  "Original" NA NA
##  $ brand_name             : chr  "K Phos Original" "Zolpidem Tartrate" "Potassium Chloride"
##  $ active_ingredients     :List of 3
##   ..$ :'data.frame': 1 obs. of  2 variables:
##   .. ..$ strength: chr "500 mg/1"
##   .. ..$ name    : chr "POTASSIUM PHOSPHATE, MONOBASIC"
##   ..$ :'data.frame': 1 obs. of  2 variables:
##   .. ..$ strength: chr "12.5 mg/1"
##   .. ..$ name    : chr "ZOLPIDEM TARTRATE"
##   ..$ :'data.frame': 1 obs. of  2 variables:
##   .. ..$ strength: chr "750 mg/1"
##   .. ..$ name    : chr "POTASSIUM CHLORIDE"
##  $ finished               : logi  TRUE TRUE TRUE
##  $ openfda                :'data.frame': 3 obs. of  5 variables:
##   ..$ is_original_packager:List of 3
##   .. ..$ : logi TRUE
##   .. ..$ : NULL
##   .. ..$ : NULL
##   ..$ spl_set_id          :List of 3
##   .. ..$ : chr "04557ab3-6d21-49b4-b849-744c75b8a630"
##   .. ..$ : chr "11a7fa3f-5dd3-4ba6-8a5b-0be321c58dfa"
##   .. ..$ : chr "9adf031d-b7be-49db-b827-61ca4a53d400"
##   ..$ manufacturer_name   :List of 3
##   .. ..$ : chr "Beach Products, Inc."
##   .. ..$ : chr "American Health Packaging"
##   .. ..$ : chr "American Health Packaging"
##   ..$ unii                :List of 3
##   .. ..$ : chr "4J9FJ0HL51"
##   .. ..$ : chr "WY6W63843K"
##   .. ..$ : chr "660YQ98I10"
##   ..$ rxcui               :List of 3
##   .. ..$ : chr  "1101778" "1101775"
##   .. ..$ : chr  "854894" "854880"
##   .. ..$ : chr "628953"
##  $ listing_expiration_date: chr  "20191231" NA "20191231"
##  $ marketing_category     : chr  "UNAPPROVED DRUG OTHER" "ANDA" "NDA AUTHORIZED GENERIC"
##  $ dosage_form            : chr  "TABLET, SOLUBLE" "TABLET, FILM COATED, EXTENDED RELEASE" "TABLET, FILM COATED, EXTENDED RELEASE"
##  $ spl_id                 : chr  "1c2ceda2-0bfa-4637-bb0c-1df7609be153" "75b2bc5f-7031-fa9d-e053-2a91aa0ab73d" "65e5bd0d-ccb1-0172-e053-2a91aa0a289e"
##  $ product_type           : chr  "HUMAN PRESCRIPTION DRUG" "HUMAN PRESCRIPTION DRUG" "HUMAN PRESCRIPTION DRUG"
##  $ route                  :List of 3
##   ..$ : chr "ORAL"
##   ..$ : chr "ORAL"
##   ..$ : chr "ORAL"
##  $ marketing_start_date   : chr  "19770329" "20111122" "20130205"
##  $ product_id             : chr  "0486-1111_1c2ceda2-0bfa-4637-bb0c-1df7609be153" "68084-523_75b2bc5f-7031-fa9d-e053-2a91aa0ab73d" "68084-524_65e5bd0d-ccb1-0172-e053-2a91aa0a289e"
##  $ brand_name_base        : chr  "K Phos" "Zolpidem Tartrate" "Potassium Chloride"
##  $ marketing_end_date     : chr  NA "20190531" NA
##  $ dea_schedule           : chr  NA "CIV" NA
##  $ application_number     : chr  NA "ANDA078179" "NDA018279"
##  $ pharm_class            :List of 3
##   ..$ : NULL
##   ..$ : chr  "gamma-Aminobutyric Acid-ergic Agonist [EPC]" "GABA A Agonists [MoA]" "Pyridines [CS]" "Central Nervous System Depression [PE]"
##   ..$ : chr  "Potassium Compounds [CS]" "Potassium Salt [EPC]" "Osmotic Laxative [EPC]" "Increased Large Intestinal Motility [PE]" ...

extractFDA(device1,"registrationlisting",'')
##                                                 establishment_type                       proprietary_name
## 1 Sterilize Medical Device for Another Party (Contract Sterilizer) Ortho Development - ODC B2 Bipolar Cup
##   registration.status_code registration.iso_country_code registration.city registration.registration_number
## 1                        1                            US           EL PASO                          1643817
##   registration.zip_code registration.owner_operator.owner_operator_number registration.owner_operator.firm_name
## 1                 79936                                           1527821                    STERIS Corporation
##   registration.owner_operator.contact_address.city registration.owner_operator.contact_address.iso_country_code
## 1                                           Mentor                                                           US
##   registration.owner_operator.contact_address.address_1 registration.owner_operator.contact_address.address_2
## 1                                       5960 Heisley Rd                                                    --
##   registration.owner_operator.contact_address.state_province registration.owner_operator.contact_address.postal_code
## 1                                                                                                              44060
##   registration.owner_operator.contact_address.state_code       registration.name registration.address_line_1
## 1                                                     OH ISOMEDIX OPERATIONS INC         1435 ISOMEDIX PLACE
##   registration.fei_number registration.initial_importer_flag registration.address_line_2 registration.postal_code
## 1                 1643817                                  N                                                     
##   registration.state_code registration.reg_expiry_date_year pma_number k_number
## 1                      TX                              2019                    
##                                                                                                                      products
## 1 1527821, 2012-12-19, , KWY, Prosthesis, Hip, Hemi-, Femoral, Metal/Polymer, Cemented Or Uncemented, Orthopedic, 2, 888.3390
extractFDA(device1,"udi",'public_version_status:Update')
##   has_donation_id_number                                       mri_safety record_status is_rx is_labeled_as_nrl
## 1                  false Labeling does not contain MRI Safety Information     Published  true             false
##   commercial_distribution_status             device_description             public_device_record_key has_serial_number
## 1     In Commercial Distribution ENDOVASCULAR PACK #515091-P-LF 57112fd3-d19f-4516-9587-0e01533767c6             false
##   public_version_date sterilization.is_sterilization_prior_use sterilization.is_sterile is_direct_marking_exempt
## 1          2018-03-29                                    false                     true                     true
##   is_labeled_as_no_nrl public_version_number labeler_duns_number is_single_use                  identifiers is_otc
## 1                 true                     2           025460908          true GS1, 10889942335107, Primary  false
##   version_or_model_number has_manufacturing_date               brand_name is_combination_product is_kit
## 1              DYNJ49270A                  false Medline Industries, Inc.                  false   true
##                                                                            product_codes is_pm_exempt
## 1 LRO, General surgery tray, General Surgery Tray, General, Plastic Surgery, 2, 878.4370        false
##   device_count_in_base_package has_lot_or_batch_number                            customer_contacts catalog_number
## 1                            1                    true +1(800)633-5463, customerservice@medline.com     DYNJ49270A
##               company_name has_expiration_date public_version_status is_hct_p
## 1 MEDLINE INDUSTRIES, INC.                true                Update    false
##                                                                                                                                                                                                                                                                                                                    gmdn_terms
## 1 General surgical procedure kit, non-medicated, reusable, A general-purpose collection of various sterile surgical instruments, dressings, and materials intended to be used to assist a range of surgical procedures across multiple clinical specialities. It does not contain pharmaceuticals. This is a reusable device.
##   publish_date
## 1   2016-09-29
extractFDA(device1,"udi",'has_serial_number:truelimit=10')
##   has_donation_id_number                                       mri_safety record_status is_rx is_labeled_as_nrl
## 1                  false Labeling does not contain MRI Safety Information     Published  true             false
##   commercial_distribution_status   device_description             public_device_record_key has_serial_number
## 1     In Commercial Distribution EZE-60 12.75MM +13.5 c49da1cf-2d45-41ee-b143-cd9d7967ad03              true
##   public_version_date sterilization.is_sterilization_prior_use sterilization.is_sterile is_direct_marking_exempt
## 1          2018-03-29                                    false                     true                    false
##   is_labeled_as_no_nrl public_version_number labeler_duns_number is_single_use                  identifiers is_otc
## 1                false                     2           196603781          true GS1, 10757770143938, Primary  false
##   version_or_model_number has_manufacturing_date              brand_name is_combination_product is_kit
## 1                   8A135                  false EZE-fit PMMA IOL EZE-60                  false  false
##                                                      product_codes is_pm_exempt device_count_in_base_package
## 1 HQL, Intraocular Lens, Intraocular Lens, Ophthalmic, 3, 886.3600        false                            1
##   has_lot_or_batch_number catalog_number               company_name has_expiration_date public_version_status is_hct_p
## 1                   false          8A135 Bausch & Lomb Incorporated                true                Update    false
##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            gmdn_terms
## 1 Posterior-chamber intraocular lens, pseudophakic, An optical device, generally referred to as an intraocular lens (IOL), intended to be implanted permanently in the posterior chamber of the eye (ring-like space filled with aqueous humor between the iris, the crystalline lens, and the ciliary body) to replace the natural lens (crystalline lens), typically because it has been clouded by a cataract. The device is made of a synthetic material (e.g., plastic, hydrogel). Included may be a sterile, single-use, IOL injector into which this device is preloaded and ready for insertion into the eye.
##   publish_date
## 1   2015-09-17
extractFDA(device1,"pma",'decision_code:APPR&limit=3')
##   decision_code supplement_number                  supplement_type decision_date product_code           city   zip
## 1          APPR              S058 Normal 180 Day Track No User Fee    2011-04-21          LNR Blanchardstown D15 T
## 2          APPR              S007                                     1985-07-10          HQL      ROCHESTER 14609
## 3          APPR              S244                Real-Time Process    2011-11-01          NVZ    MOUNDS VIEW 55112
##   pma_number                            generic_name openfda.regulation_number
## 1    P860003   System, photopheresis, extracorporeal                          
## 2    P820072                        intraocular lens                  886.3600
## 3    P980035 Pulse generator, permanent, implantable                          
##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       openfda.fei_number
## 1                                                                                                                                                                                                                                                                                                                                                                                                                                                3002468842, 1000086912, 1317547, 3002807314, 1000512168, 3010155661, 3014074925, 1000138054, 3013428851
## 2 , 3002777043, 2011171, 1317628, 3001284430, 2246552, 1281950, 1119279, 3007125265, 1000121259, 3002037047, 1000581837, 3004651700, 1119421, 3002808259, 1048735, 2648035, 3008344633, 3012304651, 3004343135, 3003088462, 3008449456, 3007530141, 2027748, 3003843509, 1000635309, 3007207818, 2023826, 2020277, 1037089, 3004161528, 3011665481, 3014173684, 1038445, 1000114185, 3008641313, 1000306431, 3011852734, 3001659659, 3010126268, 3002023310, 3013022457, 3002807314, 2648045, 3013202565, 3002808262, 3006723646, 3002957101, 3012760095
## 3                                                                                                                                                                                                                  3004105270, 3009144177, 3011120183, 3008377825, 3002807576, 2938836, 3005700659, 3002806500, 3003615065, 3004369318, 3008483389, 3008973940, 2124215, 3002807111, 3012552532, 3000203466, 3007566237, 2017865, 1028232, 2024024, 3009380063, 3006705815, 3004593495, 3003574398, 3008159616, 1000165971, 3005334138, 2182208, 2649622
##                       openfda.device_name openfda.device_class openfda.medical_specialty_description
## 1   System, Photopheresis, Extracorporeal                    3                               Unknown
## 2                        Intraocular Lens                    3                            Ophthalmic
## 3 Pulse Generator, Permanent, Implantable                    3                               Unknown
##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 openfda.registration_number
## 1                                                                                                                                                                                                                                                                                                                                                                                                         3003630504, 3000236920, 3014527933, 1317547, 3002807314, 1061124, 3010155661, 1319639, 3013428851
## 2 , 2031474, 2011171, 9681862, 2029275, 1281950, 1119279, 3002037047, 9613160, 1037089, 1119421, 1048735, 1063199, 2648035, 2529709, 3008344633, 3012304651, 2648045, 3004343135, 3008449456, 3007530141, 2027748, 1313525, 2246552, 2020664, 3007207818, 2023826, 2020277, 9710098, 3007125265, 3014173684, 1038445, 9612169, 3006723646, 1000635309, 2031959, 3008641313, 1054811, 3011852734, 1064514, 3010126268, 3013022457, 3002807314, 9614546, 3013202565, 3011665481, 3012760095, 2438659, 9614429
## 3                                                                                                                                                                                    3004105270, 3009144177, 3011120183, 2133641, 2135338, 3008494315, 9614453, 2017865, 2938836, 3003615065, 3008483389, 2032521, 3008973940, 2124215, 3012552532, 3007566237, 1028232, 3005941719, 2024024, 3009380063, 3004209178, 3006705815, 3004593495, 9610139, 3008159616, 1000165971, 3005334138, 2182208, 2649622
##   state date_received                                                trade_name
## 1          2011-03-08                      THERAKOS CELLEX PHOTOPHERESIS SYSTEM
## 2    NY    1985-06-04        CIRCULAR OPEN LOOP POSTERIOR IOLS & KRATZ ELLIPTIC
## 3    MN    2011-09-27 ADAPTA/VERSA/SENSIA AND RELIA IMPLANTABLE PULSE GENERATOR
##                                             supplement_reason advisory_committee_description zip_ext
## 1 Location Change - Manufacturer/Sterilizer/Packager/Supplier      Gastroenterology, Urology        
## 2                                                                                 Ophthalmic    3547
## 3            Change Design/Components/Specifications/Material                 Cardiovascular        
##                             street_1        street_2 docket_number                                    applicant
## 1 College Business & Technology Park Cruiserath Road               Mallinckrodt Pharmaceuticals Ireland Limited
## 2             1400 NORTH GOODMAN ST.                                                        Bausch & Lomb, Inc.
## 3           8200 CORAL SEA STREET NE       MS MV S11                                             MEDTRONIC Inc.
##   advisory_committee expedited_review_flag
## 1                 GU                     N
## 2                 OP                     N
## 3                 CV                     N
##                                                                                                                                                                     ao_statement
## 1                                                                      APPROVAL FOR AN ADDITIONAL STERILIZATION SITE LOCATED AT STERIGENICS US LLC IN CHARLOTTE, NORTH CAROLINA.
## 2                                                                                                                                                                               
## 3 APPROVAL FOR UPDATES TO MEDTRONICS ADAPTA/ VERSA/SENSIA AND RELIA IMPLANTABLE PULSE GENERATOR (IPG) APPLICATION SOFTWARE TO CORRECT THE BATTERY MEASUREMENT LOCK-UP CONDITION.

extractFDA(food1, "enforcement", 'report_date:[20040101+TO+20131231]&limit=3')
##         country    city
## 1 United States Medford
## 2 United States  Newark
## 3 United States  Boston
##                                                                                          reason_for_recall
## 1 Product received from supplier is being recalled due to the potential to be contaminated with Salmonella
## 2                              Products have the potential to be contaminated with Listeria monocytogenes.
## 3                                    Products contain recalled Gill's Onions due to Listeria monocytogenes
##                        address_1 address_2
## 1             2500 S Pacific Hwy          
## 2                   170 Avenue L          
## 3 18 Bunker Hill Industrial Park          
##                                                                                                                                                                                                                                                                                                                                                                 code_info
## 1 Best By Date on the recalled nut products - 01MAY11 through 24SEPT13.    The lot code format for the baskets is DDDYM(H or C), with DDD representing the Julian date, Y representing the year, and letter M, H or C representing the production facility, printed on the shipping container.  The affected lots would have been between 1460M(H or C) to 2682M(H or C).
## 2                                                                                                                                                                                                                                                                                                                                                       9/8/2012 or later
## 3                                                                                                                                                                                                                                                                                                                                Produced on: Between 7/18/12 and 7/25/12
##       product_quantity center_classification_date
## 1 15,264 - 12 oz. jars                   20121026
## 2           2926 cases                   20121011
## 3            255 cases                   20120827
##                                                                                                             distribution_pattern
## 1 Nationwide and Canada through online ordering www.harryanddavid.com/h/home and through retail stores located throught the U.S.
## 2                                                                                     NY, NJ, PA, MA, VA, MD, CT, GA, IL, and TX
## 3                                                                                             MA, ME, RI, NH, CT, VTM, NY AND Nj
##   state
## 1    OR
## 2    NJ
## 3    MA
##                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    product_description
## 1 Harry & David Creamy Raspberry Peanut Spread, 12 oz. jars, labeled in part: "HARRY & DAVID CREAMY RASPBERRY PEANUT SPREAD***NET WT. 12 OZ. (340g)***INGREDIENTS: ROASTED PEANUTS, SUGAR, RASPBERRY COMPOUND***MADE FOR: HARRY AND DAVID MEDFORD, OR 97501***7 80994 73872 0***"    The 12 oz. jars are sold individually and also as gift add-ons for gift baskets.     The gift baskets are listed below:    Harry & David Apple Snack Box;  Wolferman's Bee Sweet Gift Basket;  Wolferman's Hearty Snack Gift Basket;  Wolferman's All-Day Assortment Gift Basket;  Wolferman's Fathers Day Basket
## 2                                                                                                                                                                                                                                                                                                                                                                   SooNyeoWon and Jinga brand Soft Tofu 16 oz. in square, plastic containers, UPC 0 28346 07814 9 (SooNyeoWon).  Manna Organics Inc. 170 Avenue 'L', Newark, NJ 07105; MSB West, LLC 622 South Anderson Street, Los Angeles, CA 90023
## 3                                                                                                                                                                                                                                                                          Costa:  1/2" Diced Onions (Item #C228);  3/4" Diced Onions (Item  #C244)  1/4" Diced Onions (Item#C32)  5 lb poly bags  Packed by: Fresh Ideas Co., 18 Bunker Hill Industrial Park, Boston, MA 02129  Legal Seafood Diced Onions 1/16" (Item #L163) 10 lb poly bag  OB Double Diced Onions 1/8" (item #OB2), 2  lb poly tub
##   report_date classification recall_number                   recalling_firm
## 1    20121107        Class I   F-0562-2013 Harry and David Operations, Inc.
## 2    20121017        Class I   F-0101-2013               Manna Organics Inc
## 3    20120905        Class I   F-2068-2012                 Fresh Ideas Inc.
##                                                           initial_firm_notification event_id product_type
## 1 Two or more of the following: Email, Fax, Letter, Press Release, Telephone, Visit    63306         Food
## 2                                                                     Press Release    63074         Food
## 3                                                                            E-Mail    62758         Food
##   termination_date more_code_info recall_initiation_date postal_code        voluntary_mandated     status
## 1         20130314             NA               20120927  97501-8724 Voluntary: Firm Initiated Terminated
## 2         20130219             NA               20120831  07105-3831 Voluntary: Firm Initiated Terminated
## 3         20130307             NA               20120726  02129-1621 Voluntary: Firm Initiated Terminated
extractFDA(food1, "event", 'date_created:[20040101+TO+20131231]&limit=5')
##   report_number                                                                                   outcomes date_created
## 1         98178                                                                                                20071120
## 2         97634                                                    Patient Visited ER, Medically Important     20071101
## 3         97672 Patient Visited ER, Life Threatening, Patient Visited Healthcare Provider, Hospitalization     20071101
## 4         97702                                                                                                20071102
## 5         97788                                   Medically Important, Patient Visited Healthcare Provider     20071106
##                                                                reactions date_started consumer.gender consumer.age_unit
## 1                                                               LETHARGY         <NA>            <NA>              <NA>
## 2                                                  CHEMICAL BURN OF SKIN     20070928               M           year(s)
## 3                                                    BACTERIAL INFECTION         <NA>            <NA>              <NA>
## 4                                                               VOMITING         <NA>            <NA>           year(s)
## 5 SOMNOLENCE, COGNITIVE DISORDER, MALAISE, DYSARTHRIA, CONFUSIONAL STATE     20071101               M           year(s)
##   consumer.age
## 1         <NA>
## 2           20
## 3         <NA>
## 4            1
## 5           56
##                                                                                                                  products
## 1                                                      Soft Drink/Water, SUSPECT, 29, POLAND SPRINGS BOTTLED SPRING WATER
## 2                                                                                     Cosmetics, SUSPECT, 53, EXEMPTION 4
## 3                                                          Soft Drink/Water, SUSPECT, 29, PUBLIX SPRING WATER SODIUM FREE
## 4 Baby Food Products, Soft Drink/Water, SUSPECT, CONCOMITANT, 40, 29, NESTLE GOOD START SUPREME INFANT FORMULA, TAP WATER
## 5                             Vit/Min/Prot/Unconv Diet(Human/Animal), SUSPECT, 54, APPLIED NUTRITION GREEN TEA FAT BURNER

extractFDA(other1, query='marketing_start_date:[20040101+TO+20131231]&limit=5')
##   marketing_end_date                   proprietary_name            product_type application_number_or_citation
## 1           20181212 Childrens Mucinex Chest Congestion          HUMAN OTC DRUG                        part341
## 2               <NA>                       Axe Dry Clix          HUMAN OTC DRUG                        part350
## 3           20140430             Rolaids Extra Strength          HUMAN OTC DRUG                        part331
## 4               <NA>              Clobetasol Propionate HUMAN PRESCRIPTION DRUG                     ANDA074221
## 5               <NA>            Laxative Enteric Coated          HUMAN OTC DRUG                        part334
##   marketing_start_date  package_ndc      marketing_category package_ndc11    dosage_form billing_unit
## 1             20100622 63824-473-64     OTC MONOGRAPH FINAL   63824047364       SOLUTION         <NA>
## 2             20110601 64942-1171-3     OTC monograph final   64942117103          STICK         <NA>
## 3             20080501 50580-741-19     OTC MONOGRAPH FINAL   50580074119  BAR, CHEWABLE           EA
## 4             20100607 42254-174-45                    ANDA   42254017445       OINTMENT           GM
## 5             20111024 24385-903-63 OTC MONOGRAPH NOT FINAL   24385090363 TABLET, COATED           EA
```

Authors
-------

-   [Chong Hoon Kim](mailto:chong.kim@ucdenver.edu)
