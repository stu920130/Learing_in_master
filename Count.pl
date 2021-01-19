#!/usr/bin/perl -w
# usage: count.pl file

%uni=();

# load data and count
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

while(<IN>) {
    chomp $_;
    $uni{$_}++;
}
close IN;

# sort element by count and output
foreach $i (sort{$uni{$b}<=>$uni{$a}}(keys %uni)) {
    print "$i\t$uni{$i}\n";
}

