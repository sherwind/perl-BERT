use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'BERT',
    AUTHOR              => q{Sherwin Daganato <sherwin@daganato.com>},
    VERSION_FROM        => 'lib/BERT.pm',
    ABSTRACT_FROM       => 'lib/BERT.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'BERT-*' },
);
