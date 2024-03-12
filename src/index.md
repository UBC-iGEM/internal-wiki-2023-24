# [Project Name]: Improving DNA Storage with Synthetic Biology

# Project Description

## Overview
With the world entering the zettabyte era, the current data storage model that relies heavily on ‘the cloud,’ or large data storage centers, is projected to be incapable of meeting society’s growing demand in data storage. To give everyone some context, 1 zettabyte is equivalent to 1 trillion gigabytes.

Our project aims to tackle the growing need for a better, more energy-efficient data storage medium compared to current magnetic and optical data storage options by means of synthetic biology. Currently, we aim to achieve this through 2 separate tracks:
- Developing an **enzymatic** DNA synthesis platform that can elongate a **single-stranded** DNA (ssDNA) in a **template-independent** manner. The synthesized ssDNA strand will then be converted to a more stable, double-stranded DNA (dsDNA) and inserted into a plasmid for long-term data storage.
- Developing a **data encoding/decoding pipeline** that allows binary files (used by computers) to be stored in a ternary format compatible with our DNA synthesis platform, retrieved, and converted back into binary.

## Context and Scope
How we decide to shape the context of our project will largely depend on the iHP interviews our team will be conducting throughout the season. Depending on our project’s ‘story,’ the technical aspects of our project’s design may also change to reflect the story’s emphasis. Below are 3 potential contexts in which our project can be placed as of now:
- Preserving indigenous stories
- Storing archived governmental records
- Storing archived medical records

The technical scope of our project is mostly limited by the iGEM competition timeline; we essentially have 4 months to carry out most of our wet lab experiments and produce a minimum viable product (MVP). This means that our project’s aim is to:
- Successfully demonstrate a **proof-of-concept** DNA synthesis and storage platform with sample data relevant to our project’s context.
- Successfully perform E-DBTL cycles from **both wet lab and dry lab** to convince the iGEM judges that our project’s design went through multiple iterations that each develop on top of each other.

Note that our project does **NOT** aim to:
- Develop a polished, complete DNA synthesis and storage platform that is ready for launch. We will not have the time nor resources to make this happen by the Jamboree. Keep this in mind when you’re working on the project and try not to focus on details that are not required for a proof-of-concept or an MVP.

## Current Plans
### DNA Synthesis Platform
We will be using terminal deoxynucleotidyl transferase (TdT) to enzymatically synthesize ssDNA strands since TdT does not require a template strand for DNA elongation; it just requires a short nucleotide sequence (a primer) to add nucleotides to at the 3’ OH position. When natural deoxynucleoside triphosphate (dNTP) - guanine (dGTP or G), cytosine (dCTP or C), adenine (dATP or A), and thymine (dTTP or T) - is provided to TdT, the enzyme will perform ssDNA elongation until it either runs out of dNTPs to add or if the reaction condition is no longer favorable. In other words, even if we just provide 1 type of dNTP for TdT to work with, we cannot control the number of nucleotides added to the strand in a single reaction cycle (reagent addition → incubation → reagent wash), making our synthesis method ‘**semi**’-specific. 

TdT’s ssDNA elongation efficiency also decreases when the ssDNA strand starts to fold on itself and create secondary DNA structures (i.e., loops and folds). To prevent this, we can increase the reaction temperature as secondary DNA structures are much less likely to form at higher temperatures. Natural or wildtype (WT) TdT, however, cannot withstand such high temperatures. We aim to resolve this issue by using a modified **thermostable TdT (TS TdT)** that can withstand higher temperatures. By synthesizing ssDNA strands using TS TdT and higher reaction temperatures, we aim to increase the synthesis efficiency of our platform. 

We will be performing ssDNA elongation with TdT on a **solid phase synthesis (SPS)** platform. Unlike Aachen 2021’s method where an immobilized ssDNA primer was ‘dipped’ into multiple reaction tubes, we will be immobilizing our ssDNA primer on a solid plate (either made of glass or plastic) and have our reagents flow to the plate’s surface.

