use JSON;

use warnings;

# encoding an array
my @home = ("couch", "chair", "cat");
print encode_json \@home;
print "\n";

# decoding a hash
my $json_string = '{"a" : "hi there"}';
my $hash = decode_json $json_string;

# derefernce to access a single scalar value
print $$hash{"a"};
print "\n";
