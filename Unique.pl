#!/usr/bin/perl -w

# usage: unique.pl file

%uni=();

# open files, load lines
open(IN, "<$e");
while(<IN>){
    chomp $_;
    $uni{$_}=1;
}
close IN;


# pick unique lines
foreach (sort(keys %uni)) {
    print "$_\n";
}
