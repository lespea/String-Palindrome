package String::Palindrome;

use warnings;
use strict;

require Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA        = qw(Exporter);
@EXPORT_OK  = qw(is_palindrome);  # symbols to export on request


=head1 NAME

String::Palindrome - Determine if a string is a palindrome

=head1 VERSION

Version 0.01

=cut

use vars qw($VERSION);
$VERSION = '0.01';


=head1 SYNOPSIS

    use String::Palindrome qw/ is_palindrome /;

    my $is     = 'abccba';
    my $is_not = 'abcdef';

    is_palindrome( $is     )  = 1;
    is_palindrome( $is_not )  = 0;

=head1 EXPORTABLE

=cut

=head2 is_palindrome

Returns true if the string is a palindrome.  Currently, passing a ref will also
cause an undef to return and a blank string is reported as not a palindrome.

=cut

sub is_palindrome {
    my $str = shift;

    return undef
        if (!defined $str  or  ref $str);

    return  ($str ne q{}  and  $str eq scalar reverse $str)  ?  1  :  0;
}

=head1 AUTHOR

Adam Lesperance, C<< <lespea at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-string-palindrome at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=String-Palindrome>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc String::Palindrome


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=String-Palindrome>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/String-Palindrome>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/String-Palindrome>

=item * Search CPAN

L<http://search.cpan.org/dist/String-Palindrome/>

=back


=head1 LICENSE AND COPYRIGHT

Copyright 2009 Adam Lesperance.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of String::Palindrome
