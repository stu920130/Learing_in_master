#!/usr/bin/perl -w

# usage: splitfasta.pl fasta n
# split data into n files of about equal number of sequences


use strict;

# no splitting required
if ($ARGV[1] == 1) {
    `ln -s $ARGV[0] $ARGV[0].1.fa`;
    exit 0;
}

# how many sequences in the data
my $s = `grep -c \\> $ARGV[0]`; chomp $s;

# how much sequences in each file
# notice if it can not divisible
my $n = $ARGV[1];
my $eachf = 0;
if (($s % $n) != 0) {
    $eachf = (($s - ($s % $n)) / $n) + 1;
    $n = sprintf("%d", $s / $eachf);
} else {
    $eachf = $s / $n;
}

# split file
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
foreach my $f (1..$n) {
    open(OUT, ">$ARGV[0].$f.fa");
    my $cseq = 0;
    while(<IN>) {
	if ($cseq == $eachf) {
	    print OUT $_;
	    last;
	}
	if ($_ =~ />/) {
	    $cseq ++;
	    print OUT $_;
	} else {
	    print OUT $_;
	}
    }
    close OUT;
}
close IN;
