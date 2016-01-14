package A::Schema::Result::Album;

use DBIx::Class::Candy -base => 'A::Schema::Result';

use Types::SQL -types;
use Types::Standard -types;


table 'albums';

primary_column id => {
   data_type => 'int',
   is_auto_increment => 1,
   is_numeric => 1,
};

has_column name => Maybe[Varchar[25]];

column artist_id => {
   data_type => 'int',
   is_nullable => 0,
};

has_many songs => 'A::Schema::Result::Song', 'album_id';

sub test_strict {
   require Test::More;
   eval '$foo = 1';
   Test::More::ok($@, 'strict mode is on');
}

1;
