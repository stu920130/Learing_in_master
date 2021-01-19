#!/usr/bin/perl -w

# usage: randommatrix.pl num1 num2
# it creates an "num1 x mum2" matrix of random numbers(0~99)

use strict;

my @all = ();
for(my $i=0;$i<$ARGV[0];$i++) {
    # remember to clear the array
    my @r = ();
    for(my $j=0;$j<$ARGV[1];$j++) {
	my $a = int(rand(100));
	push(@r, $a);
    }
    print join("\t", @r)."\n";
    push(@all, \@r);
}


=head
my $m = $ARGV[0];
my $n = $ARGV[1];

foreach (1..$m) {
    my @r = map(int(rand(100)), (1..$n));
    print join("\t", @r)."\n";
}
=cut
