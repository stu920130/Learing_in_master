#!/usr/bin/perl -w

# usage: filterfastaByLength.pl FASTA length_cutoff

open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while(<IN>) {
    $seq = <IN>; chomp $seq;
    $l = length($seq);
    if ($l >= $ARGV[1]) {
	print "$_$seq\n";
    }
}
close IN;
