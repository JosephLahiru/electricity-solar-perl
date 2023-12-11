#!/usr/bin/perl
use strict;
use warnings;

open my $fh, '<', 'src/solar.txt' or die "Can't open file $!";

while (my $line = <$fh>) {
    chomp $line;
    my @fields = split ' ', $line;

    # Print all records that do not list a discoverer in the eighth field
    if (!defined $fields[7]) {
        print "$line\n";
    }

    # Print every record omitting the second field
    splice @fields, 1, 1;
    print join(' ', @fields), "\n";

    # Print the records for satellites that have negative orbital periods
    if ($fields[4] < 0) {
        print "$line\n";
    }

    # Print the data for the objects discovered by the Voyager2 space probe
    if ($fields[7] eq 'Voyager2') {
        print "$line\n";
    }

    # Print each record with the orbital period given in seconds rather than days
    $fields[4] *= 24 * 60 * 60; # Convert days to seconds
    print join(' ', @fields), "\n";
}

close $fh;
