#!/usr/bin/perl
use strict;
use warnings;

open my $fh, '<', 'src/electricity.txt' or die "Can't open file $!";
my %frequency;
my @words;

while (my $line = <$fh>) {
    chomp $line;
    my @line_words = split ' ', $line;
    push @words, @line_words;
    foreach my $word (@line_words) {
        $frequency{$word}++;
    }
}

# Sort alphabetically (ignoring capitalization)
my @sorted_words = sort {lc($a) cmp lc($b)} @words;
print join(' ', @sorted_words), "\n";

# Sort alphabetically with upper case words just in front of lower case words with the same initial characters
@sorted_words = sort {$a cmp $b} @words;
print join(' ', @sorted_words), "\n";

# Sort by frequency, from high to low, (any order for equal frequency)
@sorted_words = sort {$frequency{$b} <=> $frequency{$a}} @words;
print join(' ', @sorted_words), "\n";

# Sort by frequency, with alphabetical order for words with the same frequency
@sorted_words = sort {$frequency{$b} <=> $frequency{$a} || $a cmp $b} @words;
print join(' ', @sorted_words), "\n";

close $fh;
