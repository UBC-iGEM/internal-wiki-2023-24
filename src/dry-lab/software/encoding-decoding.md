# Encoding and Decoding

[ADD CITATIONS]

# questions
- how long can primers be? 
  - the longer the better, but we start losing information density.
  - how do we prove that we will not run out of primers?
- block size
  - again same problem: the smaller the better, but the smaller the block the more primers we need and the less information density we have
- information density
  - depends on primer length and block size
    - which depend on how long of a strand we can synthesize
- what do primers look like (semi-specific?)
  - does software need to take into account the semi-specific synthesis of DNA strands when generating primers
- error correction
- security
  - do we need to encrypt information?

## Rotation Based Cipher
```python
huffman_codes = {
    "A": {
        "0": "C",
        "1": "G",
        "2": "T"
    },
    "C": {
        "0": "G",
        "1": "T",
        "2": "A"
    },
    "G": {
        "0": "T",
        "1": "A",
        "2": "C"
    },
    "T": {
        "0": "A",
        "1": "C",
        "2": "G"
    },
}

text = "igem"
binary = binarize(text)
ternary = "10020201220122"

def encode(start: str, ternary: str) -> str:
  output = start

  for trit in ternary:
    current = output[-1]
    next = huffman_codes[current][trit]
    output += next
    
  return output

print([encode(start, ternary) for start in ["A", "T", "G", "C"]])

```

## Encoding: 
- consists of segmenting information into blocks, generating primers, mapping primers back to address space and generating all the sequences to be encoded in wet lab.

### Generate Primers:
Algorithm design: 
1. Distance constraints
   - Run edit distance and Levenshtein distance constraints on all primers once in a while
2. Biological constraints
   - Length: 18 - 30 bases
    - 40 - 60% GC content
    - GC clamp at 3’ end of primer, stronger more specific binding
  - Annealing and melting temperature 
    - T_m - 5 = T_a
    - Forward and reverse should have same/similar temps
    - Calculate melting temperature: 4 for every G/C, 2 for every A/T
    - Secondary structures
    - Use established tools to avoid hairpins, self-dimers, cross-dimers
    - Avoid mispriming
    - Avoid repeats on the 3’ end


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

