
use inc::Module::Install '0.01';

name 'MooseX-Log-Syslog-Fast';
all_from 'lib/MooseX/Log/Syslog/Fast.pm';

build_requires 'Test::More';

requires 'Moose' => 0.99;
requires 'Log::Syslog::Fast' => 0.44;

auto_install;
WriteAll;

