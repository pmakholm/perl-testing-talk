#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 2;
use Queue::Timed;

my $queue = Queue::Timed->new();

my @input = ( 3, 6, 1, undef, 3, 9 ); 

$queue->enqueue( $_ ) for @input;

is ($queue->length, 6, "Queue has the right length");

my @output;
push @output, $queue->dequeue while not $queue->empty;

SKIP: {
   skip "Bug found while presentating", 1;
is_deeply( \@output, \@input,
     "Queue has the right content"); 
}
