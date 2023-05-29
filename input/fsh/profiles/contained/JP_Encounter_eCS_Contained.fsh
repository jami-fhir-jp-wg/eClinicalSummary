

//-------------------------------
//--- Profile for conatained resource within other resources
//-------------------------------

Profile: JP_Encounter_OW_eCS_Contained
Parent: JP_Encounter
Id: JP-Encounter-OW-eCS-Contained
Description: "診療情報コアサマリー埋め込み用 Encouterリソース(入院外来の別に関するのみの情報)プロファイル　　（JP_Encounter_eClinicalSummaryの派生プロファイル）"
* ^url = $JP_Encounter_OW_eCS_Contained
* ^status = #active
* ^date = "2023-03-31"

* id 1..1
* implicitRules ..0
* text ..0
* contained ..0
* language ..0
* status
* statusHistory ..0
* class 1..1
* classHistory ..0
* type ..0
* serviceType ..0
* priority ..0
* subject only Reference(JP_Patient_eCS_Contained)
* episodeOfCare ..0
* basedOn ..0
* participant ..0
* appointment ..0
* period ..1
* length ..0
* reasonCode ..0
* reasonReference ..0
* diagnosis ..0
* account ..0
* hospitalization ..0
* location ..0
* serviceProvider ..0
* partOf ..0
