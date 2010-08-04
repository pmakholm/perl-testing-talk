#!/usr/bin/perl

use Queue::Timed;
my $queue = Queue::Timed->new;
  
print "1..3\n";
print defined($queue)            ? "ok 1\n" : "not ok 1\n";
print $queue->isa("Queue::Timed")? "ok 2\n" : "not ok 2\n";
print $queue->length == 0        ? "ok 3\n" : "not ok 3\n";

