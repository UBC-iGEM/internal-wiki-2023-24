# Thermostable TdT

## Overview

The document provides the details related to Terminal deoxynucleotidyl transferase (TdT) utilized in the project. This includes the general description of WT TdT and thermostable TdT, in addition to their application in the project.

## Context and Scope

TdT is a specialized DNA polymerase that catalyzes the addition of nucleotides to the 3' terminus of a DNA molecule in a template-independent manner. This means it is able to synthesize single-strand DNA without an existing DNA strand as a template. This highlights its potential to be utilized as a biological tool to manipulate DNA synthesis, producing DNA strand as designed.

ssDNA is prone to secondary structure formation (1). This issue can be minimized when working under a higher temperature (1). Since wildtype TdT derived from mammals cannot function optimally under a higher temperature (>37°C), this reaction can be achieved using a thermostable TdT, which has a higher optimal activity temperature, which in our case, would be around 47°C.

## Goals

- Clone thermostable TdT
- Produce and purify thermostable TdT
- Optimize TdT reaction condition

## Design

**Thermostable TdT Cloning: Ligation Independent Cloning (LIC)**
Material:

- Plasmid of Choice: Addgene # 29659 - pET His6 sumo TEV LIC cloning vector
- Mutant TdT (purchased from IDT)
- BL21 (DE3) (puchased from NEB)

Procedure:

1. Primer Design

   - Design forward and reverse primer for TdT on geneious

2. PCR Amplification

   - Amplify the LIC fusion tag onto TdT sequence

3. Agarose Gel

   - Gel purification and check if the correct base pairs sequence has been added onto TdT

4. Linearize the plasmid

   - Use SspI restriction enzyme to linearize the vector

5. Gel Purification

   - Gel purify the linearized product and if needed the PCR product

6. Ligation Independent Cloning

   - Use T4 DNA Polymerase reaction with dCTP for insert and dGTP for vector

7. Transformation

   - Transform chemically competent Top10 e.coli with cloning product

8. Colony picking

   - Pick Kanamycin-resistant colonies

9. Miniprep

   - Use Miniprep to isolate plasmid from E.coli

10. Sequencing

    - Send plasmid for Sanger sequencing

**Protein Purification: Immobilized metal affinity chromatography**

Protocol reference [link](https://link.springer.com/protocol/10.1007/978-1-59745-582-4_2)

**TdT Optimization**
**Liquid Phase (Gel)**

- Each reaction was carried out in 20µL total volume.
- All reaction components but the dNTP were assembled in 18µL
  dNTP was prepared in 2µL of water.
- The 18µL mix was composed such that upon mixing with the 2µL dNTP solution, the following initial composition would be obtained: 200µM dNTP, 1X TdT buffer, 0.05µM primer (TBD) 250µM cobalt chloride (if present), 1U/µL TdT
- To initiate the reaction, the 18µL mixture was added to a tube containing the 2µL dNTP mix and mixed immediately by pipetting.
- The reaction was then incubated at room temperature for at least two minutes, resolved on a TBE Polyacrylamide gel
- Length of ssDNA is determined by comparing with the ladder

**Condition to compare:**

Run reaction with each dNTP + ladder + primer reference

- Different dNTP concentration: 10, 25, 50, 100, 200, 400µM
- Different TdT concentration
- Different buffer concentration
- Different temperature: RT vs 37 vs 47 (mutant)
- With/without CoCl2: 0 vs 2.5mM vs 5 mM
- Different reaction time: 2 vs 10 vs 30 min

Testing dNTP concentration need for all 4 types of nucleotides
The rest rxns can be carried with selected dNTPs

Protocol reference [link](https://www.nature.com/articles/s41467-019-10258-1#MOESM1)

**Solid Phase (TBD)**

## How long will this take?

This depends heavily on how successfully each experiment goes. The estimation is around 1 month.

## Reference:

Liang, X., Kuhn, H., & Frank-Kamenetskii, M. D. (2006). Monitoring single-stranded DNA secondary structure formation by determining the topological state of DNA catenanes. Biophysical Journal, 90(8), 2877–2889. https://doi.org/10.1529/biophysj.105.074104
