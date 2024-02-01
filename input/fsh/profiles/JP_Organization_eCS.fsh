
Profile: JP_Organization_eCS
Parent: JP_Organization
Id: JP-Organization-eCS
Title: "JP_Organization_eCS"
Description: "診療情報コアサマリー用　Organizationリソース（医療機関等の組織・機関情報）プロファイル　（JP_Organizationの派生プロファイル）"
//* obeys checkPhoneNumberExists
* ^url = "http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Organization_eCS"
* ^status = #active
* ^date = "2023-03-31"
* . ^short = "３文書６情報や診療サマリーなどで記録する医療機関(および診療科情報）の格納に使用する"
* . ^definition = "３文書６情報や診療サマリーなどで記録する医療機関(および診療科情報）の格納に使用する"
* . ^comment = "広義の医療機関すなわち健康医療介護等にかかわる組織（調剤薬局、健診機関などを含む）の格納に使用できる。機関の中の部署、診療科のような部分組織には、本プロファイルを使用しない。機関に所属する診療科や部署・チームの情報を含めて記述する場合には、本プロファイルではJP_eCS_Department拡張を使用して、必ず所属機関の情報の一部とすること。"

* text ^short = "本リソースをテキストで表現したものを入れてもよい。"
* text.status ^short = "generated| extensions | additional | empty"
* text.status ^definition = "固定値。テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.div ^definition = "本リソースの構造化情報から生成したテキスト表現をいれてもよい。\\\\r\\\\nXHTML形式。"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

* extension contains
    JP_Organization_PrefectureNo named prefectureNo ..1 and
    JP_Organization_InsuranceOrganizationCategory named organizationCategory ..1 and
    JP_eCS_InstitutionNumber named organizationNo ..1 and
    JP_eCS_Department named department ..1

* extension[prefectureNo] 0.. MS
* extension[prefectureNo] ^short = "都道府県番号"
* extension[prefectureNo] ^definition = "都道府県番号"
* extension[prefectureNo].value[x] 1.. MS

* extension[organizationCategory] 0.. MS
* extension[organizationCategory] ^short = "医科、歯科、調剤薬局等の施設区分コード"
* extension[organizationCategory] ^definition = "医科、歯科、調剤薬局等の施設区分コード"
* extension[organizationCategory].value[x] 1.. MS

* extension[organizationNo] 0.. MS
* extension[organizationNo] ^short = "保険医療機関番号"
* extension[organizationNo] ^definition = "保険医療機関番号。使用する場合には１０桁の（保険）医療機関番号を設定する。"
* extension[organizationNo].value[x] 1.. MS

* extension[department] 0.. MS
* extension[department] ^short = "診療科情報"
* extension[department] ^definition = "診療科情報。コード化する場合にはSS-MIX2診療科コードを使用する。"
* extension[department] ^comment = "診療科だけでなく、医療機関の部署も記述しても差し支えない。ただし支部や分院のように別の組織ではあるが階層関係がある場合には、別のOrganizationリソースで記述し、そのpartOf要素に上位の機関のリソースを参照するようにすること。"
* extension[department].value[x] 1.. MS

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "複数のシステムでこの組織を識別【詳細参照】"
* identifier ^definition = "複数の異種システムにまたがって組織を識別するための識別子"
* identifier ^requirements = "組織は様々な ID で知られている。いくつかの機関では複数のIDを保持しており、ほとんどの機関では、組織に関する他の組織との交換のためにIDを収集している。"
* identifier ^comment = "福祉医療関連施設と保険者組織はSlicingについてはJP Coreにて定義を行なっているため、定義に従いデータを格納すること。それ以外の組織については、利用する際には必要に応じて識別子を定義を行なうこと。"
* identifier contains
    medicalInstitutionCode ..*

* identifier[medicalInstitutionCode] 0..1 MS
* identifier[medicalInstitutionCode].system 1.. MS
* identifier[medicalInstitutionCode].system = "http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no" (exactly)
* identifier[medicalInstitutionCode].system ^short = "保険医療機関番号10桁の名前空間を識別するURL"
* identifier[medicalInstitutionCode].system ^definition = "保険医療機関番号10桁の名前空間を識別するURL。固定値。"
* identifier[medicalInstitutionCode].value ^short = "保険医療機関番号10桁"
* identifier[medicalInstitutionCode].value ^definition = "保険医療機関番号10桁。\r\n都道府県番号２桁、医科１または歯科３の種別コード１桁、保険医療機関番号７桁を連結した半角数字１０桁固定長の文字列。"
* identifier[medicalInstitutionCode].value MS

* type 0..1 MS
* type.coding.system = "http://terminology.hl7.org/CodeSystem/organization-type" (exactly)
* type.coding.system MS
* type.coding.system ^short = "施設種別を表すコード体系を識別するURI"
* type.coding.system ^definition = "施設種別を表すコード体系を識別するURI。http://terminology.hl7.org/CodeSystem/organization-type　固定値。"
* type.coding.code MS
* type.coding.code from OrganizationType (extensible)
* type.coding.code ^short = "施設種別コード"
* type.coding.code ^definition = "医療機関の場合、\"prov\" , \"dept\" を指定する。他の種別の場合には、http://terminology.hl7.org/CodeSystem/organization-type　に定義されているコードを指定する。"
* name 1.. MS
* name ^short = "医療機関の名称"
* name ^definition = "文書や画面どに印刷もしくは表示する際に用いられる医療機関名称"
* address 0..1 MS
* address ^short = "医療機関住所"
* address ^definition = "医療機関住所"
* address.text 1.. MS
* address.text ^short = "医療機関の住所"
* address.text ^definition = "都道府県名を含む住所の文字列。郵便番号を含めない。\r\n例）\"神奈川県横浜市港区１－２－３\""
* address.postalCode ^short = "郵便番号"
* address.postalCode ^definition = "郵便番号。３桁-４桁。\r\n例）　\"123-4567\""
// 診療科情報の場合、その診療科が所属している医療機関情報への参照を記述する。
* partOf 0.. MS
* partOf only Reference(JP_Organization) 
* partOf.reference 1.. MS 
* partOf.reference ^short = "この機関が所属する上位の機関の参照情報"
* partOf.reference ^definition = "Bundleリソースに格納される、上位医療機関を表すOrganizationリソースのfullUrl要素に指定されるUUIDを指定や、Containedリソースに格納される相対参照を使用する。"

