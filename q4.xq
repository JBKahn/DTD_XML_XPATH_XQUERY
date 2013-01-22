(: For each option (to a multiple choice question) that no one picked, the question ID and the
   option text. :)

let $xml := doc("survey.xml")
let $xml2 := doc("responses.xml")
for $qID in $xml//QUESTION/@qID
	for $choice in $xml//QUESTION[@qID = $qID]/MC/CHOICES/@choice
		where not($xml2//RESPONSE[@qID = $qID]/MC/CHOICES/@choice=$choice)
		return ($qID, $choice)
