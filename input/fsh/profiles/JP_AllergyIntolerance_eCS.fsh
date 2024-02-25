// ==================================================
//   Profile 定義 診療情報・サマリー汎用
//   このプロファイルは、電子カルテ情報共有サービスに送信するためのプロファイルではない。
//   電子カルテ情報共有サービスに送信する場合には、このプロファイルから派生した別の専用プロファイルを用いること。
//   アレルギー情報／薬剤禁忌 リソースタイプ:AllergyIntolerance
//   親プロファイル:JP_AllergyIntolerance
// ==================================================
Profile:        JP_AllergyIntolerance_eCS
Parent:			JP_AllergyIntolerance
Id:             JP-AllergyIntolerance-eCS
Title:  "eCS:JP_AllergyIntolerance_eCS"
Description: "eCS 診療情報・サマリー汎用 AllergyIntoleranceリソース（アレルギー情報／薬剤禁忌）プロファイル"

* extension contains JP_eCS_InstitutionNumber named eCS_InstitutionNumber ..1 MS
* extension contains JP_eCS_Department named eCS_Department ..*

* ^url = $JP_AllergyIntolerance_eCS
* ^status = #active
* ^date = "2024-02-25"
* insert toplevel_short_definition("診療情報におけるアレルギー情報／薬剤禁忌の格納に使用する")
* . ^comment = "薬剤禁忌情報かアレルギー情報かの区別はcategory要素がmedicationかそれ以外かによる。なお、このプロファイルは、電子カルテ情報共有サービスに送信するために適合したプロファイルではない。電子カルテ情報共有サービスに送信する場合には、このプロファイルから派生した別の専用プロファイルを用いること。"

* meta 1..1 MS
* meta.versionId ^short = "バージョン固有の識別子"
* meta.versionId  ^definition = "バージョン固有の識別子"
* meta.lastUpdated 1..1 MS
  * insert relative_short_definition("このリソースのデータが最後に作成、更新、複写された日時。最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz　例:2015-02-07T13:28:17.239+09:00")
  * ^comment = "この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。本要素に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。"

* meta.profile 0.. MS
  * insert relative_short_definition("準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_AllergyIntolerance_eCS　を設定する。電子カルテ情報共有サービスに本リソースデータを送信する場合には、別に定義されるURLを設定すること。")

* meta.tag 0..
  * insert relative_short_definition("電子カルテ情報共有サービスでは、長期保存フラグの設定する場合に使用する。詳細はJP_AllergyIntolerance_CLINS_eCSを参照のこと。")

// encounter、recorder、は最低限の情報をContainedリソースとして記述する
* contained ^slicing.discriminator.type = #profile
* contained ^slicing.discriminator.path = "$this"
* contained ^slicing.rules = #open
* contained contains
    encounter 0..1 MS
    and recorder 0..1 MS
//    and patient 0..1 MS

* contained[encounter] only  JP_Encounter
  * insert relative_short_definition("アレルギー／薬剤禁忌情報を記述（取得）したときの入院外来受診情報をコンパクトに格納したEncounterリソース")
  * ^comment = "encounter要素から参照される場合には、そのJP_Encounterリソースの実体。JP_Encounterリソースにおける必要最小限の要素だけが含まれればよい。ここで埋め込まれるJP_Encounterリソースでは、Encounter.classにこの情報を記録したときの受診情報（入外区分など）を記述して使用する。"

* contained[recorder] only  JP_Practitioner
  * insert relative_short_definition("アレルギー／薬剤禁忌情報を記述（取得）した医療者情報をコンパクトに格納したPractitionerリソース")
  * ^comment = "recorder要素から参照される場合には、そのJP_Practitionerリソースの実体。JP_Practitionerリソースにおける必要最小限の要素だけが含まれればよい。"

/*
* contained[patient] only  JP_Patient
  * insert relative_short_definition("傷病名情報の対象者である患者情報を格納したPatientリソース。Bundleリソースのentryで記述してもよいが、ここにContainedリソースとして内包し、patient要素から参照する形式をとってもよい。")
  * ^comment = "patient要素から参照される場合には、そのJP_Patient(JP_Patient_eCSでもよい)リソースの実体。"
*/


