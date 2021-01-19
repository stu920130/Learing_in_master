#!/usr/bin/perl -w

# usage: mean.pl file
# usage: mean.pl numbers(7 5 36 3 2)

@a=();

# open file
if (-e $ARGV[0]) {
    open(IN, "<$ARGV[0]");
    while(<IN>) {
	chomp $_;
	push(@a, $_);
    }
    close IN;
    
    # pick sum, pick mean and output
    foreach $e (@a) {
	$sum+=$e;
    }
    $mean=$sum/scalar(@a);
    print "$mean\n";

# input command line numbers, sum, mean and output
} else {
    $sum=0;
    foreach (@ARGV) {
	$sum+=$_;
    }
    $mean=$sum/($#ARGV+1);
    print "$mean\n";
}
