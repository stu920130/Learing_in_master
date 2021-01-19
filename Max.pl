#!/usr/bin/perl -w

# usage: max.pl file
# usage: max.pl numbers(5 6 3 78 9)

@a=();

# open file and make number into array
if (-e $ARGV[0]) {
    open(IN, "<$ARGV[0]");
    while(<IN>) {
	chomp $_;
	push(@a, $_);
    }

    # sort numbers and output
    @a=sort{$a<=>$b}@a;
    print "$a[$#a]\n";
    close IN;

#input command line numbers, pick max number and output
} else {
    $max=$ARGV[0];
    for (my $i=1;$i<=$#ARGV;$i++) {
	if ($ARGV[$i]>$max) {
	    $max=$ARGV[$i];
	}
    }
    print "$max\n";
}
