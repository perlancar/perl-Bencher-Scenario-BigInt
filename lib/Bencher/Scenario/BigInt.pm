package Bencher::Scenario::BigInt;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark arbitrary size integer arithmetics',
    participants => [
        {
            name => '1k-Math::BigInt',
            module=>'Math::BigInt',
            code_template => 'my $val; for (1..1000) { $val = Math::BigInt->new(q(<num1>))+Math::BigInt->new(q(<num2>)) + Math::BigInt->new(q(<num1>)) * Math::BigInt->new(q(<num2>)) } $val'
        },
        {
            name => '1k-Math::GMP',
            module=>'Math::GMP',
            code_template => 'my $val; for (1..1000) { $val = Math::GMP->new(q(<num1>))+Math::GMP->new(q(<num2>)) + Math::GMP->new(q(<num1>)) * Math::GMP->new(q(<num2>)) } $val'
        },
        {
            name => '1k-native',
            tags => ['no-big'],
            code_template => 'my $val; for (1..1000) { $val = <num1>+<num2> + <num1> * <num2> } $val'
        },
    ],
    datasets => [
        {name=>'1e1', args=>{num1=>"10", num2=>"20"} },
        {name=>'1e100', args=>{num1=>"1".("0"x100), num2=>"2".("0"x100)}, exclude_participant_tags=>['no-big'] },
    ],
};

1;
# ABSTRACT:
