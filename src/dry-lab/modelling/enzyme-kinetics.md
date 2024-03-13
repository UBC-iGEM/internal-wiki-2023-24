# Enzyme Kinetics

## Overview

To create a model of DNA synthesis with terminal deoxynucleotidyl transferase (TdT), where parameters such as concentration of reagents can be optimized to ensure kinetics of nucleotide addition are equal to each other [@a2023_terminal]. 

## Context and Scope

TdT adds bases promiscuously, meaning the four bases of DNA do not add at the same rate [@motea_2010_terminal]. This makes semi-specific synthesis challenging, as under conditions where concentrations of reagents are not tailored to each nucleotide, each of the four different nucleotides will add at different rates, meaning the number of nucleotides added will be different; we may add the A nucleotides very well, but struggle to add one single T nucleotide. This was a problem faced by another iGEM team, resulting in a high rate of deletion of bases. 

### Cofactors
TdT uses divalent metal ions to facilitate addition of nucleotides. The concentration and type of divalent metal ion will probably have the biggest impact on the rate of nucleotide addition. Divalent metal ions that TdT can use include Co<sup>2+</sup>, Mn<sup>2+</sup>, Zn<sup>2+</sup> and Mg<sup>2+</sup>. 

* General notes [@motea_2010_terminal]:
    * Extension rate of dATP:  Mg<sup>2+</sup> > Zn<sup>2+</sup> > Co<sup>2+</sup> > Mn<sup>2+</sup>
    * Mg<sup>2+</sup>: prefers dGTP and dATP
    * Co<sup>2+</sup>: prefers dCTP and dTTP
    * Zn<sup>2+</sup>: positive effector for TdT, when micromolar quantities are added with Mg<sup>2+</sup>
        * Induce conformational changes
    * Polymerization rates lower in presence of Mn<sup>2+</sup>

The concentration of metals ions will be important to model, as “metal ions directly influence the mechanism of template-independent polymerization by changing the location of the rate-limiting step” [@motea_2010_terminal].

### Temperature

WT TdT and thermostable TdT synthesize DNA at different temperatures [@puay_2020_evolving]. This means WT TdT modeling may not accurately reflect the kinetic capacity of thermostable TdT. 

### Nucleotide types

If we want to add fluorescent nucleotides, it is not certain if these nucleotides with an extra benzene/organic molecule add at the same rate as WT nucleotides, since the ultimate goal is to synthesis DNA with wild type nucleotides. Literature has stated that “TdT uses non-natural nucleotides such as 5-NITP with identical efficiencies as dGTP, the preferred natural nucleotide.” [@motea_2010_terminal], however, TdT has "inability to elongate bulky non-natural nucleotides may be due to steric constraints from 16-amino acid loop" [@motea_2010_terminal].

## Goals and non-goals
* Design a model of WT TdT enzyme kinetics to ensure rate of base addition is equal for each base, and transfer that model to thermostable TdT.

## The actual design
### Parameters to model/vary
* Cofactors 
* Nucleotide concentration
* Enzyme concentration 

### Parameters to collect?
* Concentration of varying cofactors
* Concentration of enzyme
* Initial rate: 
    * Require Early linear potion of Concentration vs. time profile 
* RPKA/VTNA:
    * Two or more time course reaction profiles compared in pairwise function, initial concentration of reagents/catalysts varied to determine impact

### Model type
The model type depends on the TdT mechanism; TdT functions via “rapid equilibrium random kinetic mechanism”, and “TdT catalyzes DNA synthesis in a strictly distributive mode” [@motea_2010_terminal].

#### Michaelis-menten Model
According to Aachen, this model, for single substrate reactions, is not suitable according to Aachen, since DNA strand is not always attached to enzyme [@_2021_teamaachenmodel]. So we must look for another model, such as a multi substrate model [@a2019_56].

#### Multi substrate model 
If there are multiple substrates, they can bind sequentially or non-sequentially. The order of binding also matters, where in an ordered reactions, one substrate must bind before the other. Experiments are designed to keep substrate A kept constant, while substrate B is varied, to make the problem, According to Aachen TdT is two substrate, two product random order mechanism [@_2021_teamaachenmodel].

### General guide to reaction optimization [@deem_2023_best]:
1. Find initial reaction conditions, which can be identified through small-scale batch end point screening. This will probably be done with gel, but for sake of time we might be forced to look into literature.
2. Initial time course survey, a fast/quick way to get an initial understanding of the reaction at hand. Identify if there is induction period, to see what assumptions we can form, for instance if the reaction is under steady state.
3. Reoptimization, using initial time course survey
4. Control experiments, to see effect of order of addition, change in sample composition over time and whether the enzyme is stable over duration time.
5. Reproducibility, to show reproducible workflow with final reaction conditions collected in step 3.
6. Validate method of quantification; how is collected data converted to concentration vs time?
7. Kinetic experiments, which can we run after above is done, use RPKA and VTNA to establish kinetic relationships.
8. Validate conclusions, with a hypothesis, usually reaction modeling done in silico via Dynochem, COPASI, Zenth.

### Real time monitoring?
For more details, refer to wet lab documentation. Monitoring of DNA length is going to be done through gel (not real time, can't tell which base is being added) or fluorescence (requires modified nucleotides).

#### Gel
1. Transfer reaction into gel and run it (~20ul) → run gel → can see different lengths (mass)
2. Can’t check specific bases that were added
3. Want to test if it can successfully add anything given a set rxn parameters

#### Single-Molecule Fluorescence Microscopy: 
1. Benzo-expanded dxNTPs [@jarchowchoy_2010_fluorescent]: Up to 30 consecutive monomers can be incorporated by TdT
2. [Mixture of labelled dUTP and dNTPs](https://cshprotocols.cshlp.org/content/2021/8/pdb.prot100685.long)
3. [Mixture of fluorescent dNTPs and natural dNTPs](https://pubs.acs.org/doi/epdf/10.1021/ac200946t)
        
## Current solutions
Aachen used two substrate model instead of MM. Additionally, modelled DNA pools, where for each length of DNA strand, new pool created, flux from one pool to another modeled. They found that concentration of DNA strands with no elongation lead to error [@_2021_teamaachenmodel].
* Code: [https://static.igem.org/mediawiki/2021/5/5f/T--Aachen--documents--Modeling--modeling_code_igem_aachen_2021.zip](https://static.igem.org/mediawiki/2021/5/5f/T--Aachen--documents--Modeling--modeling_code_igem_aachen_2021.zip)
* We could reuse their code, refit to our parameters, and directly start testing

## How do we test this?
* Dry lab can start creating the model in silico and run the reactions in silico, and then use wet lab data as it becomes available.

## How long will this take?
From whenever dry lab begins modeling, to the end of the wet lab experiments.

---

