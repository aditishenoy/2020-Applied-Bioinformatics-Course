BEGIN{
  FS = "\n"; 
  OFS = "\t"; 
  RS = ">";
  print "Running digest.gawk with parameters max_len = "max_len", min_len = "min_len", enzyme = "enz", miss_cleav = "miss_cleav
  # enz = "[KR][^P]";    #  for Trypsin 
}
NR>1{
  prot = ""; 
  split($1, header, " ");    # only use the first word in FASTA ID line as protein ID 
  printf header[1]"\t" 
  for (i=2; i <=NF; i++)      # cancatenate multiple lines of protein into a long one 
    prot = prot""$i;          # 
  for (num_peps = 1; length(prot) > 0; num_peps++) {
     pos = match(prot, enz); 
     if (pos == 0) pos = length(prot)+1;
     peps[num_peps] = substr(prot, 1, pos); 
     prot = substr(prot, pos+1); 
  }
  num_peps--
  printf "num_of_peps="num_peps"\t"        # extra (2nd) field with no-miss-cleav pepide number
  for (n = 0; n <= miss_cleav; n++)      
    for (i=1; i <= num_peps-n; i++) {
       pep = peps[i];
       for (inc=1; inc <= n; inc++) 
          pep = pep""peps[i+inc];
       ll = length(pep);
       if ((ll <= max_len) && (ll >=  min_len)) printf pep"\t"; 
    } 
  printf "\n"; 
}


