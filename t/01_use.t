use strict;
use warnings;
use Test::More;

do {
    use_ok($_)
    or BAIL_OUT
} for qw/
    IPC::ShellCmd
    IPC::ShellCmd::Generic
    IPC::ShellCmd::SSH
    IPC::ShellCmd::Sudo
/;

done_testing;
