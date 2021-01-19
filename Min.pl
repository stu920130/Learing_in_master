#!/usr/bin/perl -w

# usage: min.pl file
# usage: min.pl numbers(2 3 4 5 6)

# open file
if (-e $ARGV[0]) {
    open(IN, "<$ARGV[0]");
    while(<IN>) {
	chomp $_;
	push(@a, $_);
    }
    close IN;
    @a=sort{$a<=>$b}@a;
    print "$a[0]\n";

# input numbers
} else {
    $min = $ARGV[0];
    for ($i=1;$i<=$#ARGV;$i++) {
	if ($ARGV[$i] < $min) {
	    $min = $ARGV[$i];
	}
    }
    print "$min\n";
}
