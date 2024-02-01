
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


//--------------------------------------------------------------------
// 受診形態区分	Encounter.serviceType
//	受診形態区分を識別するコード。
//--------------------------------------------------------------------
ValueSet: ECheckup_valueSet_encounterType
Id: ECheckup-valueSet-encounterType
Title: "受診形態区分"
Description: "受診形態区分"
* ^url = $checkup_encounter_type_vs
* ^status = #active
* ^experimental = false
* include codes from system $checkup_encounter_type_cs

//--------------------------------------------------------------------
// 受診区分	Encounter.class
//	受診種別を表すコードシステム。
//--------------------------------------------------------------------
ValueSet: ECheckup_valueSet_encounterCategory
Id: ECheckup-valueSet-encounterCategory
Title: "受診区分"
Description: "受診区分"
* ^url = $encounter_cateogry_vs
* ^status = #active
* ^experimental = false
* include codes from system $encounter_cateogry_cs

