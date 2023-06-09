// ==================================================
//   Profile 定義 FHIR臨床コア情報 Clinical-coreセット
//   検体検査結果 リソースタイプ:Practitioner
//   親プロファイル:JP_Practitioner
// ==================================================

Profile: JP_Practitioner_eCS
Parent: JP_Practitioner
Id: JP-Practitioner-eCS
Description: "診療情報コアサマリー埋め込み用 Practitionerリソース（医師情報）　　（JP_Practitionerの派生プロファイル）"
* ^url = $JP_Practitioner_eCS
* ^status = #active
* ^date = "2023-05-27"
* . ^short = "診療情報コアサマリーにおけるオーダ等の医師情報の格納に使用する"
* . ^definition = "診療情報コアサマリー・厚労省6情報などにおけるオーダ等の医師情報の格納に使用する"

* meta.lastUpdated 0.. MS
* meta.lastUpdated ^short = "最終更新日"
* meta.lastUpdated ^definition = "この患者情報の内容がサーバ上で最後に格納または更新された日時、またはこのFHIRリソースが生成された日時"
* meta.profile 1.. MS
* meta.profile = $JP_Practitioner_eCS

* identifier ^short = "依頼医師ID"
* identifier ^definition = "依頼医師ID。\r\n依頼医師を識別するIDや番号として、依頼医師療機関における依頼医師ID（たとえば端末利用者アカウント、あるいは職員番号など）をPractitionerリソースのidentifier要素に記録する。"
* identifier.system ^short = "依頼医師ID（医師）のsystem値"
* identifier.system MS
* identifier.system ^definition = "urn:oid:1.2.392.100495.20.3.41.1[保険医療機関コード(10桁)\r\n末尾の1[保険医療機関コード(10桁)]とは、具体的には保険医療機関コード10桁の先頭に1をつけた必ず11桁とすることを示す。"
* identifier.value ^short = "医療機関で発番している医師のID"
* identifier.value ^definition = "依頼医師を識別するIDや番号として、依頼医師療機関における依頼医師ID（たとえば端末利用者アカウント、あるいは職員番号など）をPractitionerリソースのidentifier要素に記録する。"
* identifier.value MS

* name ^short = "依頼医師氏名"
/* 資格の明記は不要のためチェックしない
* obeys
    checkQualification-DoctorLicenseExists and 
    checkQualification-approapriateLicense and 
    checkQualification-NarcoticPractitioner and 
    checkQualification-category
    */

* qualification.identifier 0..* 
* qualification.identifier.system 1.. 
* qualification.identifier.system ^definition = "医籍登録番号等（歯科医籍登録番号を含む、以下同じ）の場合、識別する名前空間のURI urn:oid:1.2.392.100495.20.3.31。\r\n麻薬施用免許番号の場合：都道府県番号を２桁（１桁の都道府県では０をつけた２桁）を末尾につけた\r\nurn:oid:1.2.392.100495.20.3.32.1[都道府県番号2桁]　形式。"
* qualification.identifier.value 0.. 
* qualification.identifier.value ^short = "医籍登録番号等または麻薬施用者免許番号"
* qualification.identifier.value ^definition = "医籍登録番号または麻薬施用者免許番号"
* qualification.code 
* qualification.code.coding 1..1 
* qualification.code.coding.system 1.. 
* qualification.code.coding.system ^definition = "コード体系 Certificateの種類を識別するURI http://jpfhir.jp/fhir/core/CodeSystem/practitioner_certificate_category"
* qualification.code.coding.code 1.. 
* qualification.code.coding.code ^definition = "Certificateの種類コード 'medical-registration'、'dental-registration'、または'narcotics-practitioner'の固定値。"
