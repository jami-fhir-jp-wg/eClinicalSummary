// ==================================================
//   Profile 定義 電子カルテ共有サービス用
//   アレルギー情報／薬剤禁忌 リソースタイプ:AllergyIntolerance
//   親プロファイル:JP_AllergyIntolerance_eCS
// ==================================================

Profile:        JP_AllergyIntolerance_CLINS_eCS
Parent:			JP_AllergyIntolerance_eCS
Id:             JP-AllergyIntolerance-CLINS-eCS
Title:  "CLINS電子カルテ情報共有サービス用:JP_AllergyIntolerance_CLINS_eCS"
Description: "CLINS 電子カルテ共有サービス用 AllergyIntoleranceリソース（アレルギー情報／薬剤禁忌）プロファイル。 JP_AllergyIntolerance_eCSからの派生プロファイル。"

* obeys warning-medication-allergy

* ^url = $JP_AllergyIntolerance_CLINS_eCS
* ^status = #active
* ^date = "2024-02-25"
* insert toplevel_short_definition("診療情報におけるアレルギー情報／薬剤禁忌の格納に使用する")
* . ^comment = "このプロファイルは、電子カルテ情報共有サービスに送信するために適合したプロファイルである。薬剤禁忌情報かアレルギー情報かの区別はcategory要素がmedicationかそれ以外かによる。"



* meta.profile 1..1 MS
  * insert relative_short_definition("準拠しているプロファイルを受信側に通知するため、本文書のプロファイルを識別するURLを必ず指定する。http://jpfhir.jp/fhir/clins/StructureDefinition/JP_AllergyIntolerance_eCS")

* meta.tag  ^slicing.discriminator.type = #value
* meta.tag  ^slicing.discriminator.path = "$this"
* meta.tag  ^slicing.rules = #open
* meta.tag contains lts 0..1 MS

* meta.tag[lts] = $JP_ehrshrs_indication_CS#LTS
  * insert relative_short_definition("電子カルテ情報共有サービスで長期保存フラグの設定する場合に使用する。")
  * system 1..1 MS
    * insert relative_short_definition("固定値 http://jpfhir.jp/fhir/clins/CodeSystem/JP_ehrshrs_indication　を設定する。" )
  * code 1..1 MS
    * insert relative_short_definition("長期保存フラグ　固定値 LTSを設定する。")

* extension[eCS_InstitutionNumber] 1..1 MS
  * insert relative_short_definition("本情報を作成発行した医療機関の識別番号を記述するために使用する拡張「eCS_InstitutionNumber」。電子カルテ情報サービスでは、この拡張による記述は必須。本情報は、ServiceRequestの要素として記述することも可能であるが、その場合もこの拡張で記述することとする。")
  * ^comment = "電子カルテ情報サービスでは、この拡張による記述は必須。医療機関１０桁番号を示すsystem値は\"http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no\"を使用する。"

* category ^comment = "電子カルテ情報共有サービスでは、薬剤禁忌情報として本リソース種別を使用する場合には、必ず本要素は\"medication\"として存在しなければならず、criticality要素は\"high\"を設定しなければならない。これ以外の場合には、本リソースの情報は薬剤禁忌以外のアレルギー情報として取り扱われる。"

* criticality ^comment = "電子カルテ情報共有サービスでは、薬剤禁忌情報として本リソース種別を使用する場合には、category要素の記述を参照すること。" 


// 患者情報
* patient ^comment = "電子カルテ共有サービスでは、別途BundleリソースでPatientリソースが送信されているので、その被保険者個人識別子を明示することにより患者を参照する。"
* patient only  Reference(JP_Patient_CLINS_eCS)
* patient.identifier.system = $JP_Insurance_memberID (exactly)


