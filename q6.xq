(: Valid xml (satisfying the DTD in years.dtd, available on the Assignments page) that
   contains the student ID and year of every student in the class. :)
(: assumption: if the student did not give his/her year, don't print the student :)

<Students> {
	for $student in doc("responses.xml")//STUDENT
		let $year := $student/RESPONSE/NUMERIC
		where $year/@answer
		return (<Student who = "{$student/@sID}" year = "{$year/@answer}" />)
}
</Students>
