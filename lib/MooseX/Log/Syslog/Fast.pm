

package MooseX::Log::Syslog::Fast;

use Moose::Role;
use Log::Syslog::Fast ':all';

our $VERSION = '0.01';

has 'proto' => (
    is      => 'rw',
    isa     => 'Int',
    default => LOG_UNIX
);

has 'hostname' => (
    is      => 'rw',
    isa     => 'Str',
    default => '/dev/log',
);

has 'port' => (
    is      => 'rw',
    isa     => 'Int',
    default => 514
);

has 'facility' => (
    is      => 'rw',
    isa     => 'Int',
    default => LOG_LOCAL0
);

has 'severity' => (
    is      => 'rw',
    isa     => 'Int',
    default => LOG_INFO
);

has 'sender' => (
    is      => 'rw',
    isa     => 'Str',
    default => 'localhost'
);

has 'name' => (
    is      => 'rw',
    isa     => 'Str',
    default => 'MooseX-Log-Syslog-Fast'
);

has 'logger' => (
    is      => 'ro',
    isa     => 'Log::Syslog::Fast',
    lazy    => 1,
    default => sub { 
        my $self = shift;
        return Log::Syslog::Fast->new(
            $self->proto, $self->hostname, $self->port,
            $self->facility, $self->severity, $self->sender, 
            $self->name); 
    } 
);

sub log { 
    my ($self, $msg, $time) = @_;
    return $time ? $self->logger->send($msg, $time) : $self->logger->send($msg);
}

1;


