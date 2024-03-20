# ssDNA to dsDNA Experimental Design

## Overview

Convert ssDNA synthesized by thermostable TdT (mutant 3-2) to dsDNA to generate a more stable dsDNA to allow better long-term storage.

## Context and Scope

Terminal deoxynucleotidyl transferase (TdT) is a special type of polymerase found in mammals that is able to synthesize ssDNA in a template-independent manner. Our project aims to utilize TdT to customize and synthesize DNA strands for data storage.

Since TdT’s ability is limited to ssDNA synthesis, while ssDNA is not a stable biological molecule, this constrainsts our ability to store data long term using ssDNA. Hence, we propose to convert ssDNA to dsDNA once it is synthesized by TdT.

## Goals

- Synthesize dsDNA from ssDNA to achieve a more stable biological molecule for storage

## Proposed solutions and workflow

**PCR**

1. Denaturation (~96°C):
   Melt secondary structure, linearize ssDNA

2. Annealing (~50-56°C):
   Binding of primer to ssDNA template

3. Extension (~72°C):
   Taq polymerase extends the primers → dsDNA

Primer design

Primer is designed to be complementary to the initiator DNA of ssDNA synthesis and polyA tail

Primer design requirement

- 40-60 GC%
- The forward and reverse primer can’t have a temperature difference of greater than 5C
- 15-25 nucleotides long
- Usually the melting temperature of the primer is 50-60C
- Avoid hairpin structure

## Plasmid integration

Use cloning technique to integrate dsDNA into a plasmid in E.coli (PCR amplification, golden gate/Gibson assembly)

Depending on the vector we use:

- If we use type II restriction enzyme:

PCR amplify the restriction enzyme recognition site onto the donor sequence (dsDNA) then perform Golden Gate to digest and ligate the dsDNA into the plasmid in E.coli in a one-pot reaction

- If we use normal restriction enzyme:

1. PCR amplify complementary region of the plasmid sequence onto the donor sequence

2. Digest the plasmid with restriction enzyme

3. Perform Gibson Assembly to ligate the dsDNA into the plasmid in E.coli

**Transformation**

Integrate the plasmid into E.coli BL21 (DE3) from NEB for protein expression

**Colony Picking**

Pick colony with correct antibiotic resistance

## How do we test this?

Options to see if this worked

1. Use the same PCR primer to amplify the dsDNA inside the plasmid then use agarose gel to measure the length of the sequence integrated
2. Sanger sequence or NGS (depending on the situation)

## How long will this take?

If everything goes wellwhile, 1-2 day. If not, 1 week should be enough for troubleshooting.
