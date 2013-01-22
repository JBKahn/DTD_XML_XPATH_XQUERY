(: For every student in the class, the student ID and their college. If the student has not
  answered the college question, give “no college reported” as their college. :)

for $student in doc("responses.xml")//STUDENT
	let $college := $student/RESPONSE[@qID="college"]/MC/CHOICES/@choice
	let $stunum := $student/@sID
	return if($college) 
		then ($stunum, $college)
		else ($stunum, "no college reported")
