#!/bin/env tclsh

# Convenience imports
namespace import ::tcl::mathop::+
namespace import ::tcl::mathop::-

# Slurp in input
set fp [open "day2.in" r]
set contents [read $fp]
close $fp

set input [split $contents "\n"]
set result 0

foreach line $input {
  variable high 0
  variable low 1000000
  foreach value $line {
    if {$value > $high} {set high $value}
    if {$value < $low} {set low $value}
  }
  if {$high != 0} {
    set result [+ $result [- $high $low]]
  }
}

puts $result
