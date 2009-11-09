use inc::Module::Install 0.91;
use Module::Install::ReadmeFromPod;

all_from 'lib/IPC/ShellCmd.pm';

requires 'IO::Pipe';
requires 'Scalar::Util';
requires 'String::ShellQuote';

resources repository => 'http://goatse.co.uk/~bobtfish/IPC-ShellCmd/.git';

WriteAll;
