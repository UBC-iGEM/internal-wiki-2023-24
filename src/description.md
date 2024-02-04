# Project Description

[ADD CITATIONS]

When writing the project description, every member should be table to answer the following questions:

1. What is the team's vision for the chosen project
2. What is the project explained in a conceptual manner?
3. What is the project explained in a detailed manner?

## Project Summary
Solution: Enhance DNA storage process with improved synthesis and storage semantics: 
1. The expression of thermostable TdT with E. Coli, and automation of optimal reaction conditions for free-running synthesis
2. Implementation of block based storage semantics using arbitrarily long primers and update system via. versioning and patches. (15)

Approach:
- Improved Enzymatic DNA synthesis via thermostable TdT and automated reaction conditions: 
  - Template-independent synthesis (26)
  - improved synthesis yields and, thus, increased oligonucleotide lengths (27)
  - synthesis occurring in mild, aqueous conditions (27)
  - Reduction of secondary structures with higher reaction temperatures (27), because DNA secondary structures can be melted by raising the temperature (27)

Block based semantics and updates via patches
- Random and sequential access (15)
- Retrieval of units smaller than unit of random access (15)
- Software based update patching: faster, more reliable than changing the bases in the lab (15)

## Problem
Ubiquitous data storage in the form of "the cloud" is becoming an everyday norm, becoming the default method of saving all types of information, ranging from videos to photos and more. But data isn’t really in the cloud - it’s stored in giant buildings containing magnetic and optical media such as hard drives, with some buildings taking up "nearly 200 acres of land apiece" (cite). It is predicted that the world will generate around 180 zettabytes of information by 2025, with 22 zettabytes of data being shipped around between 2018 and 2025, 60% in the form of hard drives (cite). With the exponential increase of information creation and sharing, the scalability and capacity of magnetic and optical media cannot meet the demands of the near future. As of 2015, data centers account for around 2% of global energy usage, with individual data centers using as much energy as an airline; this value only grows (cite).

With advancements in DNA synthesis and sequencing, DNA poses a novel medium for information because it is:

- Dense: you can store all of the world’s information in a coffee cup! 
- Durable: it can be stored for millions of years in the correct conditions
- Energy efficient: [TODO]

However, DNA storage still faces bottlenecks in synthesis and sequencing. We hope to enhance synthesis with enzymatic DNA synthesis which has several advantages over chemical synthesis. Terminal deoxynucleotidyl transferase (TdT) elongates single stranded oligonucleotides by randomly adding different nucleotides. Moreover, TdT has a preference for the incorporation of some nucleotides over others, leading to increased rates of sequence-specific errors. TdT works only on single-stranded DNA, due to the enzyme’s structure. Thus, if secondary DNA structures form, synthesis efficiency is reduced. In essence, WT TdT isn’t selective enough by itself to perform accurate DNA Synthesis.

Previous iGEM teams have tackled this issue, with mixed results. The latest team, Aachen iGEM 2021, at most was able to encode and decode 15 nucleotides with 40% accuracy. As such, UBCV iGEM 2024 team is attempting to increase the accuracy of the encoding and decoding of larger sequences by using higher reaction temperatures with thermostable TdT as well as optimizing with alternative reagents the overall protocol in order to reduce the systematic and random errors. Big Biotech companies have gotten around these issues by engineering TdT and creating nucleotide complexes; but these are patented and out of the reach of the public.

Additionally, our team hopes to use software to enhance the retrieval of information stored in DNA storage, with algorithmic means and through the creation of a graphical user interface. Finally, we hope our project helps to demystify concepts in computation, storage systems and DNA through educational efforts and [???]. We hope to use the multidisciplinary nature of synthetic biology to enhance synthesis and retrieval steps of DNA storage.

## Wet Lab

To implement a DNA-based data storage platform, our team will conduct hands-on experiments to construct, characterize, and optimize a thermostable TdT variant as a part of the Modular Cloning (MoClo) system using Escherichia coli (E. coli) as a chassis. The process will involve obtaining and modifying the TdT sequence, selecting appropriate genetic elements, and utilizing the MoClo kit for assembly. The recombinant TdT will be sourced through cell lysis, with subsequent downstream purification methods to extract the enzyme and its characterization to be submitted as a novel part in the iGEM registry.

Apart from the production of recombinant thermostable TdT to synthesize single-stranded DNA, our team will implement various methods to improve upon the work of a previous iGEM team. In particular, we will be exploring alternative primer immobilization methods that will require less reagents and making our system tolerant to higher reaction temperatures to prevent the formation of secondary DNA structures that inhibit TdT’s rate of DNA synthesis. This will increase the synthesis efficiency and accuracy when encoding information and the efficiency of information retrieval, making our system more suitable for data storage applications.

Through bridging the gap between design and application, our wet lab experiments will play a crucial role in translating theoretical concepts into tangible outcomes. By successfully demonstrating the efficacy of a thermostable TdT-based DNA synthesis platform, we hope to contribute to the advancement of DNA-based data storage for future applications.


## Dry Lab

DNA storage faces challenges in offering sequential access, a form of information retrieval that is used frequently in magnetic and optical media. To address this limitation, our dry lab team plans to implement block based semantics by designing algorithms to create elongated primers to semantically represent the storage of information in the form of a file system. Furthermore, we will design encoding and decoding algorithms to convert binary information into biological bases using rotation encoding techniques. Given the difficulty in mutating an existing DNA molecule, our storage system will treat DNA as a persistent data structure, rather than a mutable data structure. Finally, our dry lab team, in collaboration with human practices will design and implement a user-friendly graphical interface to facilitate easy utilization of our DNA storage process. 

To complement the experimental design to optimize the DNA synthesis efficiency of thermostable TdT, we will be conducting various computational modeling projects such as: protein modeling to predict the thermostability of our engineered TdT compared to its wildtype form, modeling the susceptibility of various primers to sequencing errors to aid in our primer generation algorithm, and math modeling to identify the optimal concentrations of various TdT cofactors. These projects will be running in parallel with the hands-on experiments carried out by our wet lab to ensure we can iterate through multiple design cycles to improve our system’s performance.


## Human Practices

As our project is very complex in its experimental design and software components, our team will consult experts, both in industry and academia, to confirm the efficiency and functionality of our project. We also plan to connect with various stakeholders that store data, such as the BC Children’s Hospital and the Archives Association of British Columbia, to broaden and understand the implications of our project. By collaborating with experts and involving local stakeholders, we aim to fulfill our mission of educating and raising awareness about the significance of synthetic biology within our project. Furthermore, by integrating feedback from individuals outside of our team we will be able to highlight important technical and social issues that we may have missed. 

Beyond the laboratory, our team recognizes the importance of understanding and addressing the societal, ethical, and cultural implications of our project. In order to achieve our goals, we plan to run in-class activities in different highschools on the topic of synthetic biology, record a podcast series on United Nations Sustainable Development Goals (SDGs) with experts, start a blog for scientific articles, and organize an Equity, Diversity, and Inclusion (EDI) seminar. Inclusivity is a very crucial part of our mission. We plan on running an EDI seminar to showcase research done by EDI students and professors and have them share their experience and their work.
