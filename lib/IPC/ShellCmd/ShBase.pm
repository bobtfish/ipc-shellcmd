package IPC::ShellCmd::ShBase;

use strict;
use String::ShellQuote qw(shell_quote);
use Carp qw(croak);

sub new {
    my $package = shift;
    my %args = @_;

    my $self = bless { args => \%args }, $package;

    return $self;
}

sub chain {
    croak "Abstract Class";
}

sub generate_sh_cmd {
    my $self = shift;
    my $cmd = shift;
    my $args = shift;

    my $cmd_string = shell_quote(@$cmd);

    if(defined $args->{'-stdin'}) {
	$cmd_string .= ' < ' . shell_quote($args->{'-stdin'});
    }
    if(defined $args->{'-stdout'}) {
	$cmd_string .= ' > ' . shell_quote($args->{'-stdout'});
    }
    if(defined $args->{'-stderr'}) {
	$cmd_string .= ' 2> ' . shell_quote($args->{'-stderr'});
    }

    if($args->{'-env'}) {
	for my $k (keys %{$args->{'-env'}}) {
	    $cmd_string = $k . "=" . shell_quote($args->{'-env'}->{$k}) . ' ' .
		$cmd_string;
	}
    }

    if(defined $args->{'-umask'}) {
	$cmd_string = sprintf('umask 0%o && %s', $args->{'-umask'}, $cmd_string);
    }

    if(defined $args->{'-wd'}) {
	$cmd_string = sprintf('cd %s && %s', shell_quote($args->{'-wd'}),
	    $cmd_string);
    }

    return $cmd_string;
}

1;
