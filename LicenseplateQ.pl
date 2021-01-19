#!/usr/bin/perl -w

# usage: licenseplateQ.pl sth

# focus on normal motorcycle

$l = length($ARGV[0]);

# whether there is space or sth
if ($ARGV[0] =~ /(\s+)/) {
    print "It is NOT a license plate\n";
} else {
    # if the length same, it may be license plate
    if ($l == 7) {
	# the condition to be licesnse plate, we sperate in two group, english open and english end
	if ($ARGV[0] =~ /^AAA\-/ || $ARGV[0] =~ /^A22\-/ || $ARGV[0] =~ /^AA2\-/ || $ARGV[0] =~ /^F2A\-/ || $ARGV[0] =~ /^2FA\-/) {
	    # english open, number end
	    if ((($num) = $ARGV[0] =~ /(\d+)$/) && (length($num) == 3)) {
		print "It is a license plate\n";
	    } else {
		print "It is NOT a license plate\n";
	    }
	} elsif ($ARGV[0] =~ /\-BAA$/) {
	    # number open, english end
	    if ((($num) = $ARGV[0] =~ /^(\d+)/) && (length($num) == 3)) {
		print "It is a license plate\n";
	    } else {
		print "It is NOT a license plate\n";
	    }
	}
    } else {
	print "It is NOT a license plate\n";
    }
}
