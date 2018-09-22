package Compare;

sub get_array_diff {
    my ($self, $arr_ref_db, $arr_ref_dump) = @_;

    my @arr_db = @{$arr_ref_db};
    my @arr_dump = @{$arr_ref_dump};

    my %missing;
    undef @missing{@arr_db};
    delete @missing{@arr_dump};
    my @missing_values = sort keys %missing;

    my %unexpected;
    undef @unexpected{@arr_dump};
    delete @unexpected{@arr_db};
    my @unexpected_values = sort keys %unexpected;

    return (\@missing_values, \@unexpected_values);
}

sub get_discrepancy {
}





1;