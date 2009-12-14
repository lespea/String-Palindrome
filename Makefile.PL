use strict;
use warnings;

use inc::Module::Install;

name     'String-Palindrome';
all_from 'lib/String/Palindrome.pm';
author   q{Adam Lesperance <lespea@cpan.org>};
license  'perl';

requires        'Carp';
test_requires   'Test::More';

#auto_install;

sign 1;

WriteAll;
