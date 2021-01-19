#!/usr/bin/perl -w

# usage: fibonacci.pl number(5)
# there will be 5 fibonacci numbers

# first way

$s1 = 1;
$s2 = 1;
$add = 0;

# print "$s1, $s2";

for ($i=2;$i<$ARGV[0];$i++) {
    $add = $s1 + $s2;
    $s1 = $s2;
    $s2 = $add;
    # print ", $add";
}

# print "\n";


# print "-----\n";

# second way

@f = (1,1);

for (my $i=2;$i<$ARGV[0];$i++) {
    $f[$i] = $f[$i-2] + $f[$i-1];
}

print "@f\n";

# print "-----\n";

# @a = (1,1);
# $a[2] = 5;
# print "@a\n";
