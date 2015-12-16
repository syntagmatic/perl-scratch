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

# compute total expenses and savings rate
$total = 0;
foreach $key (keys %expenses) {
    $total += $expenses{$key};
}

# sort categories by total expense
print "\nSpending by category:\n\n";
foreach $key (sort { $expenses{$b} <=> $expenses{$a} } keys %expenses) {
    print sprintf("%-14s", $key) . "\t" . sprintf("%5.2f", (100*$expenses{$key} / $total)) . "%\t\t" . sprintf("\$%9.2f", $expenses{$key}) . "\n";
}
print "\n\n";

# print total expenses and savings rate
print "Total spent: \$" . $total . "\n";
print "Savings rate: " . sprintf("%.2f", (100*$expenses{"Investments"} / $total)) . "%\n";
