#!/usr/bin/perl -w

# usage: microRNAseed.pl mature.fa

# output:
# microrna_name seed sequence

# open file
# if >, print name
# if seq, print seed seuqence
open(IN, "<$ARGV[0]");
while(<IN>) {
    if (grep(/^>/, $_)) {
	@l = split(" ", $_);
	$id = substr($l[0], 1);
	print "$id\t";
    } else {
	$seq = substr($_, 1, 6);
	print "$seq\n";
    }
}
close IN;


# it can also read <IN> in while

=head
while(<IN>) {
    @a = split(" ", $_);
    $id = substr($a[0], 1);
    
    $seq = <IN>;
    $seed = substr($seq, 1, 6);
    
    print "$id\t$seed\n";
}
=cut
