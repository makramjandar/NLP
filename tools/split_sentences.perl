#!/usr/bin/env perl
#
# This file is part of moses.  Its use is licensed under the GNU Lesser General
# Public License version 2.1 or, at your option, any later version.

use warnings;
use utf8;
use Lingua::Sentence;

while (@ARGV) {
  $_ = shift;
  /^-b$/ && ($| = 1, next); # not buffered (flush each line)
  /^-l$/ && ($language = shift, next);
  /^[^\-]/ && ($language = $_, next);
}

binmode(STDIN, ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

while (my $line = <STDIN>) {
  chomp($line);
  $splitter = Lingua::Sentence->new($language);
  print $splitter->split($line);
}
