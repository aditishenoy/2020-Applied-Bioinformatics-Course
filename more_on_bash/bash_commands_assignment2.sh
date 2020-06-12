#A1. Count the number of genes reported to produce proteins that are present in both Cytosol and Mitochondria 
grep "Cytosol" subcellular_location.tsv | grep "Mitochondria" | cut -f 1 | wc -l
##Output: 145

#A2. List the protein names of the gene names of the proteins present in both Cytosol and Mitochondria
grep "Cytosol" subcellular_location.tsv | grep "Mitochondria" | cut -f 2

#B1. Report the single command line you would use to find the individual date when Sweden was reporting the largest amount of covid-19 cases using grep, gawk, and sort
grep 'Sweden' covid19.csv | gawk -F "," '{print $1, $5}' | sort -rn -k 2 | head -1
##Output: 04/06/2020 2214

#C1. Count the number of protein sequences in the file, using a) grep or b) gawk
gawk '/^>/' rat.1.protein.faa | wc -l
##Output: 66755

#C2. Count the number of amino acids in the file using a) grep/wc and b) gawk
gawk '!/^>/' rat.1.protein.faa | wc
##Output: 44020403

#*C3. Use gawk to create a file that gives all the amino acid sequence in one flow, without line-breaks, for each protein record. I.e. each record should consist of one row of a protein sequence name and one long row with the amino acid sequence.
gawk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' rat.1.protein.faa > single_line
##Output: single_line is a file with fasta sequences of each protein sequence on a single line


