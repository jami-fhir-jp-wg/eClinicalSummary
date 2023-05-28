//-------------------------------
//--- Profile for conatained resource within other resources
//-------------------------------
Profile: JP_Patient_eCS_Contained
Parent: JP_Patient_eCS
Id: JP-Patient-eCS-Contained
Title: "JP_Patient_eCS_Contained"
Description: "診療情報コアサマリー埋め込み用 Patientリソース(患者情報)プロファイル　　（JP_Patient_eClinicalSummaryの派生プロファイル）"
* ^url = $JP_Patient_eCS_Contained
* ^status = #active
* ^date = "2023-03-31"
* id 1..1
//* meta.profile = $JP_Patient_eCS_Contained
* implicitRules ..0
* text ..0
* contained ..0
* extension[religion] ..0
* extension[birthPlace] ..0
* extension[race] ..0
* modifierExtension ..0
* identifier 1.. 
* identifier.id ..0
* identifier.extension ..0
* identifier.use ..0
* identifier.type ..0
* identifier.period ..0
* identifier.assigner ..0
* active ..0
* telecom ..0
* address ..0
* maritalStatus ..0
* photo ..0
* contact ..0
* communication ..0
* generalPractitioner ..0
* managingOrganization ..0
* link ..0
