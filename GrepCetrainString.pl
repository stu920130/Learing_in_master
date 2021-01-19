#!/usr/bin/perl -w

# usage GrepCertainString.pl start_pos end_pos fa / fq / string

# there only one line in the file
# pick the cerntain range of string, contain start and end
# postion are count from 1

use strict;

my $out = "";

# a file
if (-e $ARGV[2]) {

    open(IN, "<$ARGV[2]") || die "open $ARGV[2]: $!\n";

    my $first = <IN>;
	
    # fa and fq
    if ($first =~ /\>/ || $first =~ /\@/) {
	my $seq = <IN>; chomp $seq;
	$out = substr($seq, $ARGV[0]-1, $ARGV[1]-$ARGV[0]+1);
	
    # only a string
    } else {
	$out = substr($first, $ARGV[0]-1, $ARGV[1]-$ARGV[0]+1);
    }

# string in command line
} else {
    $out = substr($ARGV[2], $ARGV[0]-1, $ARGV[1]-$ARGV[0]+1);
}

print "$out\n";
