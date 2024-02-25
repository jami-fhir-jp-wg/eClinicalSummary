// ==================================================
//   Profile 定義 電子カルテ共有サービス用
//   検体検査結果／感染症検体検査結果 リソースタイプ:Observation
//   親プロファイル:JP_Observation_LabResult_eCS
// ==================================================
Profile: JP_Observation_LabResult_CLINS_eCS
Parent: JP_Observation_LabResult_eCS
Id: JP-Observation-LabResult-CLINS-eCS
Title:  "CLINS電子カルテ情報共有サービス用:JP_Observation_LabResult_CLINS_eCS"
Description: "CLINS 電子カルテ共有サービス用 Observationリソース（検体検査結果／感染症検体検査結果）プロファイル。 JP_Observation_LabResult_eCSからの派生プロファイル。"


* extension[eCS_InstitutionNumber] 1..1 MS
* ^url = $JP_Observation_LabResult_CLINS_eCS
* ^status = #active
* ^date = "2024-02-25"
* . ^comment = "このプロファイルは、電子カルテ情報共有サービスに送信するために適合したプロファイルである。"

* meta.profile 1..1 MS
  * insert relative_short_definition("準拠しているプロファイルとして次のURLを指定する。http://jpfhir.jp/fhir/clins/StructureDefinition/JP_Observation_LabResult_eCS　を設定する。")

* meta.tag  ^slicing.discriminator.type = #value
* meta.tag  ^slicing.discriminator.path = "$this"
* meta.tag  ^slicing.rules = #open
* meta.tag contains lts 0..1 MS
//  and uninformed 0..1 MS

* meta.tag[lts] = $JP_ehrshrs_indication_CS#LTS
  * insert relative_short_definition("電子カルテ情報共有サービスで長期保存フラグの設定する場合に使用する。")
  * system 1..1 MS
    * insert relative_short_definition("固定値 http://jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication　を設定する。" )
  * code 1..1 MS
    * insert relative_short_definition("長期保存フラグ　固定値 LTSを設定する。")




// 患者情報
* subject ^comment = "電子カルテ共有サービスでは、別途BundleリソースでPatientリソースが送信されているので、その被保険者個人識別子を明示することにより患者を参照する。"
* subject.identifier.system = $JP_Insurance_memberID (exactly)

