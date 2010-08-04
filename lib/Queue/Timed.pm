package Queue::Timed;

use strict;
use warnings;

use Carp;

use Time::HiRes qw(time);

sub new {
    my ($class, %args) = @_;

    return bless { queue => [] }, $class;
}

sub enqueue {
    my ($self, $object) = @_;

    push @{ $self->{queue} }, [ $object, time() ];

    return $self;
}

sub dequeue {
    my ($self) = @_;
    my $object;

    ($object) = @{ shift @{ $self->{queue} } }  # Bug #1;
        until $object
           or scalar @{ $self->{queue} } == 0;
    
    return $object;
}

sub length {
    my ($self) = @_;

    return scalar @{ $self->{queue} };
}

sub empty {
    my ($self) = @_;

    return $self->length == 0;
}

sub wait_time {
    my ($self) = @_;

    return 0 if $self->empty;
    return (time() - $self->{queue}->[0]->[1]);
} 

1;

