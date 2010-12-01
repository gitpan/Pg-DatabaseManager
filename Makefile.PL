
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Manage installation and migration of an application\'s (Postgres) database',
  'AUTHOR' => 'Dave Rolsky <autarch@urth.org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.88'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Pg-DatabaseManager',
  'EXE_FILES' => [],
  'LICENSE' => 'artistic_2',
  'NAME' => 'Pg::DatabaseManager',
  'PREREQ_PM' => {
    'DBI' => '0',
    'File::Slurp' => '0',
    'File::Which' => '0',
    'List::AllUtils' => '0',
    'Moose' => '0',
    'MooseX::Getopt' => '0',
    'MooseX::Params::Validate' => '0.15',
    'MooseX::StrictConstructor' => '0',
    'MooseX::Types' => '0',
    'MooseX::Types::Path::Class' => '0',
    'Path::Class' => '0',
    'Pg::CLI' => '0.04',
    'Test::Differences' => '0',
    'Test::More' => '0.88',
    'autodie' => '0',
    'namespace::autoclean' => '0'
  },
  'VERSION' => '0.04',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



