use strict;
use warnings;
use v5.10;
use Test::More tests => 3;
use UUID::FFI;

my $uuid = UUID::FFI->new_time;
isa_ok $uuid, 'UUID::FFI';

like $uuid->as_hex, qr{^[0-9a-f]{8}(-[0-9a-f]{4}){3}-[0-9a-f]{12}$}, 'uuid.as_hex';
note $uuid->as_hex;

is $uuid->type, 'time', 'uuid.type';
