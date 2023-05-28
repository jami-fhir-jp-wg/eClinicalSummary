
//-------------------------------
//--- Profile for conatained resource within other resources
//-------------------------------

Profile: JP_ServiceRequest_eCS_Contained
Parent: JP_ServiceRequest
Id: JP-ServiceRequest-eCS-Contained
Description: "診療情報コアサマリー埋め込み用 ServiceRequestリソース(オーダ依頼)プロファイル　　（JP_ServiceRequest_eClinicalSummaryの派生プロファイル）"
* ^url = $JP_ServiceRequest_eCS_Contained
* ^status = #active
* ^date = "2023-03-31"
* . ^short = "診療情報コアサマリーにおける検体検査結果の格納に使用する"
* . ^definition = "診療情報コアサマリー・厚労省6情報などにおける検体検査結果の格納に使用する"

* . ^comment = "Contaiedリソースであるため、これ自身はContainedリソースを持てない。この依頼情報が発行された医療機関への参照や診療科の参照、依頼者への参照を記述する場合には、それらの参照先リソースは、このContaiedリソースを包含する親リソースのContaiedリソースに記述し、そのidを参照すること。"

* id 1..1
* meta.profile = $JP_ServiceRequest_eCS_Contained
* implicitRules ..0
* text ..0
* contained ..0

* identifier 1..1
* identifier ^short = "当該依頼に対して、施設内で割り振られる一意の識別子"
* identifier ^definition = "この依頼に割り当てられた一意の識別子で64バイト以内。リソースの識別子やシステム的なシーケンスではなく、当該施設内で割り振られる一意の識別キー。"
* identifier ^comment = "当該施設内で割り振られる一意の識別子があればそれを使用する。すくなくともひとつのidentifierは、当該施設で作成された全診療データのなかからこの依頼を一意に識別でき、削除や更新が可能な論理キーとなる。それ以外に追加で当該施設または別の施設が別のsystem値との組み合わせによる異なるidentifierを1個以上設定してもよい。ひとつの同一の依頼に含まれる個々の依頼項目（検査項目や処方薬など）をまとめあげるために使用される。"

* authoredOn 0..1
* authoredOn ^short = "依頼日時"
* authoredOn ^definition = "依頼日時"

* requester 0..1
* requester ^short = "依頼者"
* requester ^definition = "依頼者"
* requester only Reference(JP_Practitioner_eCS_Contained or JP_Organization_eCS_Contained)