#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'String::Palindrome' ) || print "Bail out!
";
}

diag( "Testing String::Palindrome, $String::Palindrome::VERSION, Perl $], $^X" );
