#!/usr/bin/perl
use strict;
use warnings;

my %digits = (0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine');

open my $input_fh, '<', 'src/input.txt' or die "Can't open input file $!";
open my $output_fh, '>', 'src/output.txt' or die "Can't open output file $!";

while (my $line = <$input_fh>) {
    $line =~ s/(\d)/$digits{$1}/g;
    print $output_fh $line;
}

close $input_fh;
close $output_fh;
