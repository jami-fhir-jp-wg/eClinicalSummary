//-------------------------------
//--- Profile for conatained resource within other resources
//-------------------------------

Profile: JP_Practitioner_eCS_Contained
Parent: JP_Practitioner_eCS
Id: JP-Practitioner-eCS-Contained
Description: "診療情報コアサマリー埋め込み用 Practitionerリソース（医師情報）　　（JP-Practitioner-eCSの派生プロファイル）"
* ^url = $JP_Practitioner_eCS_Contained
* ^status = #active
* ^date = "2023-05-27"
* . ^short = "診療情報コアサマリーにおける他のリソースへの埋め込み用のオーダ等の医師情報の格納に使用する"
* . ^definition = "診療情報コアサマリー・厚労省6情報などにおける他のリソースへの埋め込み用のオーダ等の医師情報の格納に使用する"
* . ^comment = "Contaiedリソースであるため、これ自身はContainedリソースを持てない。"

* id 1..1
* implicitRules ..0
* text ..0
* contained ..0

* meta.lastUpdated 0.. MS
* meta.lastUpdated ^short = "最終更新日"
* meta.lastUpdated ^definition = "この患者情報の内容がサーバ上で最後に格納または更新された日時、またはこのFHIRリソースが生成された日時"
* meta.profile 1.. MS
//* meta.profile = $JP_Practitioner_eCS_Contained

* identifier 0..1
* name 1..1
