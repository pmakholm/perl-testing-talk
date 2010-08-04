#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 3;
use Test::MockObject;

my @list;
my $mock = Test::MockObject->new;

$mock->mock( enqueue => sub { push @list, @_ } );
$mock->mock( dequeue => sub { shift @list    } );

# Complex code follows
$mock->enqueue(1);
$mock->enqueue(2);
$mock->dequeue;
$mock->enqueue(3);
$mock->dequeue;
$mock->dequeue;
# Complex code ends

my %call;
$call{$name}++ while (my $name = $mock->next_call);

is( $call{enqueue}, $call{dequeue},
    "Enqueue and dequeue call an equal number of times");

