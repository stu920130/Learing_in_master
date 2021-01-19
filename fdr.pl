#!/usr/bin/perl -w

# usage: fdr.pl file

# learn to write fdr

use strict;

# save raw pvalue
my @pvalue;
# save raw and correct
my %correct;

# open file
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while (<IN>) {
    chomp;
    push(@pvalue, $_);
}
close IN;

# sort array, from big to small
my @sortp = sort{ $b <=> $a } @pvalue;
my $lastp = $sortp[0];

# correct p-value
for (my $i=0; $i<@sortp; $i ++) {

    my $nowr = @sortp - $i;
    my $newp = $sortp[$i] * (@sortp / $nowr);

    # compare with last pvalue
    if ($newp > $lastp) {
	$correct{$sortp[$i]} = $sortp[$i];
	$lastp = $sortp[$i];
    } else {
	$correct{$sortp[$i]} = $newp;
	$lastp = $newp;
    }
}

# output
foreach my $e (@pvalue) {
    print "$e\t$correct{$e}\n";
}
