# Software

<!-- toc -->

[💻 Our Repository](https://github.com/UBC-iGEM/dna-software)

*Contributions*

Lucy, Riya, Sebastian, Samuel

## Overview, Context and scope
This document is related to the encoding/decoding pipeline that will convert binary information into nucleotides for the DNA storage process.

Some terminology that will be mentioned across the software pages include:
- frontend: portion of software that a user directly interacts with, another word for GUI
- GUI: graphical user interface
- backend: portion of software that the user does not see and interact with directly. Comprises of the encoding, decoding and error correction algorithms.

### What does software want to try and achieve? 
1. In silico: Demonstrate ability to encode and decode information someone may store in long-term storage, in the 1000s of nucleotides long.
2. Wet lab: Demonstrate ability to encode and decode a 100 nucleotide sequence with 30% error.

## DBTL Cycles
### Iteration 1 (Proof of Concept)
Implement a barebones pipeline, and see how much error can be tolerated in 100 nucleotide long DNA sequences with in silico testing.

#### [Encoding](encoding.md)
![encoding_dry_wet](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/18aa2971-3cb2-4135-b25f-f25b30ecb5a5)
Given an existing file, convert that file into sequence(s) of nucleotides.
1. Primer generation
2. Sequence generation (semi-specific and specific)

#### [Decoding](decoding.md)
![decoding_dry_wet](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/47924633-1ec9-4b7c-96b3-f9a703be84b2)
Given the name of a file that has been stored in DNA, decode that file back to binary information
1. Return the primers to wet lab needed to retrieve the DNA molecules containing that file
2. After returning the sequences, perform sequence recovery (based on the sequencing machine)
3. Apply error correction based on synthesis strategy
4. Collapse sequences back into one file
5. Return the file to the user

#### [Error Correction](ecc.md)
Perform error detection and correction based on the synthesis strategy

#### [ChaosDNA](chaosdna.md) (provide platform for in-silico testing of software):
1. Given a string, total error rate, deletion error rate, mutation error rate, insertion error rate, generate a distribution of sequences that may be synthesized from wet lab
2. Run our software on these faulty sequences
3. Run statistical analysis on different encoding and error correction strategies

### Iteration 2
Redefine algorithms to tolerate up to 30% error in 100 nucleotide long DNA sequences, with in silico testing.

### Iteration 3 
Implement DNA Storage Alliance specifications, and do in silico testing on DNA sequences with 1000s of nucleotides.
- [Sector Zero](https://www.snia.org/standards/technology-standards-software/standards-portfolio/dna-data-storage-sector-zero)
- [Sector One](https://www.snia.org/standards/technology-standards-software/standards-portfolio/dna-data-storage-sector-one)

### Iteration 4/5 
Test our software on sequences synthesized by wet lab, and redefine algorithms with in silico testing and wet lab data.

## How do we test this?
The most important portion of our backend to test is the error correction. To complete iterations of the E-DBTL cycle, testing in silico will occur. Inspired by [chaos engineering](https://en.wikipedia.org/wiki/Chaos_engineering), we will create [ChaosDNA](chaosdna.md), a simple tool that simulates faults (deletions, insertions, mutations) in DNA sequences. Using [ChaosDNA](chaosdna.md), we can alter the rate of total error, then alter the proportions of deletion, insertions, mutations. We then run the error correction mechanism can against the faulty strands.

When wet lab has finished their POC, we can give wet lab different sequences of varying levels of redundancy to see the effect of adding more error correction and try to identify the most common type of error that occurs.

For primer generation, we can use open source tools online to test our primers, and later verification from the wet lab.
 
To test the graphical user interface, we will conduct interviews with the general public to see how they would use our tool.
