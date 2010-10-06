use strict;
use warnings;

use Test::More tests => 10;

{
    package Basic::Log::Test;

    use Moose;
    with 'MooseX::Log::Syslog::Fast';

    1;
}


my $obj = new Basic::Log::Test;

isa_ok($obj, 'Basic::Log::Test');


for my $item (qw/logger can proto hostname port facility severity sender name/) {
    ok($obj->can($item), 'Role method $item exists');
}

1;


