(: Valid xml (satisfying the DTD in histogram.dtd, available on the Assignments page) that
   contains a histogram showing the number of students who picked each project domain in
   survey.xml. :)

<Histogram> {
	let $choice := doc("responses.xml")//RESPONSE[@qID="prefs"]/MC/CHOICES/@choice
	let $domain := doc("survey.xml")//SURVEY/QUESTION[@qID="prefs"]/MC/CHOICES/@choice
	for $d in $domain
	return <Bar
    	choice = "{data($d)}"  count = "{count(
        	for $c in $choice
            	where $c = $d
                return $c)}" />
}
</Histogram>
