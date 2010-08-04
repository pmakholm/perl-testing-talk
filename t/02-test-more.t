#!/usr/bin/perl

use Test::More tests => 3;

use Queue::Timed;
my $queue = Queue::Timed->new();

ok( defined($queue),            "new returns defined value"); 
isa_ok( $queue, "Queue::Timed", "... of the right type");
is( $queue->length, 0,          "... with length 0");


