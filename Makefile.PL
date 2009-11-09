use inc::Module::Install 0.91;
use Module::Install::ReadmeFromPod;

all_from 'lib/IPC/ShellCmd.pm';
readme_from 'lib/IPC/ShellCmd.pm';

requires 'IO::Pipe';
requires 'Scalar::Util';
requires 'String::ShellQuote';

test_requires 'Test::More' => '0.88';

resources repository => 'http://goatse.co.uk/~bobtfish/IPC-ShellCmd/.git';

WriteAll;
