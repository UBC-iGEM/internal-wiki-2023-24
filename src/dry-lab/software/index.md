# Software

<!-- toc -->

[💻 Our Repository](https://github.com/UBC-iGEM/dna-software)

*Contributions*

Lucy, Riya, Sebastian, Samuel

## Overview
This document is related to the software component of the DNA storage process. This entails turning a binary sequence into a sequence of biological bases for information storage.

## Context and scope
Some terminology that will be mentioned across the software pages include:
- frontend: portion of software that a user directly interacts with, another word for GUI
- GUI: graphical user interface
- backend: portion of software that the user does not see and interact with directly. Comprises of the encoding, decoding and error correction algorithms.

In the context of a user who wants to store long-term information, they use the graphical user interface to select a file to be stored in DNA. After making the request to store a file, the software, connected to the [Microfluidics](../hardware/microfluidics/index.md) platform, autonomously synthesizes the required DNA sequences. After the [Microfluidics](../hardware/microfluidics/index.md) platform synthesizes the DNA molecules, it sends a signal back to the software to complete the storage process, showing the user that information their information has been successfully synthesized and stored in DNA.

When the user wants to retrieve information that they previously stored in DNA, the user selects the file they want to retrieve. The software sends the primers associated with that file to the [Microfluidics](../hardware/microfluidics/index.md) platform, which runs PCR on chip, then returns the sequences for software to reconstruct into one file. 

In reality, with the limited time and resources our team has, we will not get this workflow to work autonomously, but the software will process the input file without input from the user. 

For purposes of the E-DBTL cycle, there is additional functionality, to provide metrics to help us improve our software. For instance:
- the program will return the sequences to be synthesized, along with the corresponding primer
  - This detail should be hidden from the user in a real world use case
- Testing of different encoding/decoding/ECC algorithms 
- Generate statistics signifying robustness of different algorithms 

## Goals and non-goals
For our MVP, our software platform must be able to encode and decode a binary input. Additionally, we must have a graphic user interface, and to complete the requirements for E-DBTL cycle, in silico simulation, which computes fault simulation of DNA sequences (called ChaosDNA) so we can test our various algorithms.

If we are satisfied with our initial MVP platform, we can demonstrate persistence.

## The actual design
### Backend
Goal: Encoding (given an existing file, convert that file into sequence(s) of nucleotides): 
1. Primer generation
2. Sequence generation
3. Collect metadata for error correction and for putting the sequences back into a file

Goal: Decoding (given a request for a certain file): 
1. Return the primers to wet lab needed to retrieve the DNA molecules containing that file
2. After returning the sequences, perform sequence recovery. 
3. Apply error correction based on collected metadata
4. Collapse sequences back into one file
5. Return the file to the user

Goal: Fault Simulation
1. Given a string, error rate, deletion error rate, mutation error rate, insertion error rate, generate a distribution of sequences that may be synthesized from wet lab
2. Run our software on these faulty sequences
3. Run statistical analysis on the success rate of software

### Frontend (graphical user interface)
Goal: A user should be able to drag a file into the application, create new folders, rename folders, delete folders, delete files.
- should be cross platform
- for iHP interviews should have GUI ready early

### Testing
Goal: A researcher/developer of the encoding/decoding/ECC algorithm should be able to test the robustness of a specific algorithm
-  Enter a phrase to encode, pick number of sequences to run the algorithm against, display statistics, graphics, highlighting details about the algorithm being tested
- Pick how many sequences should be generated, then using the rate of corrected sequences, generate visual statistics for researcher

## Diagrams
**User POV: Encoding**
![encoding_user_dark](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/4646bff2-fbe7-48d4-b55f-c272ec54545e)

**Wet-Dry Lab**
![encoding_dry_wet](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/18aa2971-3cb2-4135-b25f-f25b30ecb5a5)

**User POV: Decoding**
![decoding_user](./images/decoding_user_dark.png)

**Wet-Dry Lab**
![decoding_dry_wet](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/47924633-1ec9-4b7c-96b3-f9a703be84b2)

## Existing solutions
- [An abstraction of data storage](https://docs.rs/acid-store/latest/acid_store/)
-  [Python implementation of DNA storage system](https://github.com/dna-storage/dnastorage)
- [DNA storage for nanopore sequencing using convolutional coding and basecaller-decoder integration](https://github.com/shubhamchandak94/nanopore_dna_storage)

## How do we test this?
The most important portion of our backend to test is the error correction. To complete iterations of the E-DBTL cycle, testing in silico will occur. Using ChaosDNA, an algorithm that simulates faults (delations, insertions, mutations) in DNA sequences, we can alter the rate of total error, then alter the proportions of deletion, insertions, mutations, the error correction mechanism can be tested against the different types of synthesis and sequencing errors.

When wet lab has finished their POC, we can give wet lab different sequences of varying levels of redundacy to see the effect of adding more error correction and try to identify the most common type of error that occurs.

For primer generation, we can use open source tools online to test our primers, and later verification from the wet lab.
 
To test the graphical user interface, we will conduct interviews with the general public to see how they would use our tool.

## How long will this take?
1. Encoding: 1 - 2 months
2. Decoding: 1 - 2 months
3. GUI: 2 months
4. ChaosDNA: 1-2 weeks
