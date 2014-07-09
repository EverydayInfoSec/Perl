#!/usr/bin/perl

## Creator: EverydayInfoSec
## Date: 21.03.2013
## 
## Launcher script for transformer.pl

use strict;
use warnings;

##Usage
##run this to release transformer.pl script
if(my $pid = fork){
print "Start";
}
else{
	system("perl transformer.pl");
	exit(0);
}
print "End";
