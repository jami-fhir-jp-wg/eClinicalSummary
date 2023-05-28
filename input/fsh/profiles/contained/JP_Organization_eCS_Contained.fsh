//-------------------------------
//--- Profile for conatained resource within other resources
//-------------------------------

Profile: JP_Organization_eCS_Contained
Parent: JP_Organization_eCS
Id: JP-Organization-eCS-Contained
Title: "JP_Organization_eCS_Contained"
Description: "診療情報コアサマリー埋め込み用 Organizationリソース(医療機関等組織情報)プロファイル　　（JP_Organization_eClinicalSummaryの派生プロファイル）"
* ^url = $JP_Organization_eCS_Contained
* ^status = #active
* ^date = "2023-05-27"
* . ^short = "診療情報コアサマリーにおける他のリソースへの埋め込み用の医療機関等組織情報の格納に使用する。"
* . ^definition = "診療情報コアサマリー・厚労省6情報などにおける他のリソースへの埋め込み用の医療機関等組織情報の格納に使用する。"
* . ^comment = "Contaiedリソースであるため、これ自身はContainedリソースを持てない。"

* id 1..1
//* meta.profile = $JP_Organization_LabResult_eCS_Contained
* implicitRules ..0
* text ..0
* contained ..0

