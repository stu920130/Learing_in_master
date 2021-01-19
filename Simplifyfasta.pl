#!/usr/bin/perl -w

# usage: simplifyfasta.pl fa

# use on if the are \n each sequences

open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

$id = <IN>;
$seq = "";

while (<IN>) {
    # @a = split "\t";
    if ( /^>/ ) {
	print "$id$seq\n";
	$id = $_;
	$seq = "";
    } else {
	chomp $_;
	$seq .= $_;
    }
}
close IN;

print "$id$seq\n";
