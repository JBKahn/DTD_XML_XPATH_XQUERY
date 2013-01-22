(: The college that most students are in. If there is a tie, report all colleges that tied. :)

let $xml := doc("responses.xml")
let $xml2 := doc("survey.xml")
for $college in $xml2//QUESTION[@qID="college"]/MC/CHOICES/@choice
let $top := max(
	let $xml := doc("responses.xml")
	for $college in $xml2//QUESTION[@qID="college"]/MC/CHOICES/@choice
	return count($xml//RESPONSE[@qID="college"]/MC/CHOICES[@choice = $college])
)
return if (count($xml//RESPONSE[@qID="college"]/MC/CHOICES[@choice = $college]) = $top)
	then $college
	else ()
