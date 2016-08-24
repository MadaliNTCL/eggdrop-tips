set temp(first) "2.0.0.19"
set temp(final) "2.0.0.46"

proc getip {} {
	global temp

	if {![info exists temp(last)]} {

		# ++ add
		set of [open getip w]
		puts $of "array set temp [list [array get temp]]"
		close $of

		set temp(last) $temp(first)

		return $temp(last)
	}

	set 1 [string range $temp(last) 0 5]
	set 2 [expr [lindex [split $temp(last) .] 3] + 1]

	set temp(last) "$1$2"

	# ++ add
	set of [open getip w]
	puts $of "array set temp [list [array get temp]]"
	close $of

	if {$temp(last) eq $temp(final)} {
	
		# ++ add
		set of [open getip w]
		puts $of "array set temp [list [array get temp]]"
		close $of

		set temp(last) $temp(first)

		return $temp(last)
	}

	return $temp(last)
}

catch {source getip}
