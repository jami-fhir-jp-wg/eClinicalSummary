
ValueSet:  JP_CLINS_BundleResourceType_VS
Id:   jp-clins-bundleresourcetype-vs
Description: "６情報Bundle６情報リソースタイプ　valueSet"
* ^url = $JP_CLINS_BundleResourceType_VS
* ^title = "６情報Bundle６情報リソースタイプ　valueSet"
* ^status = #active
* ^experimental = false
* include codes from system $JP_CLINS_BundleResourceType_CS

ValueSet: JP_eCS__MedicationCode_Nocoded_VS
Id: jp-ecs-medicationcode-nocoded-vs
Description: "医薬品コードで標準コードが割り当てられない場合に使用する未コード化コードだけのValueSet"
* ^url = $JP_eCS_MedicationCodeNocoded_VS
* ^title = "医薬品未標準化コード項目　valueSet"
* ^status = #active
* ^experimental = false
* include codes from system $JP_eCS_MedicationCodeNocoded_CS

ValueSet: JP_admit_Source_VS
Id: jp-admit-Source-Source-VS
Title: "入院経路を表すコード (出典：厚労省DPC導入影響評価調査)  ValueSet"
Description: "入院経路を表すコード (出典：厚労省DPC導入影響評価調査)  ValueSet"
* ^url = $JP_admit_Source_VS
* ^status = #active
* ^experimental = false
* ^date = "2024-01-28"
* include codes from system  $JP_admit_Source_CS

