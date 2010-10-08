
use inc::Module::Install '0.01';

name 'Role-Log-Syslog-Fast';
all_from 'lib/Role/Log/Syslog/Fast.pm';
license 'perl';

build_requires 'Test::More';

requires 'Moose' => 0.99;
requires 'Log::Syslog::Fast' => 0.44;

auto_install;
WriteAll;

