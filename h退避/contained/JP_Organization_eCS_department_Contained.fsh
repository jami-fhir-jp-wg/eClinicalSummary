
Profile: JP_Organization_eCS_department_Contained
Parent: JP_Organization_eCS_department
Id: JP-Organization-eCS-department-Contained
Title: "JP_Organization_eCS_department_Contained"
Description: "診療情報コアサマリー埋め込み用 Organizationリソース(診療科情報)プロファイル　　（JP_Organization_eCS_departmentの派生プロファイル）"
* ^url = $JP_Organization_eCS_department_Contained 
* ^status = #active
* ^date = "2023-05-27"
* . ^short = "診療情報コアサマリーにおける他のリソースへの埋め込み用の診療科情報の格納に使用する。"
* . ^definition = "診療情報コアサマリー・厚労省6情報などにおける他のリソースへの埋め込み用の診療科情報の格納に使用する。"
* . ^comment = "Contaiedリソースであるため、これ自身はContainedリソースを持てない。この診療科が所属する医療機関への参照（partOf要素）を記述する場合には、その医療機関リソースは、このContaiedリソースを包含する親リソースのContaiedリソースに記述し、そのidを参照すること。"

* id 1..1
// $JP_Organization_eCS_department_Contained 
* implicitRules ..0
* text ..0
* contained ..0
