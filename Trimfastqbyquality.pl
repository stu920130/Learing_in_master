#!/usr/bin/perl -w

# usage: trimfastqbyquality.pl file.fq

# set parameters

$ws = 5;
$qc = 30;

# load fastq and trim

open(IN, "<$ARGV[0]") || die "open $ARGV: $!\n";

while(<IN>) {
    $id = $_;
    $seq = <IN>; chomp $seq;
    $qaid = <IN>;
    $qa = <IN>; chomp $qa;


    # make an array of number quality
    @qanum = map(ord($_)-33, split("", $qa));
=head
    @qanum = ();
    @qa = split("", $qa);
    for($i=0;$i<@qa;$i++) {
	$num = ord($qa[$i]) - 33;
	push(@qanum, $num);
    }
=cut

    # pick the indexes of the window
    # if the window < 5, we don't need it
    for($i=0;$i<@qanum;$i++) {
	if ($i > @qanum - $ws) {
	    $end = @qanum - 1;
	}
    
	# the window index
	@w=($i..$end);

	# calculate the sum of the window
	$sum = 0;
	foreach $e (@w) {
	    $n = $qanum[$e];
	    $sum += $n;
	}

	# whether the window of sum is bigger than quality
	if ($sum < ($qc*$ws)) {
	    last;
	}
    }

    $newseq = substr($seq, 0, $i);
    $newqa = substr($qa, 0, $i);
    
    print "$id$newseq\n$qaid$newqa\n";
}
close IN;
