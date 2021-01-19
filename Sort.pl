#!/usr/bin/perl -w

# usage: sort.pl numbers(5 6 1 2 3 1 5 6)

# sort start
@c=@ARGV;
$len=$#ARGV;
for($i=0;$i<=$len;$i++){
    $tmp=$c[0];
    for($j=0;$j<=$#c;$j++){
	if($c[$j]<=$tmp){
	    $tmp=$c[$j];
	    $index=$j;
	}
    }
    splice(@c,$index,1);
    push(@ans,$tmp);
}

foreach (@ans){
    print $_." ";
}
print "\n";


