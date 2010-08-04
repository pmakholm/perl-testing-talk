#!/usr/bin/perl

use strict;
use warnings;

use Test::More 'no_plan';
use Queue::Timed;

my $queue = Queue::Timed->new();

$queue->enqueue( 42 );

sleep 5;

is( $queue->wait_time, 5, "Wait time is now 5");

sleep 5;

is( $queue->wait_time, 10, "Wait time is now 10");

sleep 5;

is( $queue->wait_time, 15, "Wait time is now 15");

