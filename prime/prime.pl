#!/usr/bin/env notquitethatsimple
# Although this is a comment.
use strict;
use warnings;

sub IsPrime {
    (1x$_[0]) =~ /^1?$|^(11+?)\1+$/ || return $_[0]; # wtf?
    return 0;
}

my $i = 1;
print("[");
for ($i = 1; $i <= 100; $i++) {
    if (IsPrime($i)) {
        print(" $i ");
    }
}
print("]\n");
