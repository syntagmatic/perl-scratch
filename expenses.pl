#!/usr/bin/perl

# Parses a CSV of transactions, print out amount and description

use Parse::CSV;

$parse = Parse::CSV->new(
    file     => 'secret/expenses.csv',
    sep_char   => ',',
    quote_char => "\"",
    names    => 1,
);

while ( my $line = $parse->fetch ) {
    print "\$" .(-$$line{"Amount in USD"}) . "\t" . $$line{"Description"} . "\n";
}
