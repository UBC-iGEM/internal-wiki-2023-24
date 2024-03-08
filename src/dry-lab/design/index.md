# Design

<!-- toc -->

## Why these projects?

## Projects Overview
### Hardware

| Component                         | Priority | Objective                                                                                                                     | Assigned to    | Report to    |
| --------------------------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------- | -------------- | ------------ |
| Microfluidic Pump                 | 1        | TBD                                                                                                                           |                | Piyush       |
| Microfluidic Chip (DNA Synthesis) | 2        | Create a chip with exposed -OH groups with highly turbulent flow over the mixing region to achieve Solid Phase DNA Synthesis. | Matthias, Patt | Tina, Piyush |
| Microfluidic Chip (PCR)           | 2        | Create a connected PCR chip which can amplify free floating single stranded DNA.                                              | Samuel, Piyush | Tina, Piyush |
| Microfluidic Chip (DNA Capture)   | 2        | TBD                                                                                                                           | Samuel, Piyush | Tina, Piyush |
| Bioreactor                        | 2        | Create a Bioreactor to allow Wet Lab to Culture E Coli for their experiments                                                  | Samuel, Piyush | Tina, Piyush |

### Software

| Component         | Priority | Objective                                                                                                                                                                                                                       | Assigned to                             | Report to |
| ----------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------- | --------- |
| Encoding          | 2        | Implement a software pipeline that when given a file location to write to DNA, creates the DNA sequence(s) to be synthesized, and collects metadata for decoding.                                                               | Riya, Lucy                              | Lucy      |
| Decoding          | 2        | Implement a software pipeline that when given a request to retrieve a file, does the opposite of encoding; using the metadata gathered during encoding, apply error correction and puts the sequences back together into a file | Sebastian, Lucy                         | Lucy      |
| In silico testing | 1        | Given an input string, error rate of DNA synthesis and encoding/decoding algorithm, run simulations to determine how robust our software is, quantified by statistics                                                           | Lucy, Sebastian, Riya                   | Lucy      |
| Error Correction  | 1        | Create an error correction algorithm to work with semi-specific encoding, short nucleotide sequences and high rate of deletion errors.                                                                                          | Riya, Lucy                              | Lucy      |
| GUI               | 3        | Design a user friendly interface that can be used by our iHP interviewees to try out our DNA storage software, and also visually display our file system                                                                        | All software + other dry lab if desired | Lucy      |

### Modelling

| Component             | Priority | Objective                                                                                                                                                                                                                                              | Assigned to  | Report to     |
| --------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------ | ------------- |
| TdT Reaction Kinetics | 3        | Design an expression for the reaction kinetics of TdT. The result would be an expression where we could find the concentration of cofactors, reagents, etc that allow the kinetics of nucleotide addition to be equal for all nucleotides (A, T, G, C) | Lucy, Piyush | Wet Lab Leads |
| Bioreactor Modelling  | 3        | TBD                                                                                                                                                                                                                                                    |              |               |


