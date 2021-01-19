#!/usr/bin/perl -w

# usage: reversecomplement.pl file.fa / a sequence / sequence_file

# reverse and print 5' to 3'

# if input is a file
if (-e $ARGV[0]) {
    open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";

    $id = <IN>;
    $seq = "";

    # file.fa
    if ($id =~ /^>/) {

	while (<IN>) {
	    if ($_ =~ /^>/) {
		$rcs = reversecomplement($seq);
		print "$id$rcs\n";
		$id = $_;
		$seq = "";
	    } else {
		chomp $_;
		$seq .= $_;
	    }
	}
	close IN;
	$rcs = reversecomplement($seq);
	print "$id$rcs\n";

    # sequence_file, notice that, HERE, $id is a DNA sequence
    } else {
	chomp $id;
	$rcs = reversecomplement($id);
	print "$rcs\n";
	while (<IN>) {
	    chomp;
	    $rcs = reversecomplement($_);
	    print "$rcs\n";
	}
	close IN;
    }

# input a sequence
} else {
    $rcs = reversecomplement($ARGV[0]);
    print "$rcs\n";
}

sub reversecomplement {
    $s = reverse($_[0]);
    return $s;
}


