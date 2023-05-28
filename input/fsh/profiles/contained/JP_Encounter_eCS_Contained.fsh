

//-------------------------------
//--- Profile for conatained resource within other resources
//-------------------------------

Profile: JP_Encounter_eCS_Contained
Parent: JP_Encounter
Id: JP-Encounter-eCS-Contained
Description: "診療情報コアサマリー埋め込み用 Encouterリソース(受診や入院に関する情報)プロファイル　　（JP_Encounter_eClinicalSummaryの派生プロファイル）"
* ^url = $JP_Encounter_eCS_Contained
* ^status = #active
* ^date = "2023-03-31"

* id 1..1
* meta.profile = $JP_Encounter_eCS_Contained
* implicitRules ..0
* text ..0
* contained ..0
