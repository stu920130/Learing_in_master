#!/usr/bin/perl -w

# usage: humanmicroRNAtargetsite.pl seed fasta

# open seed file, convert to the reverse template, andt save seeds to hash
%seed = ();

open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

while(<IN>) {
    chomp $_;
    @s = split("\t", $_);
    $mirna = reverse($s[1]);
    $mirna =~ tr/actgACTG/tgacTGAC/;
    $seed{$s[0]} = $mirna;
}
close IN;

@mir = sort(keys %seed);

# and then open the file, if the seed exit in FASTA, print location
open(IN, "<$ARGV[1]") || die "open $ARGV[1]: $!\n";

while(<IN>) {
    chomp $_;
    ($id) = $_ =~ /^>(\S+)/;
    $seq = <IN>; chomp $seq;
    foreach $e (@mir) {
	@l = ();
	$i = index($seq, $seed{$e});
	while($i != -1) {
	    push(@l, $i);
	    $i = index($seq, $seed{$e}, $i+1);
	}
	if (@l) {
	    print "$id\t$e\t".join(",", @l)."\n";
	}
    }
}
close IN;   
