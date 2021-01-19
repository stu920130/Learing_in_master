#!/usr/bin/perl -w

# usage: switchkeyvalue.pl file

# a file holding a hash in two columns

use strict;

my %h = ();

open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while(<IN>) {
    chomp $_;
    my @a = split("\t", $_);
    my @k = split(",", $a[1]);
    foreach my $e (@k) {
	push(@{$h{$e}}, $a[0]);
    }
}
close IN;

foreach my $e (keys %h) {
    print "$e\t".join(",", @{$h{$e}})."\n";
}


