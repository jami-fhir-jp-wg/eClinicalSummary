Profile: JP_Patient_eClinicalSummary
Parent: JP_Patient
Id: JP-Patient-eClinicalSummary
Description: "対象患者のPatientプロファイル　JP_Patientの派生プロファイル"
* ^url = "http://jpfhir.jp/fhir/eClinicalSummary/StructureDefinition/JP_Patient_eClinicalSummary"
* ^status = #active
* ^date = "2023-03-31"
* meta.lastUpdated 1.. MS
* identifier 1.. MS
* identifier.assigner.reference ^short = "患者番号を付番した医療機関情報（Organization）への参照"
* identifier.assigner.reference ^definition = "患者番号を付番した医療機関情報（Organization）への参照"
* identifier.assigner.reference MS
* name 1.. MS
* gender 1.. MS
* birthDate 1.. MS
* address 1..1 
* address ^definition = "An address for the individual.\r\n患者の住所。必須。"
* address.text 1.. 
* address.postalCode 1.. 
* address.country 0.. 

/*
Profile: JP_Patient_eCS_Contained
Parent: JP_Patient
Id: JP-Patient-eCS_Contained
Description: "対象患者のPatientプロファイル　JP_Patientの派生プロファイル"
* ^url = "http://jpfhir.jp/fhir/eClinicalSummary/StructureDefinition/JP_Patient_eCS_Contained"
* ^status = #active
* ^date = "2023-03-31"
* implicaiRules ..0
* text ..0
* contained ..0
* religion ..0
* birthPlace ..0
* race ..0
* modifierExtension ..0
* identifier 1.. MS
* identifier.id ..0
* identifier.extension ..0
* identifier.use ..0
* identifier.type ..0
* identifier.system 1..1
* identifier.value 1..1
* identifier.period ..0
* identifier.assigner ..0
* active ..0

* name 1.. MS
* name.id ..0
* name.nameRepresentationUse 1..1
* name.use 
* gender 1.. MS
* birthDate 1.. MS
* address 1..1 
* address ^definition = "An address for the individual.\r\n患者の住所。必須。"
* address.text 1.. 
* address.postalCode 1.. 
* address.country 0.. 
*/