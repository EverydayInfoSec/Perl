#!/usr/bin/perl

## Creator: EverydayInfoSec
## Date: 21.03.2013
## 
## Script which:
##   * Creates copy of itself with semirandom name
##   * Writes the copy with new name
##   * Launches the copy
##   * Removes the old script
##   * Repeats steps above

use Proc::Daemon;
use strict;
use warnings;

##USAGE
##use optimus.pl for starting this creepy
my $args = $#ARGV + 1;
my $newfilename;
my $filetodelete;
my $fileroot = 'transformer.pl';
my $run;
#First run

if($args == 0){
  $filetodelete = $fileroot;
  $newfilename = rand(10000) . $fileroot;
  $run = 1;
}
#Runs after that
else{

  $run = $ARGV[1] + 1;
  ##the new empty file
  $newfilename = rand(10000) . $fileroot;
 
  ##name of THIS DOCUMENT
  $filetodelete = $ARGV[0];

  ##Limit for runs. Delete if you want it run endlesly
  if($run == 4){
	die 'done';
  }
}
  
  ## Bit of sleep. You might want to increase this so it has enough time to
  ## do what it wants to
  sleep(2);

  print "NEW: $newfilename\n";
  print "OLD: $filetodelete\n";
  print "RUN: $run\n";
  open(my $THISFILE, "<", $filetodelete) or die "Cant read $filetodelete\n";
  local $/;
  my $newf = <$THISFILE>;
  close ($THISFILE);
  unlink $filetodelete;
  open(my $NEWFILE, ">", $newfilename);
  print $NEWFILE $newf;
  close($NEWFILE);

  ##Contains path so script is contained to specific folder
  my $cmd = 'perl ~/Perl/' . $newfilename . ' ' . $newfilename . ' ' . $run;
  print "CMD: $cmd\n";

  system($cmd);
