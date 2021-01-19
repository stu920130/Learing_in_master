#!/usr/bin/perl -w

# usage: median.pl file
# usage: median.pl numbers(5 6 3 1 2)

@a=();

# open file, sort, pick median and output
if(-e $ARGV[0]) {
    open(IN, "<$ARGV[0]");
    while(<IN>) {
	chomp $_;
	push(@a, $_);
    }
    @e=sort{$a<=>$b}@a;
    $l=scalar(@e);
    if($l%2==0) {
	$q=($a[$l/2]+$a[$l/2+1])/2;
	print $q;
    } else {
	print "$a[$l/2]\n";
    }

# input numbers, sort, pick median and output
} else {
    @e=sort{$a<=>$b}@ARGV;
    $l=scalar(@e);
    if($l%2==0) {
	$q=($ARGV[$l/2]+$ARGV[$l/2+1])/2;
	print $q;
    } else {
	print "$ARGV[$l/2]\n";
    }
}
