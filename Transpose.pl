#!/usr/bin/perl -w

# usage: randommatrix.pl file
# transpose the matrix

use strict;

# read file to matrix
print "original:\n";
my @all = ();
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while(<IN>) {
    chomp $_;
    my @a = split("\t", $_);
    print join("\t", @a)."\n";
    push(@all, \@a);
}
close IN;

# transpose the matix
print "transpose:\n";
for(my $i=0;$i<@{$all[1]};$i++) {
    for(my $j=0;$j<@all;$j++) {
	# you can wirte like matrix (@{$all[$j]}[$i])
	print "$all[$j][$i]\t";
    }
    print "\n";
}


