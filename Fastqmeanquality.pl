#!/usr/bin/perl -w

# usage: fastqmeanquality.pl FASTQ

# output: mean quality from 1 to last

%allqa = ();
%base = ();

# open FASTA file and count mean quality of each sequence
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while(<IN>) {
    $seq = <IN>; chomp $seq;
    <IN>;
    $qa = <IN>; chomp $qa;

    @qanum = map(ord($_)-33, split("", $qa));

    # first site: baseQA,   1: 30
    # count each site how many bases are there
    for($i=0;$i<@qanum;$i++) {
	$allqa{$i} += $qanum[$i];
	$base{$i} += 1;
    }

}
close IN;

# print site
foreach $n (sort{$a <=> $b} (keys %base)) {
    $s = $n+1;
    print "$s\t";
}
print "\n";
# print base quality
foreach $n (sort{$a <=> $b} (keys %allqa)) {
    $q = $allqa{$n} / $base{$n};
    $q = sprintf "%.2f", $q;
    print "$q\t";
}
print "\n";
