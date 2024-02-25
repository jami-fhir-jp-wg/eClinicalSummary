
Profile: JP_Encounter_eCS
Parent: JP_Encounter
Id: JP-Encounter-eCS
Title: "eCS:JP_Encounter-eCS"
Description: "eCS 診療情報・サマリー汎用 Encounterリソース（受診時・入院時等のEncounter情報）プロファイル"

* ^url = "http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Encounter_eCS"
* ^status = #active
* ^date = "2024-02-25"
* . ^short = ""
* . ^definition = "診療情報提供では、紹介理由を記述する受診時情報. 診療サマリーではサマリー対象となる受診や入院に関する受診時または入院時情報。診療６情報において埋め込みリソースとして記述する場合にも適用できる。"

* meta 1..1 MS
* meta.versionId ^short = "バージョン固有の識別子"
* meta.versionId  ^definition = "バージョン固有の識別子"
* meta.lastUpdated 1..1 MS
  * insert relative_short_definition("このリソースのデータが最後に作成、更新、複写された日時。最終更新日時。YYYY-MM-DDThh:mm:ss.sss+zz:zz　例:2015-02-07T13:28:17.239+09:00")
  * ^comment = "この要素は、このリソースのデータを取り込んで蓄積していたシステムが、このリソースになんらかの変更があった可能性があった日時を取得し、このデータを再取り込みする必要性の判断をするために使われる。本要素に前回取り込んだ時点より後の日時が設定されている場合には、なんらかの変更があった可能性がある（変更がない場合もある）ものとして判断される。したがって、内容になんらかの変更があった場合、またはこのリソースのデータが初めて作成された場合には、その時点以降の日時（たとえば、このリソースのデータを作成した日時）を設定しなければならない。内容の変更がない場合でも、このリソースのデータが作り直された場合や単に複写された場合にその日時を設定しなおしてもよい。ただし、内容に変更がないのであれば、日時を変更しなくてもよい。また、この要素の変更とmeta.versionIdの変更とは、必ずしも連動しないことがある。"
* meta.profile 0.. MS
  * insert relative_short_definition("準拠しているプロファイルを受信側に通知したい場合には、本文書のプロファイルを識別するURLを指定する。http://jpfhir.jp/fhir/eCS/StructureDefinition/JP_Encounter_eCS　を設定する。電子カルテ情報共有サービスに本リソースデータを送信する場合には、別に定義されるURLを設定すること。")

* identifier 0..1 MS
* identifier ^short = "この医療機関における患者の受診番号、入院管理番号"
* identifier ^definition = "この医療機関における患者の受診番号、入院管理番号"

* identifier.value 1..1 MS
  * insert relative_short_definition("「リソース一意識別ID」の文字列。URI形式を使う場合には、urn:ietf:rfc:3986に準拠すること。")

* status = #finished (exactly)
* status ^definition = "finished の固定値を設定する。"

* status 1..1 MS

* class ^short = "受診イベントの分類"
* class ^definition = "受診イベントの分類。外来（外来）、入院、救急、在宅医療、その他の地域差による患者Encouterの分類を表す概念。"
* class 1..1 MS
* class.system 1..1 MS
* class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode" (exactly)
* class.system ^definition = "コード体系v3.ActEncounterCodeを識別するURI。固定値。"
* class.code 1..1 MS
* class.code from http://terminology.hl7.org/ValueSet/v3-ActEncounterCode (extensible)
* class.code ^definition = "AMB:外来　EMER:救急　HH:在宅ケア    IMP:入院または入院中    ACUTE: 入院中臨時     NONAC:入院中定時   PRENC:予定入院時    VR:リモート診療"
* class.display ^definition = "AMB:外来　EMER:救急　HH:在宅ケア    IMP:入院または入院中    ACUTE: 入院中臨時     NONAC:入院中定時   PRENC:予定入院時    VR:リモート診療"
* class.display 1..1 MS

* classHistory ..1 MS
* classHistory ^short = "外来受診履歴や入院履歴の繰り返し記述。"
* classHistory ^definition = "この入院期間までの外来受診履歴や入院履歴を記述したい場合にここに繰り返しで記述する。紹介先受診情報では不要。"
* classHistory.class 1..1 MS
* classHistory.class.system 1..1 MS
* classHistory.class.system = "http://terminology.hl7.org/CodeSystem/v3-ActCode" (exactly)
* classHistory.class.code 1..1 MS
* classHistory.class.display 1..1 MS
* classHistory.period 1..1 MS
* classHistory.period ^short = "入院期間を表す必要がある場合には必須。外来では必要な場合を除き省略可。"
* classHistory.period ^definition = "入院期間を表す必要がある場合には必須。外来では必要な場合を除き省略可。"
* classHistory.period.start 1..1 MS
* classHistory.period.end 0..1 MS

* period 0..1 MS
* period ^short = "入院期間。退院時サマリーでは必須。外来では必要な場合を除き省略可。"
* period ^definition = "入院期間。退院時サマリーでは必須。外来では必要な場合を除き省略可。"
* period.start 1..1 MS
* period.end 0..1 MS
* length 0..1 MS
* length ^short = "この入院の在院日数"
* length ^definition = "この入院の在院日数"
* length.value 1..1 MS
* length.unit 1..1 MS
* length.unit = "日" (exactly)
* length.unit ^definition = "日"
* length.system 1..1 MS
* length.system = "http://unitsofmeasure.org" (exactly)
* length.code 1..1 MS
* length.code = #d (exactly)
* length.code ^definition = "日"

