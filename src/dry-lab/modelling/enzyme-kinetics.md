# Enzyme Kinetics

## Overview

To create a model of DNA synthesis with terminal deoxynucleotidyl transferase (TdT), where parameters such as concentration of reagents can be optimized to ensure kinetics of nucleotide addition are equal to each other [^tdt]. 

## Context and Scope

TdT adds bases promiscuously, meaning the four bases of DNA do not add at the same rate [^add]. This makes semi-specific synthesis challenging, as under conditions where concentrations of reagents are not tailored to each nucleotide, each of the four different nucleotides will add at different rates, meaning the number of nucleotides added will be different; we may add the A nucleotides very well, but struggle to add one single T nucleotide. This was a problem faced by another iGEM team, resulting in a high rate of deletion of bases. 

### Cofactors
TdT uses divalent metal ions to facilitate addition of nucleotides. The concentration and type of divalent metal ion will probably have the biggest impact on the rate of nucleotide addition. Divalent metal ions that TdT can use include Co<sup>2+</sup>, Mn<sup>2+</sup>, Zn<sup>2+</sup> and Mg<sup>2+</sup>. 

* General notes [^mg]:
    * Extension rate of dATP:  Mg<sup>2+</sup> > Zn<sup>2+</sup> > Co<sup>2+</sup> > Mn<sup>2+</sup>
    * Mg<sup>2+</sup>: prefers dGTP and dATP
    * Co<sup>2+</sup>: prefers dCTP and dTTP
    * Zn<sup>2+</sup>: positive effector for TdT, when micromolar quantities are added with Mg<sup>2+</sup>
        * Induce conformational changes
    * Polymerization rates lower in presence of Mn<sup>2+</sup>

“metal ions directly influence the mechanism of template-independent polymerization by changing the location of the rate-limiting step” [^ion]

### Temperature

WT TdT and thermostable TdT synthesize DNA at different temperatures. This means WT TdT modeling may not accurately reflect the kinetic capacity of thermostable TdT. 

### Nucleotide types

If we want to add fluorescent nucleotides, it is not certain if these nucleotides with an extra benzene/organic molecule add at the same rate as WT nucleotides. 

* “TdT uses non-natural nucleotides such as 5-NITP with identical efficiencies as dGTP, the preferred natural nucleotide.” [^nt]
* Inability to elongate bulky non-natural nucleotides may be due to steric constraints from 16-amino acid loop [^mg]

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
Depends on the mechanism: TdT functions via “rapid equilibrium random kinetic mechanism”
* “TdT catalyzes DNA synthesis in a strictly distributive mode”: 

#### Michaelis-menten Model
* Not suitable according to Aachen, since DNA strand is not always attached to enzyme?
* Only for single substrate reactions

#### Multi substrate model [^mss]
* For multiple substrates, can bind sequentially or non-sequentially
    * Also random: order of binding doesn’t matter
    * ordered reactions: one substrate must bind before the other
* Substrate A kept constant, while substrate B is varied
    * Similar to single-substrate enzyme, then vary A and keep B constant
* Does TdT care if nucleotide or metal ion binds first? 
* TdT: two substrate, two product random order mechanism (Aachen)


### General guide to reaction optimization [^rt]:
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
1. Benzo-expanded dxNTPs [^benzo]: Up to 30 consecutive monomers can be incorporated by TdT
2. [Mixture of labelled dUTP and dNTPs](https://cshprotocols.cshlp.org/content/2021/8/pdb.prot100685.long)
3. [Mixture of fluorescent dNTPs and natural dNTPs](https://pubs.acs.org/doi/epdf/10.1021/ac200946t)
        
## Current solutions
* Aachen: [https://2021.igem.org/Team:Aachen/Model](https://2021.igem.org/Team:Aachen/Model)
    * Calculate reaction velocities according to MM
    * Substrate: nucleotide to incorporate
        * Literature value for dNTP affinity 
    * instead of MM used two substrate model
    * DNA pools: for each length of DNA strand, new pool created, flux from one pool to another modeled 
        * Concentration of no elongated DNA strands lead to error
    * Code: [https://static.igem.org/mediawiki/2021/5/5f/T--Aachen--documents--Modeling--modeling_code_igem_aachen_2021.zip](https://static.igem.org/mediawiki/2021/5/5f/T--Aachen--documents--Modeling--modeling_code_igem_aachen_2021.zip)
        * We could reuse their code, refit to our parameters, and directly start testing

## How do we test this?
* Dry lab can start creating the model in silico and run the reactions in silico, and then use wet lab data as it becomes available.


## How long will this take?
From whenever dry lab begins modeling, to the end of the wet lab experiments.

---

[^tdt]: https://en.wikipedia.org/wiki/Terminal_deoxynucleotidyl_transferase

[^add]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2846215/

[^ion]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2846215/

[^nt]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3045586/

[^mg]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2846215/

[^rt]: https://pubs.acs.org/doi/full/10.1021/acscatal.2c05045

[^benzo]: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3045586/

[^mss]: https://chem.libretexts.org/Courses/University_of_Arkansas_Little_Rock/CHEM_4320_5320%3A_Biochemistry_1/05%3A_Michaelis-Menten_Enzyme_Kinetics/5.6%3A_Multi-Substrate_Sequential_Mechanisms
