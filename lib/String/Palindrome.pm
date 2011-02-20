use warnings;
use strict;
use utf8;

package String::Palindrome;

require Exporter;

use vars qw(@EXPORT_OK);
use base qw(Exporter);
@EXPORT_OK  = qw(is_palindrome);  # symbols to export on request


# ABSTRACT: Determine if a string is a palindrome

=encoding utf8

=head1 SYNOPSIS

    use String::Palindrome qw/ is_palindrome /;


    #  Simple strings

    my $is     = 'abccba';
    my $is_not = 'abcdef';

    is_palindrome( $is      );  # 1

    is_palindrome( $is_not  );  # 0

    is_palindrome( {a => 1} );  # undef
    is_palindrome(          );  # undef



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

Returns true if the string, array, or array_ref is a palindrome.  If more than
one parameter is passed to the function, then it will blindly assume that you
want to treat them as an array to be tested.  This means that you could,
theoretically, pass in a palindrome of array_refs and it would still pass.

If only one arg is passed, then it is first checked to see if it is an array
ref.  If it is an array ref it is treated as a normal array.  If it is a simple
scalar, then it is treated as a string.  If it is any other type of ref, then
undef is returned.  Additionally, a blank array ref also returns undef.

=cut


sub is_palindrome {  ## no critic 'Subroutines::RequireArgUnpacking'
    #  Get the args out
    my $arg  =  @_ > 1  ?  \@_
             :             $_[0]
             ;

    #  If no arg was given, then return undef
    if ( !defined $arg ) {
        return;
    }

    #  Check to see if we're dealing with a reference
    elsif  (ref $arg) {
        #  Return immediately if this isn't an array ref or the array ref
        #  contains no values
        return  unless  ref $arg eq 'ARRAY';
        return  unless  @$arg;

        for  (my ($i, $j) = (0, $#{$arg});  $i < $j;  $i++, $j--) {  ## no critic 'ControlStructures::ProhibitCStyleForLoops ValuesAndExpressions::ProhibitCommaSeparatedStatements'
            my ($a, $b) = @{$arg}[$i, $j];
            if  (!defined $a) {
                return 0  if  defined $b;
            }
            elsif (!defined $b) {
                return 0;
            }
            else {
                return 0  unless  $a eq $b;
            }
        }
        return 1;
    }

    else {
        return  ($arg ne q{}  and  $arg eq reverse $arg)  ?  1  :  0;
    }
}


1; # End of String::Palindrome
