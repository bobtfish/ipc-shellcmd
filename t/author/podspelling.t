use strict;
use warnings;
use Test::More;
use Test::Spelling 0.11;

set_spell_cmd 'aspell list';
add_stopwords(<DATA>);
all_pod_files_spelling_ok;

__DATA__
stdout
stdin
stderr
