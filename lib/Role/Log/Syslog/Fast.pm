
package Role::Log::Syslog::Fast;

use Moose::Role;
use Log::Syslog::Fast ':all';

our $VERSION = '0.12';

has '_proto' => (
    is      => 'rw',
    isa     => 'Int',
    default => LOG_UNIX
);

has '_hostname' => (
    is      => 'rw',
    isa     => 'Str',
    default => '/dev/log'
);

has '_port' => (
    is      => 'rw',
    isa     => 'Int',
    default => 514
);

has '_facility' => (
    is      => 'rw',
    isa     => 'Int',
    default => LOG_LOCAL0
);

has '_severity' => (
    is      => 'rw',
    isa     => 'Int',
    default => LOG_INFO
);

has '_sender' => (
    is      => 'rw',
    isa     => 'Str',
    default => 'localhost'
);

has '_name' => (
    is      => 'rw',
    isa     => 'Str',
    default => 'MooseX-Log-Syslog-Fast'
);

has '_logger' => (
    is      => 'ro',
    isa     => 'Log::Syslog::Fast',
    lazy    => 1,
    default => sub { 
        my $self = shift;
        return Log::Syslog::Fast->new(
            $self->_proto, $self->_hostname, $self->_port,
            $self->_facility, $self->_severity, $self->_sender, 
            $self->_name); 
    } 
);

sub log { 
    my ($self, $msg, $time) = @_;
    return $time 
        ? $self->_logger->send($msg, $time) : $self->_logger->send($msg);
}

1;

__END__

=head1 NAME

MooseX::Log::Syslog::Fast - A Logging role for L<Moose> on L<Log::Syslog::Fast>

=head1 SYNOPSIS

    {
        package ExampleLog;

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

=head1 DESCRIPTION

A logging role building a very lightweight wrapper to L<Log::Syslog::Fast> for use with L<Moose> classes.

=head1 SEE ALSO

L<Log::Syslog::Fast>, L<Log::Syslog>, L<Moose>

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to bug-moosex-log-syslog-fast@rt.cpan.org, or through the web interface at http://rt.cpan.org.

Or come bother us in #moose on irc.perl.org.

=head1 AUTHOR

Thiago Rondon <thiago@aware.com.br>

=head1 LICENSE AND COPYRIGHT

This module is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=cut


1;



