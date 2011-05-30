#!/usr/bin/env perl

use strict;

{

    package ExampleLog;

    use FindBin qw($Bin);
    use lib "$Bin/lib";

    use Moose;
    with 'Role::Log::Syslog::Fast';

    sub BUILD {
        my $self = shift;
        $self->_hostname('/var/run/syslog');
        $self->_name('Example');
    }

    sub test {
        my $self = shift;
        $self->log('foo');
    }

}

my $obj = new ExampleLog;

$obj->test;

1;

