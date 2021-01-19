#!/usr/bin/perl -w

# usage: InFile1NotFile2.pl file1 file2

use strict;

my %h1 = ();
my %h2 = ();

# open file1, pick unique and save in hash
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while (<IN>) {
    chomp;
    $h1{$_} = 1;
}
close IN;

# open file2, pick unique and save in hash
open(IN, "<$ARGV[1]") || die "open $ARGV[0]: $!\n";
while (<IN>) {
    chomp;
    $h2{$_} = 1;
}
close IN;

# print elements appears in file1 not in file2
foreach my $e1 (keys %h1) {
    if (!grep(/$e1/, (keys %h2))) {
	print "$e1\n";
    }
}
