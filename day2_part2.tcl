#!/bin/env tclsh

# Convenience imports
namespace import ::tcl::mathop::+
namespace import ::tcl::mathop::%
namespace import ::tcl::mathop::/

# Slurp in input
set fp [open "day2.in" r]
set contents [read $fp]
close $fp

set input [split $contents "\n"]
set result 0

foreach line $input {
  variable line_result 0

  foreach val1 $line {
    foreach val2 $line {
      if {$val1 != $val2 && [% $val2 $val1] == 0} {
        set line_result [/ $val2 $val1]
      }
      if {$val1 != $val2 && [% $val1 $val2] == 0} {
        set line_result [/ $val1 $val2]
      }
    }
  }

  if {[string length $line] != 0} {
    set result [+ $result $line_result]
  }
}

puts $result
