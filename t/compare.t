use Compare;
use Test::More tests => 12;

my @arr_db = (1, 2, 3, 4);
my @arr_dump = (3, 4, 5, 6);
my ($missing_values, $unexpected_values) = Compare->get_array_diff(\@arr_db, \@arr_dump);
is_deeply($missing_values, [1, 2], 'missing values');
is_deeply($unexpected_values, [5, 6], 'unexpected values');

($missing_values, $unexpected_values) = Compare->get_array_diff([], \@arr_dump);
is_deeply($missing_values, undef, 'missing values');
is_deeply($unexpected_values, [3, 4, 5, 6], 'unexpected values');

($missing_values, $unexpected_values) = Compare->get_array_diff(undef, \@arr_dump);
is_deeply($missing_values, undef, 'missing values');
is_deeply($unexpected_values, [3, 4, 5, 6], 'unexpected values');

($missing_values, $unexpected_values) = Compare->get_array_diff(\@arr_db, []);
is_deeply($missing_values, [1, 2, 3, 4], 'missing values');
is_deeply($unexpected_values, undef, 'unexpected values');

($missing_values, $unexpected_values) = Compare->get_array_diff(\@arr_db, undef);
is_deeply($missing_values, [1, 2, 3, 4], 'missing values');
is_deeply($unexpected_values, undef, 'unexpected values');

($missing_values, $unexpected_values) = Compare->get_array_diff(undef, undef);
is_deeply($missing_values, undef, 'missing values');
is_deeply($unexpected_values, undef, 'unexpected values');