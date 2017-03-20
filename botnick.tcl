bind PUBM - * public
bind MSGM - * private

proc public {nick uhost hand chan arg} {
	global temp

	if {[string index $arg 0] in {! . `}} {
		set temp(cmd) [string range $arg 1 end]
		set temp(cmd) [lindex [split $temp(cmd)] 0]
		set arg [join [lrange [split $arg] 1 end]]
	} elseif {[isbotnick [lindex [split $arg] 0]]} {
		set temp(cmd) [lindex [split $arg] 1]
		set arg [join [lrange [split $arg] 2 end]]
	} else {
		set temp(cmd) [lindex [split $arg] 0]
	}

	switch -nocase -- $temp(cmd) {
		o - op - @ {
			putserv "PRIVMSG $chan :Ok pentru comanda de @ canal"
		}
	}
}

proc private {nick uhost hand arg} {
	global temp

	set temp(cmd) [lindex [split $arg] 0]

	switch -nocase -- $temp(cmd) {
		o - op - @ {
			putserv "PRIVMSG $nick :Ok pentru comanda de @ privat"
		}
	}
}
