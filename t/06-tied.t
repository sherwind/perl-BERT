# copied over from JSON and modified to use BERT

use strict;
use warnings;

use Test::More tests => 6;
use BERT;

use Tie::Hash;
use Tie::Array;

tie my %h, 'Tie::StdHash';
%h = (a => 1);

my $bert = encode_bert(\%h);
is_deeply([ unpack 'C*', $bert ],
          [
              131, 104, 3, 100, 0, 4, 98, 101, 114, 116, 100, 0, 4, 100, 105, 99, 116, 
              108, 0, 0, 0, 1, 104, 2, 109, 0, 0, 0, 1, 97, 97, 1, 106
          ]);
my $decoded = decode_bert($bert);
isa_ok($decoded, 'BERT::Dict');
is_deeply($decoded, BERT::Dict->new([ a => 1 ]));
my %decoded = @{ $decoded->value };
is_deeply(\%decoded, \%h);


tie my @a, 'Tie::StdArray';
@a = (1, 2);

$bert = encode_bert(\@a);
is_deeply([ unpack 'C*', $bert ], 
          [
              131, 107, 0, 2, 1, 2
          ]);
is_deeply(decode_bert($bert), \@a);
