use Discrepancy;
use Test::More tests => 16;

new_ok('Discrepancy' => [] );

my $descr = Discrepancy->new(
    attr_name  => 'attr',
    missing    => [1, 2],
    unexpected => [5, 6, 7],
);

is_deeply($descr->missing, [1, 2], 'missing');
is_deeply($descr->unexpected, [5, 6, 7], 'unexpected');
is($descr->attr_name, 'attr', 'attr_name');
is($descr->number_missing(), 2, 'number_missing');
is($descr->number_unexpected(), 3, 'number_unexpected');
is($descr->max(), 3, 'max');

$descr = Discrepancy->new(missing => [1, 2], unexpected => undef);
is($descr->number_missing(), 2, 'number_missing');
is($descr->number_unexpected(), 0, 'number_unexpected');
is($descr->max(), 2, 'max');

$descr = Discrepancy->new(missing => undef, unexpected => [5, 6, 7]);
is($descr->number_missing(), 0, 'number_missing');
is($descr->number_unexpected(), 3, 'number_unexpected');
is($descr->max(), 3, 'max');

$descr = Discrepancy->new(missing => undef, unexpected => []);
is($descr->number_missing(), 0, 'number_missing');
is($descr->number_unexpected(), 0, 'number_unexpected');
is($descr->max(), 0, 'max');