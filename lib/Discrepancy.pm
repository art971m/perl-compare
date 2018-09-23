package Discrepancy;
use Class::XSAccessor {
    accessors => [
        'missing',
        'unexpected',
    ],
    defined_predicates => {
        defined_missing    => 'missing',
        defined_unexpected => 'unexpected',
    },
};

sub new {
    my ($class, %options) = @_;
    return bless {%options}, __PACKAGE__;
}

sub max {
    my ($self) = @_;
    return ($self->number_missing() > $self->number_unexpected())
        ? $self->number_missing()
        : $self->number_unexpected();
}

sub number_missing {
    my ($self) = @_;
    return ($self->defined_missing())
        ? scalar @{$self->missing()}
        : 0;
}

sub number_unexpected {
    my ($self) = @_;
    return ($self->defined_unexpected())
        ? scalar @{$self->unexpected()}
        : 0;
}

1;