use strict;

# scalars
my $one = 1;
my $two = 2;
print $one + $two;
print "\n";

# reference to unnamed array
my $ary = [1,2,3,4,5];
print $ary;
print "\n";

# array
my @array= (1,2,3);
print \@array;
print "\n";

# accessing value of array
print $array[1];
print "\n";

# hash
my %longday = (
  "Sun" => "Sunday",
  "Mon" => "Monday",
  "Tue" => "Tuesday"
);
print \%longday;
print "\n";

# accessing value of hash
print $longday{"Mon"};
print "\n";
