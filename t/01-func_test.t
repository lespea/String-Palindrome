#!perl -T

use Test::More;
use String::Palindrome qw/ is_palindrome /;

my @ok    = qw/ qwerrewq 12344321 axc3223cxa a aa aaaaaaa aaabaaa /;
my @nok   = qw/ asdf fejal aabab asdf 1343 /; push @nok, q{};
my @undef = ([], {a => 1}, undef);

# POD examples
push @ok,  'abccba';
push @nok, 'abcdef';

plan tests => scalar @ok + scalar @nok + scalar @undef;


for  my $ok  (@ok) {
    is(is_palindrome($ok), 1, "($ok) not reported as a palindrome");
}

for  my $nok  (@nok) {
    is(is_palindrome($nok), 0, "($nok) reported as a palindrome");
}

for  my $undef  (@undef) {
    is(is_palindrome($undef), undef, "item not reported as a undef");
}
