// ==================================================
//   Profile 定義 電子カルテ共有サービス用
//   処方オーダの１処方薬情報 リソースタイプ:MedicationRequest
//   親プロファイル:JP_MedicationRequest
// ==================================================
Profile: JP_MedicationRequest_CLINS_eCS
Parent: JP_MedicationRequest_eCS
Id: JP-MedicationRequest-CLINS-eCS
Title:  "CLINS電子カルテ情報共有サービス用:JP_MedicationRequest_CLINS_eCS"
Description: "CLINS 電子カルテ共有サービス用 MedicationRequestリソース（処方オーダの１処方薬情報）プロファイル。JP_MedicationRequest_eCSからの派生プロファイル。"

* extension[eCS_InstitutionNumber] 1..1 MS

* ^url = $JP_MedicationRequest_CLINS_eCS
* ^status = #active
* ^date = "2024-02-25"

* . ^comment = "このプロファイルは、電子カルテ情報共有サービスに送信される文書に処方情報を含める場合に使用されるプロファイルである。"

* meta.profile 1..1 MS
  * insert relative_short_definition("準拠しているプロファイルとして次のURLを指定する。http://jpfhir.jp/fhir/clins/StructureDefinition/JP_MedicationRequest_CLINS_eCS")
  
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

* extension[eCS_InstitutionNumber] 1..1 MS
  * insert relative_short_definition("本情報を作成発行した医療機関の識別番号を記述するために使用する拡張「eCS_InstitutionNumber」。電子カルテ情報サービスでは、この拡張による記述は必須。本情報は、ServiceRequestの要素として記述することも可能であるが、その場合もこの拡張で記述することとする。")
  * ^comment = "電子カルテ情報サービスでは、この拡張による記述は必須。医療機関１０桁番号を示すsystem値は\"http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no\"を使用する。"


// 患者情報
* subject ^comment = "電子カルテ共有サービスでは、別途BundleリソースでPatientリソースが送信されているので、その被保険者個人識別子を明示することにより患者を参照する。"
* subject.identifier.system = $JP_Insurance_memberID (exactly)


