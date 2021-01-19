#!/usr/bin/perl -w

# usage: union.pl files(file1 file2 file3 ...)


%uni=();

# open files and pick union
foreach $f (@ARGV) {
    open(IN, "<$f");
    while(<IN>) {
	chomp $_;
	$uni{$_}=1;
    }
    close IN;
}

# print union
foreach $e (sort(keys %uni)) {
    print "$e\n";
}
