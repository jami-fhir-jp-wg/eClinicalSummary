// ==================================================
//   Profile 定義 FHIR臨床コア情報 Clinical-coreセット
//   傷病名情報 リソースタイプ:Condition
//   親プロファイル:JP_Condition
// ==================================================
Profile:        JP_Condition_eCS
Parent:			JP_Condition
Id:             JP-Condition-eCS
Title:  "Core6 : JP_Condition_eCS"
Description: "診療情報コアサマリー用　Conditionリソース（傷病名情報）プロファイル　（JP_Coonditionの派生プロファイル）"
* ^url = $JP_Condition_eCS
* ^status = #active
* ^date = "2023-05-27"
* . ^short = "診療情報コアサマリーにおける傷病名情報の格納に使用する"
* . ^definition = "診療情報コアサマリー・厚労省6情報などにおける傷病名情報の格納に使用する"

* clinicalStatus ^short = "病名最終日（onsetPeriod.end)での状態（転帰）"
* clinicalStatus ^definition = "病名最終日（onsetPeriod.end)での状態（転帰）"
* clinicalStatus ^comment = "コード表　http://terminology.hl7.org/CodeSystem/condition-clinical　から　active（存続）, remission(軽快、寛解), inactive（治癒以外での病名の終了）, resolved (治癒) のいずれかを選ぶ。"

* code 1..1 MS
* code ^short = "傷病名のコードと名称"
* code ^definition = "傷病名のコードと名称"
* code ^comment = "傷病名のコードと名称"
* code.coding ^binding.description = "MEDIS 病名交換コード、病名管理番号、ICD10分類コード、レセプト電算処理用傷病名コード、またはレセプト電算処理用傷病名コードの未コード化コード(7桁all 9)のいずれかまたは複数の組み合わせで表現する。"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding contains
    mediskoukan 0.. MS
and mediskanri 0.. MS
and syobo 0.. MS
and icd10 0.. MS

* code.coding[mediskoukan].system = $JP_Disease_MEDIS_Concept_CS (exactly)    // MEDIS 病名交換コード
//* code.coding[mediskoukan].code from $JP_Disease_MEDIS_Concept_VS
* code.coding[mediskanri].system = $JP_Disease_MEDIS_ManagementID_CS (exactly) // MEDIS 病名管理番号
//* code.coding[mediskoukan].code from $JP_Disease_MEDIS_ManagementID_VS
* code.coding[syobo].system = $JP_Disease_Claim_CS (exactly)    // レセプト電算処理用傷病名コード
//* code.coding[syobo].code from $JP_Disease_Claim_VS    // レセプト電算処理用傷病名コード
* code.coding[icd10].system = $JP_DiseaseCategory_WHO_ICD10_CS   (exactly)  // ICD10分類コード
//* code.coding[icd10].code from $JP_DiseaseCategory_WHO_ICD10_VS   　// ICD10分類コード

* bodySite 0..* MS
* bodySite ^short = "傷病名の部位等の情報、部位以外の修飾語もここに格納する"
* bodySite ^definition = "修飾語のコードと名称"
* bodySite ^comment = "修飾語のコードと名称"
* bodySite.coding ^binding.description = "MEDIS 病名修飾語コード、修飾語管理番号、レセプト電算処理用傷病名修飾語コードのいずれかまたは複数の組み合わせで表現する。"
* bodySite.coding ^slicing.discriminator.type = #value
* bodySite.coding ^slicing.discriminator.path = "system"
* bodySite.coding ^slicing.rules = #open
* bodySite.coding contains
    mediskoukan 0.. MS
and mediskanri 0.. MS
and syobo 0.. MS
* bodySite.coding[mediskoukan].system = $JP_BodySite_MEDIS_Concept_CS (exactly)    // MEDIS 病名修飾語交換コード
//* bodySite.coding[mediskoukan].code from $JP_BodySite_MEDIS_Concept_VS    // MEDIS 病名修飾語交換コード
* bodySite.coding[mediskanri].system = $JP_BodySite_MEDIS_ManagementID_CS (exactly) // MEDIS 病名修飾語番号
//* bodySite.coding[mediskanri].code from $JP_BodySite_MEDIS_ManagementID_VS  // MEDIS 病名修飾語番号
* bodySite.coding[syobo].system = $JP_Disease_Claim_CS (exactly)    // レセプト電算処理用傷病名修飾語コード
//* bodySite.coding[syobo].code from $JP_Disease_Claim_VS    // レセプト電算処理用傷病名修飾語コード

* subject 1..1   MS   // MS 追加
* subject only Reference(JP_Patient_eCS_Contained)
* subject ^short = "患者"
* subject ^definition = "患者"
* subject ^comment = "Containedリソースに含まれる患者リソースのid(identifierではなく)をリソース内で#を最初につけて参照する。（患者リソースのid を　123 とすると、　{\"reference\" : \"#123\" }のようになる。）"


* encounter 0..1 MS
* encounter only  Reference(JP_Encounter_OW_eCS_Contained)
* encounter ^short = "病名をつけたときの受診情報（入外区分など）"
* encounter ^definition = "病名をつけたときの受診情報（入外区分など）を表すEncounterリソース（Containedリソース）への参照"
* encounter ^comment = "Containedリソースに含まれるEncounterリソースをリソース内で参照する。なくてもよい。"

* onset[x] only Period
* onsetPeriod.start ^short = "病名開始日"
* onsetPeriod.end ^short = "病名終了日"