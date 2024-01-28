// JP_AllergyIntolerance_eCS
// Description　meta.lastUpdated設定　必須　１回のみ
// パラメータ：なし（固定値が設定される）
// 030 verificationStatus
//当面中略（診療情報提供書）

Instance: Example-JP-AllergyIntolerance-eCS-01
InstanceOf: JP_AllergyIntolerance_eCS
Usage: #example
Description: "allergyeferralExample01 アレルギー例1　サバ"

* contained[+] = Example-JP-Patient-eCS-01-Contained
* contained[+] = Example-JP-Encounter-OW-eCS-01-Contained

* meta.lastUpdated = "2023-04-01T10:00:00+09:00"
* meta.profile[+] = $JP_AllergyIntolerance_eCS

* identifier.system = "http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier"
* identifier.value = "102934701"
* clinicalStatus = http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical#active
 // active | recurrence | relapse | inactive | remission | resolved

* type = #allergy

//040on_アレルギタイプ不耐性()
// food | medication | environment | biologic 食物、医薬品、環境、生物学的
* category = #food

// food | medication | environment | biologic 食物、医薬品、環境、生物学的
//060on_アレルギ程度(ARGst)
// low | high | unable-to-assess 低、高、評価不能
* criticality = #unable-to-assess

//070on_アレルギ物質コード名称JFAGY(ARGcode,ARGname)
* code.text = "サバ"

* patient = Reference(Example-JP-Patient-eCS-01-Contained)

* encounter = Reference(Example-JP-Encounter-OW-eCS-01-Contained)

//100on_アレルギ時期日時(ARGdate,ARGtime)
//100on_アレルギ時期日(ARGdate)
* onsetPeriod.start = "2020-04-10"

* note.text = "サバ食後３時間ほどで全身に発疹と腹痛あり"
