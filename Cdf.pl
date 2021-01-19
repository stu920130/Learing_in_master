#!/usr/bin/perl -w

# usage: cdf.pl file
# cumulative distribution curve

%h=();
$sum=0;

# open the file and save file to hash
open(IN, "<$ARGV[0]");
while(<IN>) {
    chomp $_;
    $h{$_}+=1;
    $sum++;
}
close IN;

# print cumulative distribution curve
foreach $e (sort{$a<=>$b}(keys %h)) {
    $s+=($h{$e}/$sum);
    print "$e\t$s\n";
}
