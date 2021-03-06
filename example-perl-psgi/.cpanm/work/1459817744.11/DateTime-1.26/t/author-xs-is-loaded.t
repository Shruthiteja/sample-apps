
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

use Test::More;

use DateTime;

ok(
    !$DateTime::IsPurePerl,
    'XS implementation is loaded by default'
);

done_testing();
