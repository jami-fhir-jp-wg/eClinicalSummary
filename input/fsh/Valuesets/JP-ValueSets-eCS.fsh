
//
// プランのタイプ
// "hospital-plan"(入院中のプラン)、または"discharge-plan"(退院時のプラン)のいずれか固定値。
//

ValueSet:  JP_valueSet_carePlanCategory
Id:   JP-valueSet-carePlanCategory
Title: "CarePlan カテゴリー"
Description: "CarePlan カテゴリー　hospital-plan または discharge-plan"
* ^url = $JP_carePlanCategory_VS
* ^status = #active
* ^experimental = false
* include codes from system $JP_carePlanCategory_CS

