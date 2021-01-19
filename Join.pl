#!/usr/bin/perl -w

# usage: join.pl [options] file1 file2
# based on file1

# which column are same in two files
# options: -f1 5 -f2 3

# pick which columns want to combines
# options: 

use strict;
use Getopt::Long;

# set options
my $f1 = 1;
my $f2 = 1;
GetOptions(
    "f1=i" => \$f1,
    "f2=i" => \$f2
    );

$f1 --;
$f2 --;

my %join=();

# open file2, and put they into a hash
open(IN, "$ARGV[1]") || die "open $ARGV[1]: $!\n";
while(<IN>) {
    chomp $_;
    my @a = split("\t", $_);
    my @cut = @a;
    splice(@cut, $f2, 1);
    @{$join{$a[$f2]}} = @cut;

}
close IN;


# open file1, and combine two data
open(IN, "$ARGV[0]") || die "open $ARGV[0]: $\n";
while(<IN>) {
    chomp $_;
    my @a = split("\t", $_);
    my @cut = @a;
    splice(@cut, $f1, 1);
    if($join{$a[$f1]}) {
	print "$a[$f1]\t".join("\t", @cut)."\t".join("\t", @{$join{$a[$f1]}})."\n";
    } else {
	print "$a[$f1]\t".join("\t", @cut)."\t---\n";
    }
}
close IN;
