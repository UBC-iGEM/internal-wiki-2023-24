# Decoding

## Decoding: 
Algorithm design:
1. Sequence the DNA bases (Illumina/Nanopore)
2. Remove primers and identify data-encoding bases (remove sequences similar to a primer based on Levenshtein distance)
3. Simplify homonucleotide sequence into nucleotides
4. FASTQ analysis to identify most likely sequence
5. Decode based on first nucleotide, using rotation based cipher 
6. Reconstruct file from based on primers mapped to a file

## Error Correction
- For future research: Error correction via algorithms (HEDGES, Hamming codes, etc.)
- Coalesce data to a specific patch (e.g., if latest patch selected, only coalesce data from latest version)

