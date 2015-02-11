#!/pro/bin/perl

use strict;
use warnings;

use Getopt::Long qw(:config bundling nopermute);
my $check = 0;
my $opt_v = 0;
GetOptions (
    "c|check"		=> \$check,
    "v|verbose:1"	=> \$opt_v,
    ) or die "usage: $0 [--check]\n";

use lib "sandbox";
use genMETA;
my $meta = genMETA->new (
    from    => "V.pm",
    verbose => $opt_v,
    );

$meta->from_data (<DATA>);

if ($check) {
    $meta->check_encoding ();
    $meta->check_required ();
    $meta->check_minimum ();
    $meta->done_testing ();
    }
elsif ($opt_v) {
    $meta->print_yaml ();
    }
else {
    $meta->fix_meta ();
    }

__END__
--- #YAML:1.0
name:                    Config-Perl-V
version:                 VERSION
abstract:                Structured data retrieval of perl -V output
license:                 perl
author:              
    - H.Merijn Brand <h.m.brand@xs4all.nl>
generated_by:            Author
distribution_type:       module
provides:
    Config::Perl::V:
        file:            V.pm
        version:         VERSION
requires:     
    perl:                5.006
    Config:              0
configure_requires:
    ExtUtils::MakeMaker: 0
build_requires:
    perl:                5.006
test_requires:
    Test::More:          0
    Test::NoWarnings:    0
resources:
    license:             http://dev.perl.org/licenses/
    repository:          http://repo.or.cz/w/Config-Perl-V.git
meta-spec:
    version:             1.4
    url:                 http://module-build.sourceforge.net/META-spec-v1.4.html
