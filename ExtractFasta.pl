#!/usr/bin/perl -w

# usage: ExtractFasta.pl FASTA ID(command line or file
# command line: ID1,ID2,ID3,ID4

# take a FASTA file and output the desired sequences in FASTA format
# no space in input IDs
# pick FASTA file ID sperate by space (not all ID)

%eid = ();

# save ID information in the hash

# IDs in file
if (-e $ARGV[1]) {
    open(IN, "<$ARGV[1]");
    while(<IN>) {
	chomp $_;
	$eid{$_} = 1;
    }
    close IN;
# IDs in command line
} else {
    # many IDs
    if ($ARGV[1] =~ /\,/) {
	@i = split(",", $ARGV[1]);
	foreach $e (@i) {
	    $eid{$e} = 1;
	}
    # only one ID
    } else {
	$eid{$ARGV[1]} = 1;
    }
}


# open FASTA file
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
$id = <IN>;
($id) = $id =~ />(\S+)/;
$seq = "";

while(<IN>) {
    chomp $_;
    if (/^>/) {
	if ($eid{$id}) {
	    print "$_\n$seq\n";
	}
	($id) = $_ =~ />(\S+)/;
	$seq = "";
    } else {
	chomp $_;
	$seq .= $_;
    }
}
close IN;
    
