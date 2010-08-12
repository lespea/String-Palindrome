package String::Palindrome;

use warnings;
use strict;

require Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA        = qw(Exporter);
@EXPORT_OK  = qw(is_palindrome);  # symbols to export on request


#ABSTRACT: Determine if a string is a palindrome


=head1 SYNOPSIS

    use String::Palindrome qw/ is_palindrome /;

    #  Simple strings
    my $is     = 'abccba';
    my $is_not = 'abcdef';

    is_palindrome( $is      );  # 1
    is_palindrome( $is_not  );  # 0
    is_palindrome( {a => 1} );  # undef


    #  Arrays
    my @is     = qw/ a ab cc ab a /;
    my @is_not = qw/ a ab cc a ba /;

    is_palindrome(  @is     );  # 1
    is_palindrome( \@is     );  # 1
    is_palindrome(  @is_not );  # 0
    is_palindrome( \@is_not );  # 0
    is_palindrome( []       );  # undef

=head1 EXPORTS

=for :list
* is_palindrome

=cut

=func is_palindrome

Returns true if the string is a palindrome.  Currently, passing a ref will also
cause an undef to return and a blank string is reported as not a palindrome.

=cut

sub is_palindrome {
    my $str = shift;

    return undef
        if (!defined $str  or  ref $str);

    return  ($str ne q{}  and  $str eq scalar reverse $str)  ?  1  :  0;
}


1; # End of String::Palindrome
