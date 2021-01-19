#!/usr/bin/perl -w

# usage: cut.pl [options] file
# options:
# which columns => -f: 5,6,7
# split by which delimiter => -d : "\t"


use strict;
use Getopt::Long;

# set options
my $f;
my $d = "\t";
GetOptions(
    "f=i" => \$f,
    "d=s" => \$d
    );


# pick wanted columns
my @c = split(",", $f);

# cut file
open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while (<IN>) {
    chomp $_;
    my @a = split($d, $_);
    my @o = map(defined($a[$_-1])?$a[$_-1]:"", @c);
    print join("\t", @o)."\n";
}
close IN;

# write by myself
=head1
# which column want to cut
# index in ARGV and in array are different
@c=split(",", $ARGV[1]);
@c=map($_-1, @c);

# open file and cut file then output
open(IN, "<$ARGV[0]");
while(<IN>) {
    @o=();
    chomp $_;
    @a=split("\t", $_);
    foreach $e (@c) {
	push(@o, $a[$e]);
    }
    print join("\t", @o)."\n";
}
close IN;
=cut
