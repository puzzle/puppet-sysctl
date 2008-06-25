#
# sysctl module
#
# Copyright (C) 2008 admin@immerda.ch
# Copyright 2008, Puzzle ITC
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

#modules_dir { "sysctl": }

class sysctl {}

define sysctl::set_value(
	$value
){
 	exec { "exec_sysctl_${name}":
 		command => "/sbin/sysctl ${name}=${value}",
 		refreshonly => true,
 	}

 	sysctl { $name:
 		val => "$value",
 		notify => Exec["exec_sysctl_${name}"],
 	}
}
