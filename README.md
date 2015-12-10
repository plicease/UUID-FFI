# UUID::FFI [![Build Status](https://secure.travis-ci.org/plicease/UUID-FFI.png)](http://travis-ci.org/plicease/UUID-FFI)

Universally Unique Identifiers FFI style

# SYNOPSIS

    my $uuid = UUID::FFI->new_random;
    print $uuid->as_hex, "\n";

# DESCRIPTION

This module provides an FFI interface to `libuuid`.
`libuuid` library is used to generate unique identifiers
for objects that may be accessible beyond the local system

# CONSTRUCTORS

## new

    my $uuid = UUID::FFI->new($hex);

Create a new UUID object from the hex representation `$hex`.

## new\_random

    my $uuid = UUID::FFI->new_random;

Create a new UUID object with a randomly generated value.

## new\_time

    my $uuid = UUID::FFI->new_time;

Create a new UUID object generated using the time and mac address.
This can leak information about when and where the UUID was generated.

## new\_null

    my $uuid = UUID::FFI->new_null;

Create a new UUID `NULL UUID`  object (all zeros).

# METHODS

## is\_null

    my $bool = $uuid->is_null;

Returns true if the UUID is `NULL UUID`.

## clone

    my $uuid2 = $uuid->clone;

Create a new UUID object with the identical value to the original.

## as\_hex

    my $hex = $uuid->as_hex;
    my $hex = "$uuid";

Returns the hex representation of the UUID.  The stringification of
[UUID::FFI](https://metacpan.org/pod/UUID::FFI) uses this function, so you can also use it in a double quoted string.

## compare

    my $cmp = $uuid1->compare($uuid2);
    my $cmp = $uuid1 <=> $uuid2;
    my @sorted_uuids = sort { $a->compare($b) } @uuids;
    my @sorted_uuids = sort { $a <=> $b } @uuids;

Returns an integer less than, equal to or greater than zero
if `$uuid1` is found, respectively, to be lexicographically
less than, equal, or greater that `$uuid2`.  The `<=>`
is also overloaded so you can use that too.

## type

    my $type = $uuid->type;

Returns the type of UUID, either `time` or `random`,
if it can be identified.

## variant

    my $variant = $uuid->variant

Returns the variant of the UUID, either `ncs`, `dce`, `microsoft` or `other`.

## time

    my $time = $uuid->time;

Returns the time the UUID was generated.  The value returned is in seconds
since the UNIX epoch, so is compatible with perl builtins like [time](https://metacpan.org/pod/perlfunc#time) and
[localtime](https://metacpan.org/pod/perlfunc#localtime).

# AUTHOR

Graham Ollis &lt;plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
