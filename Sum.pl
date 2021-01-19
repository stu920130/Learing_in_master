#!/usr/bin/perl -w

# usage: sum.pl [opetions] file
# usage: sum.pl [opntions] numbers(5 3 1 2 9)

use strict;
use Getopt::Long;

# set options
my $f = 1;
my $d = "\t";
GetOptions(
    "f=i" => \$f,
    "d=s" => \$d
    );

$f --;
my @o;
my $s = 0;

# open file, sum and output
if (-e $ARGV[0]) {

    open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
    while (<IN>) {
	chomp $_;
	my @a = split($d, $_);
	$s += $a[$f];
    }
    close IN;


    print "$s\n";

# input command line, sum and output
} else {
    for (my $i=0;$i<=$#ARGV;$i++) {
	$s += $ARGV[$i];
    }
    print "$s\n";
}
