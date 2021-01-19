#!/usr/bin/perl -w

# usage: meansd.pl file
# usage: meansd.pl numbers(4 5 6 3 1 2)

# input file, sum, mean, sd and output
if (-e $ARGV[0]) {
    open(IN, "<$ARGV[0]");
    while(<IN>) {
	chomp $_;
	push(@a, $_);
    }
    close IN;
    foreach (@a) {
	$sum+=$_;
    }
    $mean=$sum/scalar(@a);
    foreach(@a) {
	$q+=($_-$mean)**(2);
    }
    $sd=($q/$#a)**(1/2);
    print "$sd\n";

# input command line numbers and output
} else {
    $sum=0;
    foreach (@ARGV) {
	$sum+=$_;
    }
    $mean=$sum/($#ARGV+1);
    $a = 0;
    foreach(@ARGV) {
	$a+=($_-$mean)**(2);
    }
    $sd=($a/$#ARGV)**(1/2);
    print "$sd\n";
}
