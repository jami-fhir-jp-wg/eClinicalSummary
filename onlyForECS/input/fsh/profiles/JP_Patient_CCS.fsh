// ==============================
//   Profile 定義
// ==============================
Profile: JP_Patient_CCS
Parent: JP_Patient
Id: jp-patient-ccs
Title: "FHIR臨床コア情報 Clinical-coreセットのひとつ。患者基本情報Patientリソースプロファイル"
Description: "FHIR臨床コア情報 Clinical-coreセットのひとつ。患者基本情報Patientリソースプロファイル　JP_Patientの派生プロファイル"
* ^url = "http://jpfhir.jp/fhir/eClinicalSummary/StructureDefinition/JP_Patient_CCS"
* ^status = #active
* ^date = "2023-01-23"

* meta.source  1..1 MS
* meta.source  ^short = "情報の出所"
* meta.source  ^definition = "情報の出所"
* meta.source  ^comment = "【SS-MIX2】\"http://jpfhir.jp/ssmix2std/<MSH-21-1>/医療機関識別OID番号\"【電子カルテ】適宜設定してよいが、最後のパートに医療機関番号11桁を設定すること。"

* meta.profile 1..1 MS
* meta.profile  ^short = "適用するFHIR プロファイルのURL.固定値:\"http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient_CCS\""
* meta.profile  ^definition = "適用するFHIR プロファイルのURL.固定値:\"http://jpfhir.jp/fhir/core/StructureDefinition/JP_Patient_CCS\""

* text 0..1 
* text.status ^short = "固定値:generated テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"
* text.status ^definition = "固定値:generated テキスト内容の全てがリソースのコンテンツから生成されたことを示す。"

* text.div ^short = "XHTML形式のテキスト表現"
* text.div ^definition = "本リソースの構造化情報から生成したテキスト表現をいれてもよい。XHTML形式。例:田中一郎、男、1980/7/1生、東京都中央区日本橋１－１－１, 03_1234_5678"

* extension[religion] 0.. MS
* extension[religion] ^short = "患者の宗教 【詳細参照】"
* extension[religion] ^definition = "患者の公言された宗教的所属。"
* extension[birthPlace] 0.. MS
* extension[birthPlace] ^definition = "患者の登録された出生地。システムは、birthPlaceアドレスを個別の要素に格納しない場合、address.textを使用してよい。"
* extension[race]  0.. MS
* extension[race] ^definition = "オプションの拡張要素-すべてのリソースで使用できる。"

* identifier 1.. MS
* identifier ^short = "患者番号の情報"
* identifier ^definition = "患者番号の情報"

* identifier.system 1.. MS
* identifier.system  ^short = "固定値:\"urn:oid:1.2.392.100495.20.3.51.医療機関識別OID番号\""
* identifier.system ^definition = "固定値:\"urn:oid:1.2.392.100495.20.3.51.医療機関識別OID番号\""
* identifier.system ^comment = "医療機関識別OID番号;患者IDの発行者である機関の医療機関コード（１０桁）の先頭に１をつけた11桁"
* identifier.system ^example.label = "General"
* identifier.system ^example.valueUri = "urn:oid:1.2.392.100495.20.3.51.10211234567"

* identifier.value 1.. MS
* identifier.value  ^short = "当該医療機関における患者ID。"
* identifier.value  ^definition = "【SS-MIX2】<PID-3-1> (患者ID)【電子カルテ】当該医療機関における患者ID。"
* identifier.value ^comment =  "英数字列とし、途中にはいる記号は原則として削除する。[SS-MIX2]
英数字 6 文字以上で設定する。なお、患者 ID が 6 桁未満で表現される可能性がある場合は、6 桁以上になるように設定する。原則として、先頭に０をつけたその医療機関の患者IDは全て同じ固定桁数となるようにすること。"
* identifier.value ^example.label = "General"
* identifier.value ^example.valueString = "0123456"

* name 1.. MS
* name ^short = "患者の氏名"
* name ^definition = "患者の氏名。漢字表記とカナ表記の別はname.extension.valueCode で表す。【SS-MIX2】PID-5[*]の情報。"
* name.extension 1..1 MS
* name.extension ^short = "氏名が漢字表記かカナ表記かを区別する拡張"
* name.extension ^definition = "氏名が漢字表記かカナ表記かを区別する拡張"
* name.extension.url 1..1 MS
* name.extension.url = "http://hl7.org/fhir/StructureDefinition/iso21090-EN-representation"
* name.extension.valueCode 1..1 MS 
* name.extension.valueCode ^short =  "漢字表記:\"IDE\"、カナ表記:\"SYL\"。"
* name.extension.valueCode ^definition =  "漢字表記:\"IDE\"、カナ表記:\"SYL\"。"
* name.extension.valueCode ^comment =  "【SS-MIX2】<PID-5[*]-8>='I'の場合、そのパートは漢字表記、 <PID-5[*]-8>='P'の場合、そのパートはカナ表記、"
* name.extension.valueCode ^example.label = "General"
* name.extension.valueCode ^example.valueCode = #IDE

