use File::Basename;
my $name = basename($0);

my ($input, $treefile) = @ARGV;

if (not defined $input) {
	print "\nFAILED TO RUN!\nMissing argument 'translation_file'\n";
	print "USAGE: perl $name [translation_file] [treefile]\n\n'Translation file' is a tab delimited file formated like this:\nCURRENT_NAME\tDESIRED_NAME\n\n";
	exit;
}

if (not defined $treefile) {
	print "\nFAILED TO RUN!\nMissing argument 'treefile'\n";
	print "USAGE: perl $name [translation_file] [treefile]\n\n'Tree file' is NEWICK format treefile\n\n";
	exit;
}

open (INPUT, $input) || die "\n\Translation file $input is missing.\nPlace \"$input\" in this directory and try again.\nThis is a tab delimited file formated like this:\nCURRENT_NAME\tDESIRED_NAME\n\n\n";

($name,$dir,$ext) = fileparse($treefile,'\..*');

open (TREEFILE, $treefile) || die "cannot open $treefile check the filename and ensure correct extention\n";
open (PRINTOUT, ">".$name."_rename.tre")  || die "cannot open the output file\n";

while (<INPUT>) {
    chomp $_;
    @split = split(/\t/, $_);
    $nammer{$split[0]} = $split[1];
}

foreach (<TREEFILE>) {
    $line = $_;
    foreach $name (sort keys %nammer) {
        $line =~ s/\b$name\b/$nammer{$name}/g;
    }
    print PRINTOUT "$line";
}

print "\nCreated $name\_rename.tre\n\nDONE!\n\n";