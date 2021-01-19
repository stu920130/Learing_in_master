#!/usr/bin/perl -w

# usage: pairedsoftdeg.pl GDS4938.soft 3,8,13,18,23,27 5,10,15,20,25,29

### remember that there will be \n in the back of the $_
### compare string equeal is "eq", remember to type a space before and after
@c1=split(",", $ARGV[1]);
@c2=split(",", $ARGV[2]);

open(IN, "<$ARGV[0]");

# find "!dataset_table_begin" and stop
while(<IN>) {
    if ($_ eq "!dataset_table_begin\n") {
	<IN>;
	last;
    }
}

# find "!dataset_table_end" and stop
while(<IN>) {
    if ($_ eq "!dataset_table_end\n") {
	last;
    }
    chomp $_;
    @de=();
    @a=split("\t", $_);
    for($i=0;$i<$#c1;$i++) {
	$de=$a[$c2[$i-1]]-$a[$c1[$i]-1];
	push(@de,$de);
    }
    print "$a[0]\t$a[1]\t".join("\t",@de)."\n";
}
close IN;
