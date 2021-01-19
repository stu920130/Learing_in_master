#!/usr/bin/perl -w

# usage: fastalength.pl FASTA
# it can count any form of fasta



# open file
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

$id = <IN>;
($id) = $id =~ /^>(\S+)/;
$seq = "";

while (<IN>) {
    chomp;
    if (/^>/) {
	$l = length($seq);
	print "$id\t$l\n";
	($id) = $_ =~ /^>(\S+)/;
	$seq = "";
    } else {
	chomp;
	$seq .= $_;
    }
}
close IN;

$l = length($seq);
print "$id\t$l\n";
