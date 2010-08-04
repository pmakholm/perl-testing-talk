
#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';

my $NOW; 
BEGIN {
    $NOW = time();

    *CORE::GLOBAL::time = sub {
        return $NOW;
    };
}

use Queue::Timed;

my $queue = Queue::Timed->new();

$queue->enqueue( 42 );

$NOW += 5;

is( $queue->wait_time, 5, "Wait time is now 5");

$NOW += 5;

is( $queue->wait_time, 10, "Wait time is now 10");

$NOW += 5;

is( $queue->wait_time, 15, "Wait time is now 15");

