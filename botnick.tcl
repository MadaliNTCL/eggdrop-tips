bind PUBM - * botnick

proc botnick {nick uhost hand chan arg} {
	global temp

	if {[string index $arg 0] in {! . `}} {
		set temp(cmd) [string range $arg 1 end]
		set temp(cmd) [lindex [split $temp(cmd)] 0]
		set arg [join [lrange [split $arg] 1 end]]
	} elseif {[isbotnick [lindex [split $arg] 0]]} {
		set temp(cmd) [lindex [split $arg] 1]
		set arg [join [lrange [split $arg] 2 end]]
	} else { return 0 }

	if {[info commands pubcmd:$temp(cmd)] ne ""} { pubcmd:$temp(cmd) $nick $uhost $hand $chan $arg }
}

proc pubcmd:help {nick uhost hand chan arg} {
  putserv "PRIVMSG $chan :Yes.. this is how it works."
}
