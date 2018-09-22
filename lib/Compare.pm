package Compare;

sub get_array_diff {
    my ($self, $arr_ref_db, $arr_ref_dump) = @_;

    my @arr_db = (defined $arr_ref_db) 
        ? @{$arr_ref_db}
        : ();
    my @arr_dump = (defined $arr_ref_dump) 
        ? @{$arr_ref_dump}
        : ();

    my ($missing_values, $unexpected_values);
    if ((scalar @arr_db) && (scalar @arr_dump)) {
        my %missing;
        undef @missing{@arr_db};
        delete @missing{@arr_dump};
        $missing_values = (%missing)
            ? [sort keys %missing]
            : undef;

        my %unexpected;
        undef @unexpected{@arr_dump};
        delete @unexpected{@arr_db};
        $unexpected_values = (%unexpected)
            ? [sort keys %unexpected]
            : undef;
    } elsif ((scalar @arr_db) && (!scalar @arr_dump)) {
        $missing_values = [sort @arr_db];
    } elsif ((!scalar @arr_db) && (scalar @arr_dump)) {
        $unexpected_values = [sort @arr_dump];
    }

    return ($missing_values, $unexpected_values);
}

1;