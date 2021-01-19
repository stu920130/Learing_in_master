#!/usr/bin/perl -w

# usage: intersection.pl files(fileA fileB fileC ...)
# at least two files

%inc=();

# each file pick unique elements fisrt
foreach $f (@ARGV) {
    open(IN, "<$f");
    %uni=();
    while(<IN>) {
	chomp $_;
	$uni{$_}=1;
    }
    close IN;

    # count each unique elements
    foreach $e (keys %uni) {
	$inc{$e}++;
    }
}

# ouput the file
foreach $e (keys %inc) {
    if($inc{$e}>1) {
	print "$e\n";
    }
}
