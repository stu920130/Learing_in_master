#!/usr/bin/perl -w

# usage: Bincount.pl file min max interval(50 100 10)
# output:
# 90-<100 0
# 70-<90  1

use Getopt::Long;

# set options

$min=$ARGV[1];
$max=$ARGV[2];
$inter=$ARGV[3];
@r=();
@a=();
# we use count to save the count data, while keys: index of @r, values: count
%count=();

# make an array and a hash of bins 
for($i=0;$i<=($max-$min)/$inter;$i++) {
    if ($i!=($max-$min)/$inter) {
	$count{$i}=0;
    }
    $n=$min+($inter*$i);
    push(@r, $n);
}


# open the file and save to array
open(IN, "<$ARGV[0]");
while(<IN>) {
    chomp $_;
    push(@a, $_);
}
close IN;


# compare data to bins and save the information to hash
foreach $num (@a) {
    for ($i=0;$i<$#r;$i++) {
	if ($num>=$r[$i] && $num<$r[$i+1]) {
	    $count{$i}+=1;
	    last;
	}
    }
}

# print the data
foreach $c (sort {$b<=>$a} (keys %count)) {
    print "$r[$c]-<$r[$c+1]\t$count{$c}\n"
}
