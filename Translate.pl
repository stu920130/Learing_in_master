#!/usr/bin/perl -w

# usage: translate.pl FASTA

# get translated protein sequneces

open(IN, "<$ARGV[0]") || die "open $ARGV[0]: $!\n";
while(<IN>) {
    $id = $_;
    $seq = <IN>; chomp $seq;
    $seq =~ tr/T/U/;

    $aa = "";
    # window = 3
    # try length($seq)-2
    # stop condon > *, but seq still translate
    for($i=0;$i<length($seq)-2;$i+=3) {
	$w = substr($seq, $i, 3);
	$p = CodonToAA($w);
	$aa .= $p;
    }
    print "$id$aa\n";
}
close IN;

# input is a RNA codon, length = 3
sub CodonToAA {
    $codon = $_[0];

    # first: G
    if ($codon =~ /^GU/) {
	return "V";
    } elsif ($codon =~ /^GC/) {
	return "A";
    } elsif ($codon =~ /^GA/) {
	if ($codon =~ /U$/ || $codon =~ /C$/) {
	    return "D";
	} else {
	    return "E";
	}
    } elsif ($codon =~ /^GG/) {
	return "G";
    # first: A
    } elsif ($codon =~ /^AU/) {
	if ($codon =~ /G$/) {
	    return "M";
	} else {
	    return "I";
	}
    } elsif ($codon =~ /^AC/) {
	return "T";
    } elsif ($codon =~ /^AA/) {
	if ($codon =~ /U$/ || $codon =~ /C$/) {
	    return "N";
	} else {
	    return "K";
	}
    } elsif ($codon =~ /^AG/) {
	if ($codon =~ /U$/ || $codon =~ /C$/) {
	    return "S";
	} else {
	    return "R";
	}
    # first: C
    } elsif ($codon =~ /^CU/) {
	return "L";
    } elsif ($codon =~ /^CC/) {
	return "P";
    } elsif ($codon =~ /^CA/) {
	if ($codon =~ /U$/ || $codon =~ /C$/) {
	    return "H";
	} else {
	    return "Q";
	}
    } elsif ($codon =~ /^CG/) {
	return "R";
    # first: U
    } elsif ($codon =~ /^UU/) {
	if ($codon =~ /U$/ || $codon =~ /C$/) {
	    return "F";
	} else {
	    return "L";
	}
    } elsif ($codon =~ /^UC/) {
	return "S";
    } elsif ($codon =~ /^UA/) {
	if ($codon =~ /U$/ || $codon =~ /C$/) {
	    return "T";
	} else {
	    return "*";
	}
    } elsif ($codon =~ /^UG/) {
	if ($codon =~ /U$/ || $codon =~ /C$/) {
	    return "C";
	} elsif ($codon =~ /G$/) {
	    return "T";
	} else {
	    return "*";
	}
    }
}
