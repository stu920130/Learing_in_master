#!/usr/bin/perl -w

# usage: number.pl sth

# match non-word character
if ($ARGV[0] =~ /(\W)/) {
    # match digit character
    if ($ARGV[0] =~ /(\D)$/) {
	# 7.18e-5wer, -e
	print "It is NOT a number\n";
    } else {
	# +2, -1, 7.18e-5
	print "It is a number\n";
    }
} else {
    if ($ARGV[0] =~ /(\D)/) {
	# wer, how r u, er234, 234ee
	print "It is NOT a number\n";
    } else {
	# 2
	print "It is a number\n";
    }
}