* name.use 0..1 MS
* name.use ^short = "氏名の用途タイプ。通常は \"official\"を使用する（住民票や保険証と一致した名前）。"
* name.use ^definition = "氏名の用途タイプ。通常は \"official\"を使用する（住民票や保険証と一致した名前）。"
* name.use ^comment = "【SS-MIX2】<PID-5[*]-7>が法的氏名\"L\"の場合には\"official\" とする。【電子カルテ】通常は \"official\"。その他には、慣用名:\"usual\"、ニックネーム:\"nickname\"、匿名加工名:\"anonymous\"、旧姓:\"maiden\"、などが使用できる。http://hl7.org/fhir/R4/valueset-name-use.html を参照"
* name.use  ^example.label = "General"
* name.use  ^example.valueCode = #official

* name.text 1..1 MS
* name.text ^short = "氏名全体のテキスト表記"
* name.text ^definition = "氏名全体のテキスト表記。通常は姓と名を全角空白1つでつなげた文字列。"
* name.text  ^example.label = "General"
* name.text  ^example.valueString = "田中　一郎"

* name.family 1..1 MS
* name.family ^short = "氏名の姓の部分"
* name.family ^definition = "氏名の姓の部分。"
* name.family ^comment = "【SS-MIX2】 <PID-5[*]-1>"
* name.family  ^example.label = "General"
* name.family  ^example.valueString = "田中"

* name.given 1..1 MS
* name.given ^short = "氏名の名の部分"
* name.given ^definition = "氏名の名の部分。"
* name.given ^comment = "【SS-MIX2】 <PID-5[*]-2>"
* name.given  ^example.label = "General"
* name.given  ^example.valueString = "一郎"

* telecom 0.. MS
* telecom ^short = "患者の連絡先情報（通常、電話）"
* telecom ^definition = "患者の連絡先情報で、通常は医療機関の診療申込時などに申告された情報。固定電話番号、携帯電話番号、電子メールアドレス、など。"

* telecom.system 0..1 MS
* telecom.system ^short = "患者の連絡先のタイプコード"
* telecom.system ^definition = "患者の連絡先のタイプコード。phone、fax、email、pager、url、sms、otherが使用可能。"
* telecom.system ^comment = "【SS-MIX2】<PID-13or14-3> PH:電話の場合、phoneを設定。【JP Core仕様】患者の連絡先の種別をValueSet(ContactPointSystem)より選択する。  
- phone : 電話
- fax : Fax 
- email : 電子メール
- pager : ポケットベル
- url : 電話、ファックス、ポケットベル、または電子メールアドレスではなく、URLとして表される連絡先: これはWebサイト、ブログ、Skype、Twitter、Facebookなどのさまざまな機関または個人の連絡先を対象としている。電子メールアドレスには使用しないこと。
- sms : SMSメッセージの送信に使用できる連絡先（携帯電話、一部の固定電話など）  
- other : 電話、Fax、ポケットベル、または電子メールアドレスではなく、URLとして表現できない連絡先. 例：内部メールアドレス。これは、URLとして表現できる連絡先（Skype、Twitter、Facebookなど）には使用しないこと。"

* telecom.system  ^example.label = "General"
* telecom.system  ^example.valueCode = #phone

* telecom.value 1..1 MS
* telecom.value ^short = "患者の連絡先の文字列"
* telecom.value ^definition = "患者の連絡先の文字列。\"054-211-9999\"など。"
* telecom.value ^comment = "【SS-MIX2】「054-211-9999」のような非定型形式の電話番号の場合、<PID-13or14-12>の文字列に相当。"
* telecom.value  ^example.label = "General"
* telecom.value  ^example.valueString = "054-211-9999"

* telecom.use 0..1 MS
* telecom.use ^short = "患者の連絡先の用途タイプ"
* telecom.use ^definition = "患者の連絡先の用途タイプ。home、work、temp、old、mobile が使用可能。"
* telecom.use ^comment = "【SS-MIX2】<PID-13-2> PRN:主たる住居の番号、の場合\"home\"。<PID-14-2>WPN:勤務先の番号、の場合\"work\"。【電子カルテ】携帯電話であることが明白な場合には、\"mobile\"。としてもよい。"
* telecom.use  ^example.label = "General"
* telecom.use  ^example.valueCode = #home