* reasonCode 0..* MS
* reasonCode ^short = "入院時主訴・入院理由。紹介する理由（主訴・目的）"
* reasonCode ^definition = "コードで記述できる場合にそのコード記述。system値はMEDIS標準病名マスター病名交換用コードを使用できる。text要素にフリーテキストで記述してもよい。"
* reasonCode.coding 0..* MS
* reasonCode.coding.system 1..1 MS
* reasonCode.coding.code 1..1 MS
* reasonCode.text MS

* diagnosis 0..* MS
* diagnosis ^short = "入院期間中の診断情報。診療情報提供書では不要。"
* diagnosis ^definition = "入院期間中の診断情報。診療情報提供書では不要。"
* diagnosis.condition 1..1 MS   
* diagnosis.condition ^short = "患者状態（病態・疾患名・症状）への参照"
* diagnosis.condition ^definition = "患者状態（病態・疾患名・症状）への参照"
* diagnosis.condition only Reference(JP_Condition)
* diagnosis.use 0..1 MS
* diagnosis.use ^short = "診断の位置付け区分"
* diagnosis.use ^definition = "診断の位置付け区分（DiagnosisRole）。これにより、入院時診断、退院時診断、などが区別される。入院中のすべての診断病名にこのコードが必須ではないが、少なくともAD:入院時診断、DD:退院時診断、CC:主訴、についてはそれぞれ1個以上はこのコードがついている必要がある。AD:入院時診断　DD:退院時診断　FU:フォローアップ時診断 "
* diagnosis.use.coding 1..1 MS
* diagnosis.use.coding.system 1..1 MS
* diagnosis.use.coding.system = "http://terminology.hl7.org/CodeSystem/diagnosis-role" (exactly)
* diagnosis.use.coding.code 1..1 MS  // AD:入院時診断、DD:退院時診断、CC:主訴
* diagnosis.use.coding.display 1..1 MS  // AD:入院時診断、DD:退院時診断、CC:主訴
* diagnosis.rank 0..1 MS
* diagnosis.rank ^short = "診断の優先順位"
* diagnosis.rank ^definition = "診断の優先順位。入院時診断、退院時診断、主訴、などの優先順位を表す。"

* hospitalization   0..1 MS //  診療情報提供書では不要。
* hospitalization ^short = "入退院の詳細状況。診療情報提供書では不要。"
* hospitalization ^definition = "入退院の詳細状況。診療情報提供書では不要。"
* hospitalization.origin 0..1 MS
* hospitalization.origin ^short = "入院前の所在場所または施設への参照。"
* hospitalization.origin ^definition = "入院前の所在場所または施設への参照。"
* hospitalization.origin only Reference(JP_Location or JP_Organization)
* hospitalization.admitSource 0..1 MS
* hospitalization.admitSource from  $JP_admit_Source_VS (preferred)
* hospitalization.admitSource ^short = "入院経路を表すコード情報"
* hospitalization.admitSource ^definition = "入院経路を表すコード情報"
* hospitalization.admitSource.coding 1.. MS
* hospitalization.admitSource.coding.system 1..1 MS
* hospitalization.admitSource.coding.code 1..1 MS
* hospitalization.destination   0..1 MS
* hospitalization.destination ^short = "退院後の所在場所または施設への参照。"
* hospitalization.destination ^definition = "退院後の所在場所または施設への参照。"
* hospitalization.destination only Reference(JP_Location or JP_Organization)
* hospitalization.dischargeDisposition 1..1 MS
* hospitalization.dischargeDisposition ^short = "退院時転帰コード情報"
* hospitalization.dischargeDisposition ^definition = "退院時転帰コード情報"
* hospitalization.dischargeDisposition.coding 1..1 MS
* hospitalization.dischargeDisposition.coding.system 1..1 MS
* hospitalization.dischargeDisposition.coding.system = $JP_dischargeDisposition_CS 
* hospitalization.dischargeDisposition.coding.code 1..1 MS  
* hospitalization.dischargeDisposition.coding.display 0..1 MS

* location 0..* MS
* location ^short = "入院中の所在場所（病棟病室など）。診療情報提供書では不要。"
* location ^definition = "入院中の所在場所（病棟病室など）。診療情報提供書では不要。"
* location.location 1..1 MS
* location.location ^short = "入院中の所在場所（病棟病室など）への参照。"
* location.location ^definition = "入院中の所在場所（病棟病室など）への参照。"
* location.location only Reference(JP_Location)
* location.status 1..1 MS   
* location.status = #completed
* location.physicalType 0..1 MS
* location.physicalType ^short = "入院中の所在場所（病棟病室など）の種別"
* location.physicalType ^definition = "所在場所のタイプ。bu: 建物wa: 病棟ro: 病室bd: ベッドarea: エリアなど。"
* location.physicalType.coding 1..1 MS
* location.physicalType.coding.system 1..1 MS
* location.physicalType.coding.system = "http://terminology.hl7.org/CodeSystem/location-physical-type" (exactly)
* location.physicalType.coding.code 1..1 MS
* location.physicalType.coding.display 0..1 MS
* location.period 1..1 MS
* location.period ^short = "所在期間"
* location.period ^definition = "所在期間"
* location.period.start 1..1 MS
* location.period.end 0..1 MS

