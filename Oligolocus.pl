#!/usr/bin/perl -w

# usage: oligolocus.pl fasta oligo

# compare oligo sequence to the FASTA sequence and print index

# open fasta and find if there is oligo, and print the location
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

$id = <IN>;
($id) = $id =~ /^>(\S+)/;
$seq = "";

while(<IN>) {
    chomp $_;
    if (/^>/) {
	# count index
	@l = ();
	$i = index($seq, $ARGV[1]);
	while($i != -1) {
	    push (@l, $i);
	    $i = index($seq, $ARGV[1], $i+1);
	}
	if (@l) {
	    print "$id\t".join(",", @l)."\n";
	}

	# read next seq
	($id) = $_ =~ /^>(\S+)/;
	$seq = "";
    } else {
	chomp $_;
	$seq .= $_;
    }
}
close IN;

