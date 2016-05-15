use strict;
use warnings;

package Mojolicious::Plugin::Web::Auth::Site::Runkeeper;

use Mojo::Base qw/Mojolicious::Plugin::Web::Auth::OAuth2/;

has access_token_url => 'https://runkeeper.com/apps/token';
has authorize_url    => 'https://runkeeper.com/apps/authorize';
has response_type    => 'code';
has user_info        => 1;
has user_info_url    => 'https://api.runkeeper.com/user';

sub moniker { 'runkeeper' }

1;
__END__

# ABSTRACT: Runkeeper OAuth Plugin for Mojolicious::Plugin::Web::Auth

=pod

=head1 SYNOPSIS

    # Mojolicious
    $self->plugin('Web::Auth',
        module      => 'Runkeeper',
        key         => 'Runkeeper consumer key',
        secret      => 'Runkeeper consumer secret',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...
        },
    );

    # Mojolicious::Lite
    plugin 'Web::Auth',
        module      => 'Runkeeper',
        key         => 'Runkeeper consumer key',
        secret      => 'Runkeeper consumer secret',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...
        };


    # default authentication endpoint: /auth/runkeeper/authenticate
    # default callback endpoint: /auth/runkeeper/callback

=head1 DESCRIPTION

This module adds L<Runkeeper|https://runkeeper.com/developer/healthgraph/overview> support to
L<Mojolicious::Plugin::Web::Auth>.

=cut
