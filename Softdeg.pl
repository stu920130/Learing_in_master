#!/usr/bin/perl -w

# usage: softdeg.pl GDS4938.soft 3,8,13,18,23,27 5,10,15,20,25,29

# apply t-tset to compare expressions of the two specified groups of samples

use strict;
use Statistics::TTest;

my @c1 = split(",", $ARGV[1]);
my @c2 = split(",", $ARGV[2]);

open(IN, "<$ARGV[0]");

# find "!dataset_table_begin" and stop
while(<IN>) {
    if ($_ eq "!dataset_table_begin\n") {
	<IN>;
	last;
    }
}

# data start
# find "!dataset_table_end" and stop
print "probe_ID\tgene_name\tmean_expre1\tmean_expre2\tdif_mean_expre\t_p_value\n";

my %ptoall = ();

while(<IN>) {
    if ($_ eq "!dataset_table_end\n") {
	last;
    }
    chomp $_;
    my @e1 = ();
    my @e2 = ();
    my @a = split("\t", $_);

    # save each gene to array
    # use map is better !!!!!!!!!
    # @e1 = map($a[$_-1], @c1);
    # @e2 = map($a[$_-1], @c2);
    for(my $i=0;$i<@c1;$i++) {
	push(@e1, $a[$c1[$i]-1]);
	push(@e2, $a[$c2[$i]-1]);
    }

    # get mean
    my $m1 = Mean(\@e1);
    my $m2 = Mean(\@e2);
    my $dm = $m1 - $m2;

    $m1 = sprintf "%.5f", $m1;
    $m2 = sprintf "%.5f", $m2;
    $dm = sprintf "%.5f", $dm;

    # caculate t-test
    my $ttest = new Statistics::TTest;
    $ttest -> load_data(\@e1, \@e2);
    my $p = $ttest -> {t_prob};

    # all data save to hash, p-value: (id, gene name, mean1, mean2, diff_mean)
    push(@{$ptoall{$p}}, $a[0]);
    push(@{$ptoall{$p}}, $a[1]);
    push(@{$ptoall{$p}}, $m1);
    push(@{$ptoall{$p}}, $m2);
    push(@{$ptoall{$p}}, $dm);
}
close IN;

foreach my $e (sort{$a <=> $b} (keys %ptoall)) {
    print join("\t", @{$ptoall{$e}})."\t$e\n";
}


sub Mean {
    my $s = 0;
    foreach my $e (@{$_[0]}) {
	$s += $e;
    }
    return $s/@{$_[0]};
}
