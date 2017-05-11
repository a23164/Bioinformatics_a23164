#########################################################
#  Author : xianwenfei                                  #
#  Email : xianwenfei@genomics.cn                       #
#  Usage : perl fq2fq.pl <fq_file> <fa_file>            #
########################################################
#!usr/bin/perl
use warnings;
use strict;
die $! unless @ARGV==2;
if($ARGV[0]=~/.gz/ ){
	open INPUT ,"gzip -dc $ARGV[0]|" || $!;
}
elsif($ARGV[0]=~/.tar.gz/){
	open INPUT,"tar -xf $ARGV[0]|" || $!;
}
elsif($ARGV[0]=~/.7zip/){
	open INPUT,"7za e $ARGV[0]| "||$!;
}
else {open INPUT,$ARGV[0]|| $!;}

open OUTPUT,">$ARGV[1]" || $!;
$/="@";<INPUT>;
while (<INPUT>) {
	chop $_;
	if (/(\S+)\n(\S+)\n(\S+)\n(\S+)/){
		print OUTPUT ">$1\n$2\n";
	}
}
