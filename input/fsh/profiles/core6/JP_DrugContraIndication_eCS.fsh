// ==================================================
//   Profile 定義 FHIR臨床コア情報 Clinical-coreセット
//   薬剤禁忌情報 リソースタイプ:AllergyIntolerance
//   親プロファイル:JP_AllergyIntolerance
// ==================================================
Profile:        JP_DrugContraIndication_eCS
Parent:			JP_AllergyIntolerance
Id:             JP-DrugContraIndication-eCS
Title:  "Core6 : JP_DrugContraIndication_eCS"
Description: "診療情報コアサマリー用　AllergyIntoleranceリソース（薬剤禁忌情報に特化）プロファイル　（JP_AllergyIntoleranceの派生プロファイル）"
* ^url = $JP_DrugContraIndication_eCS
* ^status = #active
* ^date = "2023-05-27"
* . ^short = "診療情報コアサマリーにおける薬剤禁忌情報の格納に使用する"
* . ^definition = "診療情報コアサマリー・厚労省6情報などにおける薬剤禁忌情報の格納に使用する"
* . ^comment = "厚労省6情報などの運用において、アレルギー情報のプロファイルではなく、薬剤禁忌の情報は本プロフィルを使用すること。両者の区別は、category要素=drug かつ criticality要素=high によって判定する。"

* identifier 0..1 MS
* identifier.system 1..1 MS
* identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier.value 1..1 MS

* clinicalStatus   0..1 MS
* clinicalStatus   ^short = "臨床的状態のステータス。"
* clinicalStatus    ^definition = "active | inactive | resolved のいすれか（現存、非現存、解消）system=http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"

* verificationStatus    0..1 MS
* verificationStatus    ^short = "入力された臨床的状態に対する検証状況を示す。確からしさと考えられる。"
* verificationStatus    ^definition = "unconfirmed | confirmed | refuted | entered-in-error  のいずれか（未確認、確認ずみ、否定、エラー）　system=http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"

* type 0..1  MS
* type ^short = "副反応の生理的なメカニズムの種類（アレルギーによるものか不耐性によるものかどうか）"
* type ^definition = "記述する場合は、コード表：\"http://hl7.org/fhir/allergy-intolerance-type\" から　allergy | intolerance のいずれか（アレルギー反応、不耐性反応）"

* category 1..1 MS
* category ^short = "特定された原因物質のカテゴリ。記述を可能な限り推奨する。"
* category ^definition = "コード表：\"http://hl7.org/fhir/allergy-intolerance-category\" から medication 医薬品 を使用する。"
* category ^comment = "厚労省6情報などの運用において、薬剤禁忌の情報は本プロフィルではなく、薬剤禁忌情報プロファイルを使用することとしているで、medication を設定する場合には禁忌であれば、別のプロファイルを使用すること。"
* category = #medication

* criticality 1..1 MS
* criticality ^short = "潜在的な臨床的危険性、致命度"
* criticality ^definition = "記述する場合は、コード表：\"http://hl7.org/fhir/allergy-intolerance-criticality\" から high を使用する。"
* criticality = #high

* code  1..1 MS
* code  ^short = "医薬品情報のコード"
* code  ^definition = "jp-coreで定めるallergy-substanceコード表のコードを使用を推奨する。コード化できない場合には、code.text のみで記述する。使用するコード表（推奨）：http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyMedicationAllergen_CS　これに使用される医薬品コードはYJコード、厚生労働省医薬品コード、同一般医薬品コード、HOT9コードなどを選べる。"
* code from $JP_JfagyMedicationAllergen_VS (preferred)
* code  ^comment = "https://jami-fhir-jp-wg.github.io/jp-core-v1xpages/jpcore-r4/develop/StructureDefinition-jp-allergyintolerance.html#%E6%B3%A8%E6%84%8F%E4%BA%8B%E9%A0%85 の注意事項を参照のこと。またアレルギー情報や薬剤禁忌情報はコードにより正確に表現することが困難であることが多いので、必ずcode.textにより文字列で記述すること。"
* code.text 1..1 MS
* code.text ^short = "薬剤禁忌情報をフリーテキストで記述した内容"

* patient 1..1   MS   
* patient only Reference(JP_Patient_eCS_Contained)
* patient ^short = "患者情報"
* patient ^definition = "患者情報への参照"
* patient ^comment = "Containedリソースに含まれる患者リソースのid(identifierではなく)をリソース内で#を最初につけて参照する。（患者リソースのid を　123 とすると、　{\"reference\" : \"#123\" }のようになる。）"

* encounter 0..1 MS
* encounter only  Reference(JP_Encounter_OW_eCS_Contained)
* encounter ^short = "この情報を記録したときの受診情報（入外区分など）"
* encounter ^definition = "この情報を記録したときの受診情報（入外区分など）を表すEncounterリソース（Containedリソース）への参照"
* encounter ^comment = "Containedリソースに含まれるEncounterリソースをリソース内で参照する。なくてもよい。"

* onset[x] only Period
* onsetPeriod.start ^short = "登録日またはこの状態の存在が開始した日"
* onsetPeriod.end ^short = "この状態がなくなった、無効になった日"

* recordedDate 0..1 MS
* recordedDate ^short = "この情報を記録した登録日"
* recordedDate ^definition = "この情報を記録した登録日"

* recorder 0.. MS
* recorder only Reference(JP_Practitioner_eCS_Contained)
* recorder ^short = "この情報を記録した登録者"
* recorder ^definition = "登録者を表すPractitionerリソース（Containedリソース）への参照"
* recorder ^comment = "Containedリソースに含まれるPractitioner（登録者/医療者）リソースをこのリソース内で参照する。"

* asserter 0..1 MS
* lastOccurrence  0..1 MS
* note  0..1 MS
* reaction 0..1 MS