* extension[eCS_InstitutionNumber] 0..1 MS
  * insert relative_short_definition("本情報を作成発行した医療機関の識別番号を記述するために使用する拡張「eCS_InstitutionNumber」。
本情報は、ServiceRequestの要素として記述することも可能であるが、その場合もこの拡張で記述することとする。")
  * ^comment = "電子カルテ情報サービスでは、この拡張による記述は必須。医療機関１０桁番号を示すsystem値は\"http://jpfhir.jp/fhir/core/IdSystem/insurance-medical-institution-no\"を使用する。"

* extension[eCS_Department] 0..1 MS
  * insert relative_short_definition("本情報を作成発行した診療科または作成発行者の診療科情報を記述するために使用する拡張「eCS_Department」")
  * ^comment = "コード化する場合には、JAMI(SS-MIX2) 診療科コード表のsystem値\"http://jami.jp/SS-MIX2/CodeSystem/ClinicalDepartment\"を使用する。診療科を記述する場合には、そのコード化の有無に関わらずtext要素による記述は必須。"

* identifier 1..* MS
  * insert relative_short_definition("このリソース情報の識別ID。")
  * ^comment = "リソース一意識別IDの仕様は、「診療情報・サマリー汎用リソース一意識別ID仕様」を参照のこと。"

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open

* identifier contains resourceIdentifier 1..1 MS
* identifier[resourceIdentifier].system = $JP_ResourceInstanceIdentifier
* identifier[resourceIdentifier].system ^comment = "リソース一意識別IDのsystem値は\"http://jpfhir.jp/fhir/core/IdSystem/resourceInstance-identifier\"　を設定する。"
* identifier[resourceIdentifier].value 1..1 MS
  * insert relative_short_definition("「リソース一意識別ID」の文字列。URI形式を使う場合には、urn:ietf:rfc:3986に準拠すること。")


* clinicalStatus   0..1 MS
* clinicalStatus   ^short = "臨床的状態のステータス。"
* clinicalStatus   ^definition = "臨床的状態のステータス。コードで記述は必須。ただし、verificationStatus要素が'entered-in-error'であれば、本要素は存在してはならない。それ以外では必須。"
* clinicalStatus   ^comment = "active | inactive | resolved のいすれか（現存、非現存、解消）system=http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"
* clinicalStatus.coding 1..* MS
* clinicalStatus.text 0..1 MS
  * insert relative_short_definition("コードだけでは記述できない情報がある場合にコードと併用してもよい。値が使用されない可能性はある。")

* verificationStatus    0..1 MS
* verificationStatus    ^short = "入力された臨床的状態に対する検証状況を示す。確からしさと考えられる。記述する場合にはコード化記述が必須。clinicalStatusとの制約条件を参照のこと。"
* verificationStatus    ^definition = "unconfirmed | confirmed | refuted | entered-in-error  のいずれか（未確認、確認ずみ、否定、エラー）　system=http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"
* verificationStatus.coding 1..* MS
* verificationStatus.text 0..1 MS
  * insert relative_short_definition("コードだけでは記述できない情報がある場合にはtext記述を併用してもよい。")

* type 0..1 
* type ^short = "副反応の生理的なメカニズムの種類（アレルギーによるものか不耐性によるものかどうか）"
* type ^definition = "記述する場合は、コード表：\"http://hl7.org/fhir/allergy-intolerance-type\" から　allergy | intolerance のいずれか（アレルギー反応、不耐性反応）。"
* type ^comment = "メカニズムの種類を正確に決めることは難しいので、この情報はあくまで情報登録側の判断に依存する。"

* category 0.. MS
* category ^short = "特定された原因物質のカテゴリ。記述を可能な限り推奨する。"
* category ^definition = "コード表：\"http://hl7.org/fhir/allergy-intolerance-category\" から　food | medication | environment | biologic　のいずれか　（食物、医薬品、環境、生物学的）を選択する。電子カルテシステムで、これらのカテゴリーが区別されて登録されている場合には可能な限りコードを設定すること。電子カルテ情報サービスでは、薬剤禁忌情報として本リソース種別を使用する場合には、必ず本要素は\"medication\"として存在しなければならず、criticality要素は\"high\"を設定しなければならない。これ以外の場合には、本リソースの情報は薬剤禁忌以外のアレルギー情報として取り扱われる。"


* criticality 0..1 MS
* criticality ^short = "潜在的な臨床的危険性、致命度"
* criticality ^definition = "記述する場合は、コード表：\"http://hl7.org/fhir/allergy-intolerance-criticality\" から　low | high | unable-to-assess　のいずれか（低、高、評価不能）。電子カルテ情報サービスでは、薬剤禁忌情報として本リソース種別を使用する場合には、category要素の記述を参照すること。"


* code  1..1 MS
* code ^short = "アレルギー・不耐反応の対象物の情報。アレルギー・不耐反応の対象物の情報。薬剤禁忌情報の場合には、医薬品情報のコード。"
* code  ^definition = "JP-Coreで定めるallergy-substanceコード表のコードを使用を推奨する。コード化できない場合には、code.text のみで記述する。コード化の有無にかかわらず、電子カルテシステム等で登録され表示されている文字列をcode.textに必ず設定すること。"
* code  ^comment = "推奨するコード表はJFAGYコード（コード化する場合）：system値は、category要素の値に対応して、http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyFoodAllergen_CS、http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyNonFoodNonMedicationAllergen_CS、http://jpfhir.jp/fhir/core/CodeSystem/JP_JfagyMedicationAllergen_CS の3つのいずれかから選択する。\n 電子カルテ情報サービスでは、コード化する場合にはJFAGYコード表を使用することが必須。\nアレルギー情報はコードにより正確に表現することが困難であることが多いので、コード化の有無にかかわらず、必ず電子カルテシステム等で登録され表示されている文字列をcode.textに必ず設定すること。"

* code.coding 0..* MS
* code.coding from http://jpfhir.jp/fhir/core/ValueSet/JP_AllergyIntolerance_VS
* code.text 1..1 MS
* code.text ^short = "コード化の有無にかかわらず、電子カルテシステム等で登録され表示されている文字列をcode.textに必ず設定すること。"

* patient 1..1   MS
* patient only  Reference(JP_Patient)
  * insert relative_short_definition("このアレルギー不耐症を有する患者のFHIRリソース\(JP_Patient\)への参照。電子カルテ情報サービスでは、\(JP_Patient_CLINS_eCS\)への参照とする。")
  * ^comment = "記述方法は、「診療情報・サマリー汎用リソース外部参照仕様」を参照のこと。"

* encounter 0..1 MS
* encounter only  Reference(JP_Encounter)
  * insert relative_short_definition("このアレルギ情報を記録したときの受診情報（入外区分など）を記述しているEncounterリソースへの参照")
  * ^comment = "記述方法は、「診療情報・サマリー汎用リソース外部参照仕様」を参照のこと。"

* onset[x]  ^short = "登録日またはこの状態の存在が開始した日"
* onset[x]  ^definition = "電子カルテ情報サービスで記述する場合には、onsetDateTime要素を使用する。"

* recordedDate 0..1 MS
* recordedDate ^short = "この情報が記録された登録日"
* recordedDate ^definition = "この情報が記録された登録日"

* recorder 0.. MS
* recorder only Reference(JP_Practitioner)
  * insert relative_short_definition("アレルギー登録者の情報を記述しているJP_Practitionerリソースへの参照")
  * ^comment = "記述方法は、「診療情報・サマリー汎用リソース外部参照仕様」を参照のこと。"

* asserter 0..1 MS
* asserter only Reference(JP_Patient or JP_Practitioner or RelatedPerson)
  * insert relative_short_definition("この状態があると確認（主張）した人の情報を記述しているJP_Patient、JP_Practitioner、RelatedPersonのいずれかのリソースへの参照。")
  * ^comment = "記述方法は、「診療情報・サマリー汎用リソース外部参照仕様」を参照のこと。"

* lastOccurrence  0..1 
  * insert relative_short_definition("最後（直近）に知られている発生日時")
* note  0..
  * insert relative_short_definition("状態に関する追加的な情報で他の要素で記述できないような情報")
  * authorString 0..
    * insert relative_short_definition("記載者氏名などの文字列。必ずしも氏名でなくてもよい。")
  * time 0..1
    * insert relative_short_definition("この追加的な情報が作成された日時")
  * text 1..1
    * insert relative_short_definition("追加的な情報の内容。markdown形式のテキストが使用できる。データとして1Mバイト以内であること。")

* reaction 0..
  * insert relative_short_definition("対象物質に暴露したことに関連して派生した有害反応の履歴事実に関する情報。複数記述できる。")

