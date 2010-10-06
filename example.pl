#!/usr/bin/env perl
#
# Aware TI, 2010, http://www.aware.com.br
# Thiago Rondon <thiago@aware.com.br>
#


{
    package ExampleLog;

    use FindBin qw($Bin);
    use lib "$Bin/lib";

    use Moose;
    with 'MooseX::Log::Syslog::Fast';

    sub test {
        my $self = shift;
        $self->log('foo');
    }
}

my $obj = new ExampleLog;

$obj->log("foo");




1;

