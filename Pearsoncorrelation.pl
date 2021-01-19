#!/usr/bin/perl -w

# usage: pearsoncorrelation.pl file1 file2

use strict;

# save file1 data to list
open(IN1, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
open(IN2, "<$ARGV[1]") || die "open $ARGV[1]: $!\n";
my @a1 = <IN1>; chomp @a1;
my @a2 = <IN2>; chomp @a2;
close IN1;
close IN2;

# check whether the two list of numbers are the same length
if( @a1 != @a2 ){
    print "two lists of numbers are DIFFERENT\n";
    exit 0;
} else {
    my @b1 = MinusAverage(\@a1);
    my @b2 = MinusAverage(\@a2);

    # numerator
    my $up;
    for(my $i=0;$i<=$#b1;$i++) {
	$up += $b1[$i]*$b2[$i];
    }

    # square and sum
    my $x1;
    my $x2;
    foreach (@b1) {
	$x1 += $_**2;
    }
    foreach (@b2) {
	$x2 += $_**2;
    }

    # get denominator
    my $dn = sqrt($x1*$x2);
    my $r = $up / $dn;
    print "$r\n";
}


sub MinusAverage {
    my @a = @{$_[0]};

    # count average
    my $s;
    foreach my $e (@a) {
	$s += $e;
    }
    my $m = $s / @a;
    my @b = map($_-$m, @a);
    return @b;
}
