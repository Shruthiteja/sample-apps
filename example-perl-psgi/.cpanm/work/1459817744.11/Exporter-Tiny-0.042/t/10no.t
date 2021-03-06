=pod

=encoding utf-8

=head1 PURPOSE

Check C<< unimport >> works.

=head1 AUTHOR

Toby Inkster E<lt>tobyink@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENCE

This software is copyright (c) 2014 by Toby Inkster.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

use strict;
use warnings;
use Test::More tests => 7;

use lib qw( examples ../examples );

{
	package Local::Pkg1;
	use Example::Exporter;
	::is( fib(6), 8, 'fib exported' );
	no Example::Exporter;
}

ok( !Local::Pkg1->can('fib'), 'tidied fib' );

{
	package Local::Pkg2;
	use Example::Exporter fib => { -as => 'fibo' };
	::is( fibo(6), 8, 'fibo exported' );
	no Example::Exporter;
}

ok( !Local::Pkg2->can('fibo'), 'tidied fibo' );

{
	package Local::Pkg3;
	use Example::Exporter -all;
	::is( fib(6), 8, 'fib exported' );
	::is( embiggen(6), 7, 'embiggen exported' );
	no Example::Exporter qw( /^F/i );
}

ok( Local::Pkg3->can('embiggen') && !Local::Pkg3->can('fib'), 'tidied by regexp' );
