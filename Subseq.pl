#!/usr/bin/perl -w

# usage: subseq.pl FASTA ID seq_start length (2 100)

# take FASTA file, sequnce ID and pick seq interval
# so you can pick an ID's range sequence of FASTA file

# open the FASTA file
open(IN, "<$ARGV[0]");
while(<IN>) {
    $seq = <IN>; chomp $seq;
    if ($_ =~ /$ARGV[1]$/) {
	# index start from 0
	$subseq = substr($seq, $ARGV[2] - 1, $ARGV[3]);
	print "$_$subseq\n";
    }
}
close IN;