* gender 1..1 MS
* gender ^short = "患者の性別"
* gender ^definition = "患者の性別。male、female、other、unknownが使用可能。"
* gender ^comment = "【SS-MIX2】<PID-8> F->\"female\", M->\"male\", U->\"unknown\", O->\"other\"。"
* gender  ^example.label = "General"
* gender  ^example.valueCode = #female

* birthDate 1.. MS
* birthDate ^short = "患者の生年月日。YYYY-MM-DD形式"
* birthDate ^definition = "患者の生年月日。YYYY-MM-DD形式"
* birthDate ^comment = "【SS-MIX2】<PID-7> (YYYYMMDD形式)を、YYYY-MM-DD形式に変換。"
* birthDate  ^example.label = "General"
* birthDate  ^example.valueDate = "1960-12-03"

* address 0..1 MS
* address ^short = "患者の住所情報"
* address ^definition = "患者の住所情報"
* address ^comment = "【SS-MIX2】<PID-11>に対応"

* address.text 1.. MS
* address.text ^short = "患者の住所の文字列部分で、郵便番号部分を除く。"
* address.text ^definition = "患者の住所の文字列部分で、郵便番号部分を除く。"
* address.text ^comment = "SS-MIX2】<PID-11-8>地理的な表示"
* address.text  ^example.label = "General"
* address.text  ^example.valueString = "東京都文京区本郷7-3-1"

* address.use 0..1 MS
* address.use  ^short = "住所の用途コード　home、work、temp、old、billing"
* address.use  ^definition = "住所の用途コード　home、work、temp、old、billing"
* address.use  ^comment = "【SS-MIX2】<PID-11-7>住所タイプコード H:自宅-> \"home\""
* address.use   ^example.label = "General"
* address.use   ^example.valueCode = #home

* address.line 0..1 MS
* address.line ^short = "ストリート名や番地など"
* address.line ^definition = "このコンポーネントには、家番号、アパート番号、通りの名前、通りの方向、P.O。が含まれる。ボックス番号、配達のヒント、および同様の住所情報など。"
* address.line ^comment = "【SS-MIX2】<PID-11-1> 通りの住所。および<PID-11-2>その他の住所表示（住所の２行目）【JP Core仕様】state要素とcity要素で表現しなかったそのあとの住所部分を番地以降の部分も含めてすべていれる。  
英数字は半角でも全角でもよい。文字列の前後および途中に空白文字を含めないこと。  
繰り返し要素が許されているので、区切りを表現したい場合には、複数要素に分けて格納してもよい。"
* address.line ^example.label = "General"
* address.line ^example.valueString = "本郷7-3-1"

* address.city 0..1 MS
* address.city ^short = "市区町村名 【詳細参照】"
* address.city ^definition = "市、町、郊外、村、その他のコミュニティまたは配達センターの名前。"
* address.city ^comment = "【SS-MIX2】<PID-11-3> （住所の）市。【JP Core仕様】郡市区町村部分だけを「郡」「市」「区」「町」「村」などの文字を含めて設定する。 例：文京区"
* address.city ^example.label = "General"
* address.city ^example.valueString = "文京区"

* address.district ..0 MS

* address.state 0..1 MS
* address.state ^short = "国の直下レベルの地区単位で、都道府県名に相当"
* address.state ^definition = "都道府県名。「都」「道」「府」「県」のそれぞれの文字を含める。 例：東京都"
* address.state ^comment = "【SS-MIX2】<PID-11-4>州または省、都道府県"
* address.state ^example.label = "General"
* address.state ^example.valueString = "東京都"

* address.postalCode 1.. MS
* address.postalCode  ^short = "郵便番号"
* address.postalCode  ^definition = "郵便番号。日本の郵便番号の場合には3桁数字とハイフン1文字と4桁数字からなる半角８文字、または最初の3桁だけの3文字のいずれかとする。"
* address.postalCode  ^comment = "【SS-MIX2】<PID-11-5>郵便番号"
* address.postalCode ^example.label = "General"
* address.postalCode ^example.valueString = "113-0047"

* address.country 0.. MS
* address.country ^short = "国名またはISO 3166コード"
* address.country ^definition = "一般的に理解されている、または一般的に受け入れられている国の国名かISO 3166コード。"
* address.country ^comment = "【SS-MIX2】<PID-11-6>国コード"
* address.country ^example.label = "General"
* address.country ^example.valueString = "jp"

* communication 0..1 MS
* communication.language MS