# Error Correction

*Contribtions*: Lucy, Riya

<!-- toc -->

## Overview
Correcting for errors that occur in the DNA synthesis, storage, sequencing process, as relating to our DNA synthesis method.

## Context and Scope
A benchmark for the percentage of errors we may be dealing with:
* % Reads containing errors [^errors]:
    * Single base deletions: 25.8%
    * Single base insertions: 13.4%
    * mismatches: 8.9%
    
### Semi-specific synthesis: 
Given that our synthesis method is semi-specific: this means we can control the **type** of base we are adding, but we cannot control the **number** of bases. Additionally, because we will be attaching “blocks” of bases, such as “AAAA” when we just want “A”, a nucleotide sequence of 100 bases may only contain 20-30 unique nucleotides

The challenge here is how can we apply error correction: 
1. With a limited number of unique nucleotides per strand
2. Where deletion errors are the most likely to occur
3. Where sequences are short (100 nt) 
4. To be robust such than it an tolerate higher rates of error

### Specific synthesis: 
Given specific synthesis means we can control the type of base and how many of that base we add. However, gaining the ability to add specifically means deletion errors and insertion errors are more detrimental since there is no redundancy (unless we explicitly add it ourselves). The advantage is that we can choose to how we want to encode the redundancy.

**This document will assume we are using semi-specific synthesis.**

## Goals 
We must collect enough metadata to correct a DNA sequence with around 30-50% synthesis error [^aachen]. We should avoid adding error correction bits unless there is drastic improvement. This could depend on the type of data we are encoding.

## The actual design

### During encoding stage

#### Inner codes 
At each step of the pipeline, collect some relevant metadata, refer to [encoding](encoding.md) for more details: If we couple error correction and encoding together, instead of naively converting bits to trits: 

We use a hash function to determine the next base [^hedges]. This hash function takes as input the bits of current bit index, and previous encoded bits to output a value: 

\\[ K_i = f(currpos, prebits) \\]
\\[ C = (K_i + b_i)mod3 \\]

We mod3 to get the next base, where mod3 returns the remainder after dividing by 3, so we still use the rotation based cipher. For each bit to encode, redundancy is baked into the hash function output because it takes as input the previous encoded bits.

The type of metadata we should collect includes, but is not limited to: the number of base transitions, checksum, primers, length of encoded base sequence and more.

Next, we generate a checksum; this checksum will tell us if errors have occurred in synthesis and may help us reconstruct the sequence through guess and check, stochastic probability. We will need to test the checksum against faulty sequences and see if a checksum ever fails to detect a faulty DNA sequence

#### Outer codes (only if we can do specific synthesis)
* Reed solomon codes (with GC++) [^gc]
* Rectangular correction codes

### During decoding stage
#### If we naively convert bits to trits
Using metadata collected during encoding and checksum, systematically guess which base transitions occur. We first find how many base transitions are missing, and try insertions, deletions, mutations to match the recorded metadata. This is similar to solving sudoku, e are guessing which base transitions are correct. We will use stochastic estimation to choose the “most likely” correct bases. Everytime some “constraint” is violated, we can either backtrack or create a new “sudoku” to solve.

We try solving this problem for some allotted time; if the algorithm fails to return we mark the strand as too erroneous to recover and signal failure to the user, otherwise, we move onto to reconstruct the file.

#### If we couple error correction and encoding together [^hedges]
Given a DNA sequence to decode, assume we have correctly decoded up to D<sub>i-1</sub>, and now want to know D<sub>i</sub>. Since D<sub>i</sub> can only be 0 or 1, there is a choice of two different bases that D<sub>i </sub>can be, but given the redundancy of the parameters given as input to the hash function, there is only one base, B, that D<sub>i </sub>can be. If D<sub>i </sub>= B, we continue, otherwise, assign a penalty score.

A penalty score is assigned to tell the algorithm that an error has likely occurred, and we need to probably backtrack. It is a heuristic that has to be experimentally determined (meaning have to run the algorithm with different levels of penalty scores). If mutation occurred, penalty score would not build up as quickly as if deletion/insertion occurred, then all the bases after are going to fail the redundancy checks, and the penalty score increases. The goal is to minimize penalty score (ideally 0).

However, we have not considered if D<sub>i</sub> is a deletion or insertion. If either is the case, then penalties will rapidly accumulate, and we will know to terminate the search down that branch. The algorithm terminates based on this statement: “The decoding problem, conceptually a maximum likelihood search, thus reduces to a shortest-path search in a tree with branching factor 6, but with the saving grace that the correct path will be much shorter than any deviation from it.” [^hedges].

When we backtrack, we then go down another branch where we can treat D<sub>i</sub> as an insertion (by deleting it and trying to decode again) or a deletion, (by inserting all 4 bases).

## Diagram
![image](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/c7a95aaa-19b3-4051-b1f2-f65baedf420a)

## Current solutions
For more on these papers check out 
1. HEDGES: Hash Encoded, Decoded by Greedy Exhaustive Search (3)
    * To reduce the number of ECC bits needed to be encoded, some store of probabilistic estimation of the next base must occur
2. “physical sequence redundancies, a stringent filtering process and stochastic estimation” (9)
    * [https://github.com/dwiegand740/Photon_Enzymatic_Synthesis](https://github.com/dwiegand740/Photon_Enzymatic_Synthesis)
    * Stochastic estimation via matlab’s built in “seqlogo”: [https://www.mathworks.com/help/bioinfo/ref/seqlogo.html](https://www.mathworks.com/help/bioinfo/ref/seqlogo.html)
1. GC+
    * Short Systematic Codes for Correcting Random Edit Errors in DNA Storage: [https://arxiv.org/abs/2402.01244](https://arxiv.org/abs/2402.01244)
2. QR Code error correction:
    * [https://en.wikipedia.org/wiki/QR_code#Error_correction](https://en.wikipedia.org/wiki/QR_code#Error_correction) 
3. Naive Redundancy
    * "To overcome the challenge of correcting deletions and insertions, existing methods often rely on deep sequencing, which generates many reads per oligo. This injects sequencing redundancy analogous to repetition coding, typically leveraged through sequence alignment algorithms to correct edits via majority voting." [^gc]

## How do we test this?
* We should see if added ECC bits actually increase the accuracy of information; need to perform statistical analysis
    * Or is the actual sequence more important
    * Via ChaosDNA

---

[^errors]: Lee, H., Wiegand, D. J., Griswold, K., Punthambaker, S., Chun, H., Kohman, R. E., & Church, G. M. (2020). Photon-directed multiplexed enzymatic DNA synthesis for molecular digital data storage. Nature Communications, 11(1). https://doi.org/10.1038/s41467-020-18681-5

[^aachen]: Team:Aachen/Results - 2021.igem.org. (n.d.). 2021.Igem.org. Retrieved March 11, 2024, from https://2021.igem.org/Team:Aachen/Results

[^hedges]: Press, W. H., Hawkins, J. A., Jones, S. K., Schaub, J. M., & Finkelstein, I. J. (2020). HEDGES error-correcting code for DNA storage corrects indels and allows sequence constraints. Proceedings of the National Academy of Sciences, 117(31), 18489–18496. https://doi.org/10.1073/pnas.2004821117

[^gc]: Hanna, S. K. (2024, March 4). Short Systematic Codes for Correcting Random Edit Errors in DNA Storage. ArXiv.org. https://doi.org/10.48550/arXiv.2402.01244

‌
