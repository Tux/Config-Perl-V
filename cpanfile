requires   "Config";

on "configure" => sub {
    requires   "ExtUtils::MakeMaker";

    recommends "ExtUtils::MakeMaker"      => "7.22";

    suggests   "ExtUtils::MakeMaker"      => "7.72";
    };

on "test" => sub {
    requires   "Test::More";
    requires   "Test::NoWarnings";
    };
