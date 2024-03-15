# Decoding

<!-- toc -->

<div class="scroll">

![decoding](./images/decoding_dark.png)

</div>

*Contributions*: Lucy, Chae, Riya, Sebastian

## Overview
Alignment of fragments of DNA sequences after sequencing is performed from various tools. 

## Context and Scope
Depending on the sequencing platform we use, there may be varying degrees of sequence alignment required.

### Sanger 
- [@a2021_analyzing] [@a2021_sanger]
* First 20-40 base pairs are not well resolved 
* Simple data analysis
* Longer reads (500-700 bps)
* Low sensitivity (~15–20% detection limit)
* Sequences close to primer-binding sites to be of poor quality
* Output: four-color chromatogram representing the peak fluorescence intensity associated with each labeled ddNTP along the DNA sequence
![sanger](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/96d6a8f4-f7c1-47b2-a256-bc2e239a26b6)

### NextGen 
- [@next] [@cheng_2023_methods]
* Higher sequencing depth for increased sensitivity (down to 1%)
* Higher discovery power
* Short reads (150-300 bps) by Illumina
![ngs](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/3c7f58a1-567c-4de7-962c-112dfad3f086)

### Nanopore 
Doesn't require PCR amplification, eliminating amplification bias and simplifying sequencing protocols relatively high error rates, around 10% per nt [@emerging].

### Synthesis method:
The synthesis method can also differentiate our sequence recovery method. If we are using semi-specific, we can rely on homonucleotides for sequence consensus. For specific synthesis, we would rely on error correcting codes.

Many pre-existing alignment strategies rely on a reference template; we don’t have that luxury and conduct sequence alignment without a template, otherwise known as de novo sequence assembly.

## Goals and non-goals
Goal: 
To perform iterations of the DBTL cycle, we will complete the algorithms required to perform alignment in a timely manner and with acceptable accuracy on one platform, most likely NGS. We will implement one of the two algorithms that is mentioned below, then in the second iteration try the other algorithm.

Non-goals:
* Generalize to all sequencing platforms.

## Actual Design
**There are many established algorithms in this domain, we will use one of those.** Based on the selected platform, sequence analysis will be performed as so: 

### Sanger 
Given four-color chromatogram(s) representing the peak fluorescence intensity, depending on the amplification scale in wet lab, we can compare chromatogram(s) to each to resolve conflicts. For de novo assembly, we can resolve conflicts based on redundancy of chromatogram [@sanger].

### NGS 
Given a fastq file which contains, it contains multiple chopped up sequence reads tat each have a confidence score, known as a Phred score, which is the probability the sequencer called the base incorrectly. We assemble the sequence reads de novo into one long read [@ngs].
![ngs_output](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/d539e783-c2fb-44ce-a8b8-325c6ff41c75)

To conduct de novo assembly for output from NGS platform, reads are examined for overlap between them, and the goal to build up a single contig from smaller contigs.

There are established algorithms for solving this problem [@paszkiewicz_2010_de]: 

#### The overlap-layout-consensus (OLC) approach [@paszkiewicz_2010_de]
* Find overlaps between all pairs of segments, deriving a similarity score for each pair; this will be used to generate our heuristic 
* Then we have to generate the layout based on overlaps, with an overlap graph
  * Vertices: sequence reads
  * Edges: overlaps 
* Find a path that visits each node once -> Hamiltonian circuit, NP-hard
* So use heuristic (similar score) to greedily select which edges to take to maximize the heuristic (sum of similarities) until a single string is found (path is found) 
* Order of merging pairs matters and can change the final string

Requires overlap to be scored between all pairs of reads, making runtime as least O(n<sup>2</sup>), overlap is less likely for short reads.

#### The de Bruijn graph approach [@paszkiewicz_2010_de] 
* No need for overlap phase
* Sequence reads cut into smaller pieces
* K-tuples, DNA sequence word of length k, are generated
* Bruijn graph: 
  * Node: (k-1)-tuples that occur in k-tuples
  * Edge: connects (k-1)-tuples that form a k-tuple
* Find shortest (minimum weight, using heuristic) path that visits every edge -> [Chinese postman problem](https://en.wikipedia.org/wiki/Chinese_postman_problem), NP-complete!
** Problems with finding multiple solutions, or sequencing errors which cause high branching and tangle
* Effect choice of k

### Nanopore
TBD, as we may not end up using Nanopore to sequence. 

### Identify and remove primer
Using the primer we have stored, run fuzzy string matching algorithms [@wikipediacontributors_2019_approximate].

From simplest to advanced [@silva_2022_what]: 
* Levenshtein distance: used in strings
  * Damerau-Levenshtein: “transposition of two characters to find an approximate match”
* Hamming distance: used in signals 
* Advanced: Hidden Markov Models via probability 

For the first iteration of the DBTL cycle, we will try **Levenshtein Distance**, and pursue other algorithms if there is notable gain from using them.

### Sequence collapse to single nucleotides 
Given that we are doing semi-specific synthesis, we now collapse homonucleotides to mononucleotides. We use the occurrence of homonucleotides as the probability the sequenced base is actually at that index, to deal with base conflicts, and also signal that the positions of base conflict could either be a deletion, insertion or mutation error.
![homo](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/c3d5709c-0f9a-4890-87a8-f53a0112d83d)

After these steps, we can do [error correction](#ecc.md).

## Current Solutions
- [Basecalling, alignment, assembly and deconvolution of Sanger Chromatogram trace files](https://github.com/gear-genomics/tracy?tab=readme-ov-file)
- [Aachen](https://2021.igem.org/Team:Aachen/Software#DecodingandErrorCorrectioninSequencingData)
- [Open source algorithms for short reads](https://academic.oup.com/view-large/25700038):
  - “These software packages are able to perform de novo assembly of Illumina short sequence reads with the exception of SHORTY, which is designed to assemble ABI SOLiD colour-space data. Velvet and SOPRA can assemble sequence-space and colour-space data. aCurtain is a pipeline, based on Velvet, for hierarchical assembly of short sequence reads in order to overcome memory usage limitations. bOases is specifically designed for assembling transcribed sequences.” [@paszkiewicz_2010_de]

## How do we test this?
We can test in silico by using open source genome data, and try to reassemble (without the reference template) and then check the performance, additionally through [ChaosDNA](chaosdna.md).

---
