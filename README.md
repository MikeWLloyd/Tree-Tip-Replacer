# Tip renamer for Newick/Nexus formatted trees.

Using a tab-delimited translation table, convert tip labels for [Newick](http://evolution.genetics.washington.edu/phylip/newicktree.html) or [Nexus](https://en.wikipedia.org/wiki/Nexus_file) formatted trees. **NOTE: for Nexus formatted trees, there can be NO spaces in the translation names.**

### Example call: 
    perl tree_tip_replacer.pl [translation_file] [treefile] 

The translation file is a tab-delimited file with the format:  
CURRENT\_NAME	NEW\_NAME

See the example_files directory for a sample tree, translation table, and expected output.

## NOTE: 
Ensure that the translation file has the correct line endings and encoding for your system (e.g., utf-8, unix(LF)). These can be changed in a program like TextWrangler. If the script does not change the text in the output file, it is likely due to the line endings being improperly formatted. 

#### Other uses
I'm told that this script will work for renaming taxa in other file formats (tree files/alignments/misc.). I would suggest experimenting and seeing what works. The script is hard-coded to output a '.tre' file, but the extension is otherwise meaningless and can be changed to what is needed. 

