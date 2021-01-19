#!/usr/bin/perl -w

# usage: GCcontent.pl FASTA

# output: percentage of C and G bases in the genome

# open the file and count
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
$id = <IN>;
($id) = $id =~ /^>(\S+)/;
$seq = "";
while(<IN>) {
    if (/^>/) {
	@s = split("", $seq);
	
	$cg = 0;
	foreach $e (@s) {
	    if ($e eq "C" || $e eq "G") {
		$cg += 1;
	    }
	}

	$p = ($cg / length($seq)) * 100;
	# get 1.22 not 1.22222222
	$p = sprintf "%.2f", $p;
	print "$id\t$p%\n";

	# read next seq
	($id) = $_ =~ />(\S+)/;
	$seq = "";
    } else {
	chomp $_;
	$seq .= $_;
    }
}
close IN;
