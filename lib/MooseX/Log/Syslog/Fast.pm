
package MooseX::Log::Syslog::Fast;

use Moose::Role;
use Log::Syslog::Fast ':all';

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

sub BUILD { 
    my $self = shift;
    $self->_hostname('/var/run/syslog') if -r '/var/run/syslog';
}

sub log { 
    my ($self, $msg, $time) = @_;
    return $time 
        ? $self->_logger->send($msg, $time) : $self->_logger->send($msg);
}

1;


