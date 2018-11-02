#!/usr/bin/perl -w
use strict;

sub help()
{
	print <<END;
cinclude2dot v0.6 (C) Darxus\@ChaosReigns.com, francis\@flourish.org
Released under the terms of the GNU General Public license.
Download from http://www.chaosreigns.com/code/cinclude2dot/

Graphs #include relationships between every .c, .cc, .cpp, and .h file
under the current directory using graphviz like so:

\$ cd ~/program/src
\$ ./cinclude2dot.pl > source.dot
\$ neato -Tps source.dot > source.ps
\$ gv source.ps

Get graphviz here: http://www.research.att.com/sw/tools/graphviz/

Command line options are:

--debug       Display various debug info
--exclude     Specify a regular expression of filenames to ignore
              For example, ignore your test harnesses.
--groups      Group files by the directories that they are in.
--groupsonly  Display links between directory groups, rather than 
                individual files.  Two directories have a link if
                any two files within them do.
--help        Display this help page.
--include     Followed by a comma separated list of include search
                paths.
--paths       Leaves relative paths in displayed filenames.

END
	exit 0;
}
 
##########################################################################
# Version history:
#
# v0.1 2000-09-14 10:24 initial version
# v0.2 2000-09-14 10:49 strip leading ./ off files
# v0.3 2000-09-14 11:00 allow whitespace between "^#" and "include"
# v0.4 2000-09-14 12:44 strip paths
# v0.5 2000-09-14 12:57 strip paths unless -p
# v0.6 2002-02-08 10:30 major changes by francis@flourish.org

##########################################################################
# Ideas for improvements:
# 
# - Change the %links hash to store a count, and weigh the link by how often
#   there was an include along that link.  Thicker lines mean stronger
#   connections.
#
# - Add label to digraph, saying which program generated it, when and guess
#   at the name of the application which has been graphed.
#

use Getopt::Long;
use File::Spec::Functions;
use File::Basename;

##########################################################################
# Read parameters

my $paths = '';
my $groups = '';
my $help ='';
my $debug = '';
my $exclude = "";
my $groupsonly = "";
my $includelist = "";
GetOptions('paths' => \$paths, 'groups' => \$groups, 
		   'exclude=s' => \$exclude, 'groupsonly' => \$groupsonly,
		   'include=s' => \$includelist, 'help' =>\$help,
	       'debug' => \$debug);
my @includepaths = split(/,/,$includelist);
help() if ($help);

##########################################################################
# Tidies up a path or filename, removing excess ./ and ../ parts.
# Parameters:
# 	$_ - Path or filename to tidy
sub tidypath {
	$_ = shift;
	warn "tidypath tidying $_" if $debug;
	$_ = canonpath($_);
	# Use only one type of slash
	s:\\:/:g;
	# Remove constructs like xyz/..
	while (s:[^/]+?/\.\./::) {};
	warn "tidypath returning $_" if $debug;
	return $_;
}

##########################################################################
# Searches file include path, and returns exact filename of file
# Parameters: 
# 	$inc - text from within the #include statement
#   $file - filename the include was from
sub include_search {
	my ($inc, $file) = @_;
	warn "include_search scanning for $inc from $file" if $debug;

	# Try relative to the including file
	$_ = tidypath(dirname($file) . "/" . $inc);
	warn "include_search trying $_ (dirname " . dirname($file) . ")" if $debug;
	return $_ if (-e "$_");

	# Try user-specified include paths
	my $item;
	foreach $item (@includepaths)
	{
	  $_ = tidypath($item . "/" . $inc);
	  warn "include_search trying $_" if $debug;
	  return $_ if (-e "$_");
	}

	# Try relative to current directory
	$_ = $inc;
	warn "include_search trying $_" if $debug;
	return $_ if (-e "$_");

	warn "include_search failed for $inc from $file" if $debug;
	return undef;
}

##########################################################################
# Converts a filename to its display version
# Parameters:
# 	$_ - Filename for display
sub file_display {
	$_ = shift;
	$_ = basename($_) unless $paths;
	return $_;
}

##########################################################################
# Main code

open (FILES,"find . -iname '*.c' -print;
             find . -iname '*.cpp' -print;
			 find . -iname '*.cc' -print;
			 find . -iname '*.h'|");

print <<END;
digraph "source tree" {
    size="8,10";
    ratio="fill";
    fontsize="16";
    fontname="Helvetica";
	clusterrank="local";
END
#  nodesep="0.2";
#    ranksep="0.3";
#    margin=".5,.5";
#    orientation="portrait";

my %links = ();
my %notfound = ();
my $file;
while ($file = <FILES>)
{
  next if ($exclude ne "" and $file =~ m/$exclude/);
	
  chomp $file;
  #strip "./" off off $file
  $file =~ s#^./##g;

  open (INPUT,"<$file");
  my $line;
  while ($line = <INPUT>)
  {
    if ($line =~ m#^\#\s*include\s(\S+)#)
    {
      my $included = $1;

      # strip quotes & anglebrackets
	  (my $rawincluded = $included) =~ s/[\<\>"]//g;
	  my $includefile = include_search($rawincluded, $file);

	  if (! defined $includefile)
	  {
		  $notfound{$included . " from " . $file} = 1;
		  next;
	  }

	  if ($groupsonly)
	  {
		  my $from = dirname($file);
		  my $to = dirname($includefile);
		  $links{"	\"$from\" -> \"$to\" [len=5]\n"} = 1 unless $from eq $to;
	  }
	  else
	  {
		  my $includefile_display = file_display($includefile);
		  my $file_display = file_display($file);

		  if ($groups)
		  {
			  my $groupname = dirname($includefile);
			  print <<END;
subgraph "cluster$groupname" {
	label="$groupname";
	"$includefile_display";
}
END
			  $groupname = dirname($file);
			  print <<END;
subgraph "cluster$groupname" {
	label="$groupname"
	"$file_display";
}
END
		  }

		  $links{"	\"$file_display\" -> \"$includefile_display\" [len=5]\n"} = 1;
		}	
    }
  }

  close INPUT;
}

# Print out the links (we used a hash to avoid repeats of the same link)
my $item;
foreach $item (keys %links)
{
	print $item;
}

# Print names of not found files
foreach $item (sort keys %notfound)
{
	print STDERR "Include file not found: " . $item . "\n";
}

print "}\n";

