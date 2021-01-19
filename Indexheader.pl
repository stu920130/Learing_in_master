#!/usr/bin/perl -w

# usage: Showrownumber.pl file

# tell the row number, so we donnot have to count

use strict;

open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

# get row number
my @a = split("\t", <IN>);
my @num = (1 .. (@a+0));
print join("\t", @num)."\n";

# get three row
my $three = `head -n 3 $ARGV[0]`;
print "$three";
