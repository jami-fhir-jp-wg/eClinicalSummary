


//--------------------------------------------------------------------
// 受診形態区分	Encounter.serviceType
//	受診形態区分を識別するコード。
//--------------------------------------------------------------------
ValueSet: ECheckup_valueSet_encounterType
Id: ECheckup-valueSet-encounterType
Description: "受診形態区分"
* ^url = $checkup_encounter_type_vs
* include codes from system $checkup_encounter_type_cs

//--------------------------------------------------------------------
// 受診区分	Encounter.class
//	受診種別を表すコードシステム。
//--------------------------------------------------------------------
ValueSet: ECheckup_valueSet_encounterCategory
Id: ECheckup-valueSet-encounterCategory
Description: "受診区分"
* ^url = $encounter_cateogry_vs
* include codes from system $encounter_cateogry_cs

