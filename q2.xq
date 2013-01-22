(: The average group size. :)

avg (
for $groups in doc("division.xml")//GROUPS
	let $size := $groups/MEMBERS
	return (count($size) + 1)
)
