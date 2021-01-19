#!/usr/bin/perl -w

# usage: fastqlength.pl FASTQ

open(IN, "<$ARGV[0]") || die "open $ARGV[0]:$!\n";

while(<IN>) {
    chomp $_;
    ($id) = $_ =~ /^@(\S+)/;
    $seq = <IN>; chomp $seq;
    $l = length($seq);
    <IN>;
    <IN>;

    print "$id\t$l\n";
}
close IN;