### Software
Although TdT is capable of adding all 4 types of dNTPs, it is known to prefer adding nucleotides to certain primer sequences that meet specific constraints. We will be developing a software algorithm that can generate the ‘best’ candidate **primer sequences** that can be used to initiate ssDNA elongation. We will also be developing a complete data **encoding and decoding software pipeline** that will convert a binary input file (compatible with computers) into a ternary representation of data to be stored in DNA sequences (to be synthesized with our platform) with corresponding metadata, then retrieve and decode the sequence information back into binary for users to access the stored data. Note that our sequence will be encoding information in ternary (using 0, 1, and 2) instead of quaternary (using 0, 1, 2, and 3 like the 4 types of dNTPs) due to our synthesis platform being semi-specific, as previously mentioned. Rather than having each dNTP correspond to a single number (such as G=0, C=1, A=2, T=3), we will be assigning a single number to the **transition between 2 types of dNTPs** (such as C→G=0, C→T=1, C→A=2). There will be various types of **metadata** assigned to each ternary DNA sequence, which will be used to identify where the retrieved information belongs to in our filing directory and help decode the sequence information back into binaries. We will also be implementing **error correction algorithms** in our decoding step to increase the accuracy of our retrieval process. We will also be developing a graphical user interface (GUI) to allow users to ‘upload’ and ‘download’ their files from our DNA-based data storage platform. Note that we will not be able to perform the complete workflow starting from file uploading, synthesis, retrieval, and downloading for all end-users at the Jamboree due to time and physical constraints. But the GUI will be a good visual representation of our end-goal and be integrated into our MVP for demonstration purposes.

### Hardware
SPS is a synthesis method that is highly compatible with microfluidics, since they only differ in the reaction scale; SPS operates in a manual scale where the user directly drops or flows reagents to the immobilized ssDNA primer, while in a microfluidic chip the reagents flow through narrow channels in a much smaller scale (i.e., millimeters). Once we demonstrate that ssDNA can be elongated with TS TdT in an SPS platform, we will then be transferring that reaction into a microfluidic chip. This will allow our synthesis reactions to be parallel, automated, high throughput, and higher precision as microfluidic pumps used to control reagent flow through different channels can be controlled by a computer. We will also be building upon the bioreactor from the 2023 team to culture E. coli expressing TdT.

### Human Practices
We want our project to be relevant for stakeholder use and have their perspectives incorporated into our project’s design through the entire engineering design, build, test, and learn cycle (E-DBTL cycle). We will be reaching out to various industry professionals and community members for advice and feedback on our project’s design throughout the season. We will also be planning multiple synthetic biology- and DNA data storage-related initiatives to raise our profile.

## Main Goals and Side Goals
Below is a list of our **main** project goals that are required for our team to win a Gold medal at the Jamboree:
- Demonstrate that an SPS platform can be used to elongate ssDNA strands with TdT
- Express TS TdT using site-directed mutagenesis from WT TdT in E. coli
- Optimize the reaction conditions for TS TdT in an SPS platform
- Develop a primer generation algorithm to identify optimal ssDNA primer sequences
- Develop a pipeline to encode data into DNA sequences/corresponding metadata
- Develop a pipeline to decode DNA sequences using error correction algorithms and metadata
- Develop a graphic user interface (GUI) that demonstrates how users can upload and download their files from our system
- Design a microfluidic chip that translates TS TdT-based ssDNA elongation in an SPS platform into the microfluidic scale
- Build upon the current bioreactor to allow TdT culturing
- Demonstrate the E-DBTL cycle within our experimental, software, and hardware aspects of the project
- Incorporate feedback and advice from industry professionals and stakeholder communities into our project design and development

## Other Implementations
[Aachen 2021](https://2021.igem.org/Team:Aachen) team also developed an enzymatic DNA synthesis platform - the DIP method -, where immobilized primer strands are dipped into reaction tubes each containing TdT and 1 type of dNTP. Several points where our system differs from theirs is:
- We aim to develop an SPS platform, where the immobilized primer isn’t exposed to the stress of being physically moved around
- We will be using TS TdT instead of WT TdT for enzymatic DNA synthesis
- We will be incorporating more error correction measures to increase the accuracy of data recovery
There are also published literature [1](https://pubs.acs.org/doi/abs/10.1021/acscatal.1c04879), [2](https://www.nature.com/articles/s41467-020-18681-5), [3](https://www.science.org/doi/10.1126/sciadv.adi0263) that look into TdT-based enzymatic DNA synthesis, but most of their techniques have been patented.

