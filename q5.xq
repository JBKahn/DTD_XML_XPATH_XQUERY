(: The group node of every group whose leader is junior to (in an earlier year in school) some
   other member of that group.:)

let $xml := doc("division.xml")
let $xml2 := doc("responses.xml")
for $groupid in $xml//GROUPS/@gID
for $leader in  $xml//GROUPS[@gID=$groupid]/LEADER/@sID
for $leaderstat in $xml2//STUDENT
where $leader = $leaderstat/@sID and (data($leaderstat/RESPONSE[@qID="year"]/NUMERIC/@answer) <=  max(
	for $member in  $xml//GROUPS[@gID=$groupid]/MEMBERS/@sID
	for $memberstat in $xml2//STUDENT
	where $member = $memberstat/@sID
		return data($memberstat/RESPONSE[@qID="year"]/NUMERIC/@answer)))
return $xml//GROUPS[@gID=$groupid]
