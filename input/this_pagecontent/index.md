<style type="text/css">

table {
  border: solid 1px black;
  border-collapse: collapse;
}
 
table td {
  border: solid 1px black;

}

table th {
  border: solid 1px black;
}
   h1 {
      counter-reset: chapter;
    }

    h2 {
      counter-reset: sub-chapter;
    }

    h3 {
      counter-reset: section;
    }

    h4 {
      counter-reset: sub-section;
    }

    h5 {
      counter-reset: composite;
    }

    h6 {
      counter-reset: sub-composite;
    }

    h1:before {
      color: black;
      counter-increment: bchapter;
      content:  " ";
    }

    h2:before {
      color: black;
      counter-increment: chapter;
      content: counter(chapter) ". ";
    }

    h3:before {
      color: black;
      counter-increment: sub-chapter;
      content: counter(chapter) "."counter(sub-chapter) ". ";
    }


    h4:before {
      color: black;
      counter-increment: section;
      content: counter(chapter) "."counter(sub-chapter) "."counter(section) " ";
    }

    h5:before {
      color: black;
      counter-increment: sub-section;
      content: counter(chapter) "."counter(sub-chapter) "."counter(section) "."counter(sub-section) " ";
    }

    h6:before {
      color: black;
      counter-increment: sub-sub-section;
      content: "　　"counter(sub-sub-section) "）";
    }

</style>


# clinical-core
# 名称：FHIR臨床コア情報取得基本仕様（仮称）
## 目的：
厚労省が掲げる臨床コア6情報（傷病名、アレルギー情報、感染症情報、薬剤禁忌情報、検査情報（救急時に有用な検査、 生活習慣病関連の検査） 、処方情報）および患者基本情報、外来受診情報、入退院歴情報、注射点滴情報について、FHIR　REST-API仕様にもとづき、医療機関に設置されるFHIR対応システムに対して、①対応するFHIRリソースの要求仕様、②要求に対するFHIRリソースによる応答仕様、③前項の応答内容と同じ内容のFHIRで送信されるデータ仕様、のそれぞれで最低限満たすべき必須要件を定めた仕様を策定し、その実装ガイドを作成する。
 
## コアリソースの範囲：
### 臨床コア6情報（いわゆる６情報）
  - 傷病名	Conditionリソース
  - アレルギー情報	AllergyIntoleranceリソース
  - 感染症情報	Observationリソース
  - 薬剤禁忌情報	AllergyIntoleranceリソース
  - 検査情報（救急時に有用な検査、 生活習慣病関連の検査） 	Observationリソース
  - 処方情報	MedicationRequestリソース

### 追加情報
	- 患者基本情報	Patient
	- 外来受診歴情報	Encounter
	- 入退院歴情報	Encounter
	- 注射点滴情報	MedicationResuest

## 基本方針：
1. 各リソースの仕様はJP-Core V1.1に準拠する。必要な場合には、制約を緩める方向の仕様修正をJP-Coreに依頼する。
1. 対応する各リソースのエレメント仕様について、①SS-MIX2標準化ストレージの仕様における対応メッセージの必須項目のデータが確実に格納でき、かつ②同ストレージで任意となっている項目のデータが必須エレメントとならないように、JP-Core V1.1に必要な制約と説明を追加する。ただし、HL7メッセージ管理目的の項目やSS-MIX2標準化ストレージ管理目的の項目はこの限りではない。
1. 外部からのFHIR REST API仕様にもとづく要求に対して結果を応答する方式（Pull型）を基本とし、応答をファイル仕様にして外部になんらかのトリガーにより送信（Push型）する場合のファイル仕様を策定する。Push型では送信手順等は策定しない。
1. Pull型における１回の要求応答では、患者IDを1つだけ指定して一人の患者にもとづく情報のやりとりだけを行うものとする。
1. Pull型における要求は対応する特定のリソースを指定し、情報の絞り込み（特定）は、FHIR仕様にもとづいたパラメータ指定の組み合わせのみにより行う。
1. Pull型における応答およびPush型のがいる仕様では対応するリソースの1インスタンス以上の集合をBundleリソースでFHIR仕様にもとづいた形式で返すものとする。
1. 認証の取り決めは本仕様のスコープ外とする。
1. 実装ガイド（IG）を作成し、名称をClinical-Core IGとする。

## 詳細仕様
### 共通仕様
####　他のリソースの参照記述
リソースを参照する（Reference(JP_Patient) など）要素では、Reference.reference要素に当該施設でそのリソースのidentifierによって取得可能な
##### Patientリソース
 - AllergyIntolerance.patient 	Reference(JP Core Patient Profile) 
	.reference  当該施設の患者番号など


### FHIRリソース要求仕様
＜エクセルも参照＞

# SS-MIX2標準化ストレージ-マッピングガイドラインon Clinical-Core IG 
## 目的：
SS-MIX2標準化ストレージのデータ項目を確実にClinical-Core IG の対応リソースへ対応づけて変換するためにルールを作成し、ガイドラインとして公表する。
SS-MIX2標準化ストレージからFHIRリソースデータを作成する際に、実装者はこれに準拠することを期待するものとする。

# 参考
https://build.fhir.org/ig/HL7/v2-to-fhir/mappings.html
![image](https://user-images.githubusercontent.com/57020949/207955925-7ccbeb8b-5514-456a-a757-03ff5df12aac.png)