# ChaosDNA

## Context and Scope
To perform E-DBTL cycles without data from wet lab, we can generate faulty DNA sequences through software. Treating DNA sequences as a string, we can randomly mutate the string with deletions, insertions and mutations.

## Goals
The goal of this in-silico testing platform is to perform 3-4 E-DBTL cycles before wet lab has data for us to try. Additionally, because wet lab will only be generating strands of 100 nucleotides long, we want to try our software on nucleotide sequences that are 1000s of bases long, and run statistics to show the utility of our software with input sizes that will be more realistic of information that would be encoded in long-term storage.

## Design
- To test sequence generation, error correction: given a file to encode, total error rate, deletion error rate, insertion error rate, mutation error rate, return a distribution of faulty DNA sequences
- To test our sequence alignment (NGS): return a DNA sequence in the form of a fastq file
