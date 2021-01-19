#!/usr/bin/perl -w

# usage: Fastq2Fasta.pl file.fq

# turn fastq to fasta

open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

while (<IN>) {
    $_ = substr($_, 1);
    print ">$_";
    $seq = <IN>;
    print $seq;
    <IN>;
    <IN>;
}
close IN;
