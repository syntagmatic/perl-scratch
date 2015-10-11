#!/usr/bin/perl

# Parses a CSV of transactions
# Prints spending by category, total spent, and savings rate

use Parse::CSV;

$parse = Parse::CSV->new(
    file       => 'secret/expenses.csv',
    sep_char   => ',',
    quote_char => "\"",
    names      => 1,
);

# group expenses by category
while ( my $line = $parse->fetch ) {
    my $category = $$line{"Category"};
    $expenses{$category} -= $$line{"Amount"};
}

# sort categories by total expense
print "Top spending categories:\n";
foreach $key (sort { $expenses{$b} <=> $expenses{$a} } keys %expenses) {
   print $expenses{$key} . "\t$key\n";
}
print "\n\n";

# compute total expenses and savings rate
$total = 0;
foreach $key (keys %expenses) {
    $total += $expenses{$key};
}
print "Total spent: \$" . $total . "\n";
print "Savings rate: " . sprintf("%.2f", (100*$expenses{"Investments"} / $total)) . "%\n";
