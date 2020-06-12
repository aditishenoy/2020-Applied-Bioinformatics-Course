#Download our GPCR data file (Links to an external site.) (with data concerning G-protein coupled receptors from a number of species) into your course directory and apply the commands from question 1 to answer the following questions. Note: this is about practicing working on the command line!

##How many columns are there (if you count by eye)?
head gpcr.tab
### 7

##How many lines is there in the file?
wc -l gpcr.tab
### 29305

##Use grep and wc to find out how many human GPCRs there are listed. Use techniques from Chapter 5! Do you search for “human” or “Homo sapiens”?
cat gpcr.tab | cut -f 6 | grep 'Homo sapiens' | wc -l
cat gpcr.tab | cut -f 6 | grep '(Human)' | wc -l
### 2244

##How long is the shortest sequence listed in the same file? Use cut and sort!
cat gpcr.tab | cut -f 7 | sort -g > sorted
#### 10

##How many species are named in gpcr.tab?
cat gpcr.tab | cut -f 6 | uniq | wc -l
### 13959

##Download and extract a directory with Fasta files (Links to an external site.), that contains 88 Fasta files. Write a shell script that applies a multi alignment software like Muscle (Links to an external site.) or MAFFT (Links to an external site.) (install as necessary!) on each gene family in the directory.

