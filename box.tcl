#!/usr/bin/expect
# author kmedley@costco.com
###########################################
# Argument logic
###########################################
set arg_0 [lindex $argv 0];
set arg_1 [lindex $argv 1];
array set options {
	env env
	go go
	tail-syso tail-syso
	tail-trace tail-trace
	tail-error tail-error
	logs logs
	stageprop stageprop
	warehouseLoad warehouseLoad
}
###########################################
# Credential information
###########################################
set user "<usr>";
set jumpbox "<ip>";
set appserver $arg_1;
set jumpboxPw "<pw>";
set appserverPw "<pw>"
###########################################
# Other constants
###########################################
set logDir "/usr/IBM/WebSphere/AppServer/v70/profiles/ecom/logs/server1/"
set timestamp [timestamp -format "%m-%d-%Y_%H.%M.%S"]
###########################################
# Environment Array (must be even # of elems)
###########################################
array set environments {
	dit1 dit1
	dit1w dit1w
	dit2 dit2
	dit2w dit2w
	dit3 dit3
	dit3w dit3w
	dit4 dit4
	dit4w dit4w
	dit5 dit5
	dit5w dit5w
	dit6 dit6
	dit6w dit6w
	dit7 dit7
	dit7w dit7w
	qa1 qa1
	qa1w qa1w
	qa2 qa2
	qa2w qa2w
	qa3 qa3
	qa3w qa3w
	qa4 qa4
	qa4w qa4w
	qa5 qa5
	qa5w qa5w
	qa6 qa6
	qa6w qa6w
	qa7 qa7
	qa7w qa7w
	uat1 uat1
	uat1w uat1w
	uat2 uat2
	uat2w uat2w
}
###########################################
# Environment server arrays (known)
###########################################
array set dit1 {
	xecd1app01 xecd1app01
	xecd1web01 xecd1web01
	xecdi1web01 xecdi1web01
}
array set dit1w {
	xecdw1app01 xecdw1app01
	xecdw1web01	xecdw1web01
}
array set dit2 {
	xecd2app01 xecd2app01
	xecd2web01 xecd2web01
	xecdi2web01 xecdi2web01
}
array set dit2w {
	xecdw2app01 xecdw2app01
	xecdw2web01 xecdw2web01
}
array set dit3 {
	xecd3app01 xecd3app01
	xecd3web01 xecd3web01
	xecdi3web01 xecdi3web01
}
array set dit3w {
	xecdw3app01 xecdw3app01
	xecdw3web01	xecdw3web01
}
array set dit4 {
	xecd4app01 xecd4app01
	xecd4web01 xecd4web01
	xecdi4web01 xecdi4web01
}
array set dit4w {
	xecdw4app01 xecdw4app01
	xecdw4web01	xecdw4web01
}
array set dit5 {
	xecd5app01 xecd5app01
	xecd5web01 xecd5web01
	xecdi5web01 xecdi5web01
}
array set dit5w {
	xecdw5app01 xecdw5app01
	xecdw5web01 xecdw5web01
}
array set dit6 {
	xecd6app01 xecd6app01
	xecd6web01 xecd6web01
	xecdi6web01 xecdi6web01
}
array set dit6w {
	xecdw6app01 xecdw6app01
	xecdw6web01 xecdw6web01
}
array set dit7 {
	xecd7app01 xecd7app01
	xecd7web01 xecd7web01
	xecdi7web01 xecdi7web01
}
array set dit7w {
	xecdw7app01 xecdw7app01
	xecdw7web01 xecdw7web01
}
array set qa1 {
	xecq1app01 xecq1app01
	xecq1app02 xecq1app02
	xecq1web01 xecq1web01
	xecq1web02 xecq1web02
	xecqi1web01 xecqi1web01
	xecqi1web02 xecqi1web02
}
array set qa1w {
	xecqw1app01 xecqw1app01
	xecqw1app02 xecqw1app02
	xecqw1web01 xecqw1web01
	xecqw1web02 xecqw1web02
}
array set qa2 {
	xecq2app01 xecq2app01
	xecq2app02 xecq2app02
	xecq2web01 xecq2web01
	xecq2web02 xecq2web02
	xecqi2web01 xecqi2web01
	xecqi2web02 xecqi2web02
}
array set qa2w {
	xecqw2app01 xecqw2app01
	xecqw2app02 xecqw2app02
	xecqw2web01 xecqw2web01
	xecqw2web02 xecqw2web02
}
array set qa3 {
	xecq3dmg01 xecq3dmg01
	xecq3dmg02 xecq3dmg02
	xecq3app01 xecq3app01
	xecq3app02 xecq3app02
	xecq3app03 xecq3app03
	xecq3app04 xecq3app04
	xecq3web01 xecq3web01
	xecq3web02 xecq3web02
	xecqi3web01 xecqi3web01
	xecqi3web02 xecqi3web02
}
array set qa3w {
	xecqw3app01 xecqw3app01
	xecqw3app02 xecqw3app02
	xecqw3web01 xecqw3web01
	xecqw3web02 xecqw3web02
}
array set qa4 {
	xecq4app01 xecq4app01
	xecq4app02 xecq4app02
	xecq4web01 xecq4web01
	xecq4web02 xecq4web02
	xecqi4web01 xecqi4web01
	xecqi4web02 xecqi4web02
}
array set qa4w {
	xecqw4app01 xecqw4app01
	xecqw4app02 xecqw4app02
	xecqw4web01 xecqw4web01
	xecqw4web02 xecqw4web02	
}
array set qa5 {
	xecq5app01 xecq5app01
	xecq5app02 xecq5app02
	xecq5web01 xecq5web01
	xecq5web02 xecq5web02
	xecqi5web01 xecqi5web01
	xecqi5web02 xecqi5web02
}
array set qa5w {
	xecqw5app01 xecqw5app01
	xecqw5app02 xecqw5app02
	xecqw5web01 xecqw5web01
	xecqw5web02 xecqw5web02	
}
array set qa6 {
	xecq6app01 xecq6app01
	xecq6app02 xecq6app02
	xecq6web01 xecq6web01
	xecq6web02 xecq6web02
	xecqi6web01 xecqi6web01
	xecqi6web02 xecqi6web02
}
array set qa6w {
	xecqw6app01 xecqw6app01
	xecqw6app02 xecqw6app02
	xecqw6web01 xecqw6web01
	xecqw6web02 xecqw6web02
}
array set qa7 {
	xecq7app01 xecq7app01
	xecq7app02 xecq7app02
	xecq7web01 xecq7web01
	xecq7web02 xecq7web02
	xecqi7web01 xecqi7web01
	xecqi7web02 xecqi7web02
}
array set qa7w {
	xecqw7app01 xecqw7app01
	xecqw7app02 xecqw7app02
	xecqw7web01 xecqw7web01
	xecqw7web02 xecqw7web02	
}
array set uat1 {
	xecu1app01 xecu1app01
	xecu1app02 xecu1app02
	xecu1web01 xecu1web01
	xecu1web02 xecu1web02
	xecui1web01 xecui1web01
	xecui1web02 xecui1web02
}
array set uat1w {
	xecuw1app01 xecuw1app01
	xecuw1app02 xecuw1app02
	xecuw1web01 xecuw1web01
	xecuw1web02 xecuw1web02
}
array set uat2 {
	xecu2app01 xecu2app01
	xecu2app02 xecu2app02
	xecu2web01 xecu2web01
	xecu2web02 xecu2web02
	xecui2web01 xecui2web01
	xecui2web02 xecui2web02
}
array set uat2w {
	xecuw2app01 xecuw2app01
	xecuw2app02 xecuw2app02
	xecuw2web01 xecuw2web01
	xecuw2web02 xecuw2web02
}
###########################################
# Procedures (functions)
###########################################
proc connect {pw} {
	expect {
		"assword:" {
			send "$pw\r"
			expect {
				"denied" { 
					puts "Wrong password"
					exit 1 
				}
				"#" { return 0 }
				">" { return 0 }
			}
		}
		"#" { return 0 }
		">" { return 0 }
	}
	return 1
}
proc inArray {elem arr} {
	array set array $arr
	foreach {name value} [array get array]  {
		if { "$value" == "$elem" } { return 0 }
	}
	return 1
}
proc isServer {nameParam} {
	global environments
	foreach {name value} [array get environments] {
		global $value
		foreach {boxName boxValue} [array get $value] {
			if { "$nameParam" == "$boxName" } { 
				return 0 
			}
		}
	}
	return 1
}
proc env {} {
	global environments
	foreach {name value} [array get environments]  {
		puts "$value"
	}
}
proc invalidOption {envServ} {
	puts "Invalid environment/box '$envServ'. Try `./box.tcl env` to get a list of environments"
	exit 1
}
proc errorConnection {context} {
	puts "There was an error connecting to $context. Check credentials."
}
proc usage {} {
	puts "\nUsage: ./box.tcl \[FUNCTION|ENV|BOX\] \[ENV|BOX\]\n"
	puts "box.tcl allows you to directly connect to an WAS box of a particular environment and perform tasks, automating the process of first connecting to the AIX jumpbox and THEN connecting to the box.\n"
	puts "- FUNCTION\n"
	puts "\tenv\t\tList all available environments."
	puts "\tgo\t\tConnect to a specified box within an environment."
	puts "\ttail-syso\tTail the specified WAS SystemOut.log."
	puts "\ttail-trace\tTail the specified WAS trace.log."
	puts "\ttail-error\tTail the specified WAS SystemErr.log."
	puts "\tlogs\t\tPull logs directory of a WAS box to local disk."
	puts "\tstageprop\tExecute stageprop on a specified staging WAS box."
	puts "\twarehouseLoad\tExecute warehouseLoad on a a specified internal WAS box.\n"
	puts "- ENV|BOX\n"
	puts "\tExample environment: dit1, dit2, qa1, qa2, uat1, uat2, etc."
	puts "\tExample WAS box: xecd1app01, xecd1web01, xecq2app01, etc."
}
proc checkArgs {arg1 arg2} {
	global options

	if {[servOrEnv $arg1] == 0} { return 0 }
	if { $arg1 == "" || $arg2 == "" } { return 1 }
	foreach {optionName optionValue} [array get options] {
		if { $optionName == $arg1 } { return 0 }
	}
	return 1
}
proc servOrEnv {arg1} {
	global environments
	set isEnv [inArray $arg1 [array get environments]]
	set isServ [isServer $arg1]
	if { $isEnv == 0 || $isServ == 0 } { 
		return 0 
	} else {
		return 1
	}
}
###########################################
# Execute - let the magic begin
###########################################
switch $arg_0 {
	# "env" lists the environments associated
	# with the environment array "environments"
	env { env }
	default {
		# Verify arguments are correct
		if { [checkArgs $arg_0 $arg_1] == 1 } { usage; exit 1; }

		if { [servOrEnv $arg_0] == 0 } {
			set arg_1 $arg_0
			set arg_0 "go"
		}

		# Check if Arg 1 is an environment or an app server
		set isEnv [inArray $arg_1 [array get environments]]
		set isServ [isServer $arg_1]

		# If Arg 1 = Environment, give a list of boxes to 
		# connect to, prompting for input. Check if the input
		# is valid and continue to valid-check
		if { $isEnv == 0 } {
			foreach {name value} [array get $arg_1] {
				puts "$value"
			}
			puts "\nType the name of the box you would like to connect to:"
			gets stdin server
			puts "Checking '$server'..."
			set isServ [isServer $server]
			if { $isServ == 0 } {
				set box $server
				set valid 0
			} else {
				invalidOption $server
			}

		# If Arg 1 = verified server from list, mark as valid
		# and continue to valid-check, otherwise fail
		} elseif { $isServ == 0 } {
			puts "Connecting to $arg_1"
			set box $arg_1
			set valid 0
		} else { 
			invalidOption $arg_1
		}

		# Check valid variable and begin jumping to the 
		# corresponding app server 
		if { $valid == 0 } {
			if { $arg_0 == "logs" } { 
				spawn bash
				cd ~
				set localHome [pwd]
				expect {
					* {
						set jLocalDir "logs.box.$box.$timestamp";
						file mkdir ~/$jLocalDir
					}
				}
				send "exit\r"

			}
			# First jump to the AIX jumpbox
			spawn ssh $user@$jumpbox

			# If we successfully connect to the jumpbox, connect 
			# to the app server to perform operation
			if { [connect $jumpboxPw] == 0 } {
				# Set operation settings
				set operation "go"
				switch $arg_0 {
					tail-syso {
						set operation "tail"
						set log "SystemOut.log"
					}
					tail-trace {
						set operation "tail"
						set log "trace.log"
					}
					tail-error {
						set operation "tail"
						set log "SystemErr.log"
					}
					logs {
						set operation "logs"
					}
					default {}
				}
				switch $operation {
					tail {
						send "ssh $user@$box\r"
						if { [connect $appserverPw] == 0 } {
							puts "Attempting to tail $log in $logDir"
							send "cd $logDir\r"
							send "tail -100 -f $log\r"
							interact
							exit 0
						} else {
							errorConnection $box
						}
					}
					logs {
						set jLocalDir "logs.box.$box.$timestamp";
						send "mkdir ~/$jLocalDir\r";
						
						send "scp -r $user@$box:$logDir* $jLocalDir\r";
						set connected [connect $appserverPw]
						if { [connect $appserverPw] == 0 } {
							send "exit\r"
							expect "osed"
							spawn scp -r $user@$jumpbox:$jLocalDir/* $jLocalDir
							connect $jumpboxPw
							spawn ssh $user@$jumpbox "rm -fr $jLocalDir"
							connect $jumpboxPw
						} else {
							errorConnection $box
						}
						puts "\n\nBox logs are located at $localHome/$jLocalDir.\n"
						exit 0
					}
					default {
						send "ssh $user@$box\r"
						if { [connect $appserverPw] == 0 } {
							send "bash\r"
							interact
							exit 0
						} else {
							errorConnection $box
						}
					}
				}

				
			} else {
				errorConnection $jumpbox
			}
		}
	}
}
exit 1

# sum :: Int -> Int
# sum 
# 	| n == 0  	= n
# 	| otherwise = sum (n-1)
