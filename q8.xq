(: Valid xml (satisfying the DTD in availability.dtd, available on the Assignments page) that
   shows for each group, the number of timeslots to which all group members answered yes. :)

<Availability> {
	let $xml := doc("division.xml")
	let $xml2 := doc("responses.xml")
	let $xml3 := doc("survey.xml")
	for $groupid2 in $xml//GROUPS/@gID
	let $query := (
		for $groupid in $xml//GROUPS/@gID
		let $x := (
			for $student in $xml//STUDENTS/@sID
			where ($xml//GROUPS[@gID=$groupid]/LEADER/@sID=$student or $xml//GROUPS[@gID=$groupid]/MEMBERS/@sID=$student)
			return ($xml2//STUDENT[@sID=$student]/RESPONSE/TIMETABLE))
		let $stulist := (
			for $student in $xml//STUDENTS/@sID
			where ($xml//GROUPS[@gID=$groupid]/LEADER/@sID=$student or $xml//GROUPS[@gID=$groupid]/MEMBERS/@sID=$student)
			return $student)
		for $qID in $xml3//QUESTION/@qID
		for $slotid in $xml3//QUESTION[@qID = $qID]/TIMETABLE/TIMESLOT/@timeslotID
		let $avail := $x[@timeslotID = $slotid]
		where $x/@timeslotID=$slotid and not(data($avail/@availability)="no") and count($avail) = count($stulist) and $groupid2=$groupid
		return ($groupid))
	return <Group numslots="{count($query)}">{data($groupid2)}</Group>
}
</Availability>
