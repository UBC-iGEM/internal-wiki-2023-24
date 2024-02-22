# Dry Lab

[Meeting Notes](https://drive.google.com/drive/folders/1QzOAnP1XhyycN8l5DmcQIVxX-E-CWuap?usp=sharing)

## Projects this year

### Hardware

#### BioReactor

- PRIORITY: Highest
- OBJECTIVE: Create a Bioreactor to allow Wet Lab to Culture E Coli for their experiments
- ASSIGNED TO: This would be a combined Wet Lab - Dry Lab Project. From Dry Lab, we think @Matthias Wong would be a good fit, and wet lab will have @Pattarin Blanchard working on this.
- REPORT TO: @Piyush Awasthi and @Stella Kauryzhka will be your point of contact with this, if you guys need resources or support. More details to follow.

#### Microfluidic Probe

- PRIORITY: 2nd
- OBJECTIVE: Create 2 Chips in sequence. First, a Chip with Exposed -OH groups with highly turbulent flow over the mixing region to achieve Solid Phase DNA Synthesis. 2nd, a connected PCR chip which can amplify free floating single stranded DNA.
- ASSIGNED TO: This would be mostly driven by Dry Lab. As such, I think it is best if @Samuel Salitra and @Piyush Awasthi Work on this. We would likely get wet lab support from @Achint Lail and @Diego Ph
- REPORT TO: @Piyush Awasthi and @Tina Wang will be the leads supervising this if we need resources or support.

#### Software 1 - Encoding

- PRIORITY: highest
- OBJECTIVE: implement a software pipeline that when given a file location, compresses the text in that file, segments the file into blocks of trits, encodes information based on the rotation based cipher, generates primers, and applies error correcting codes, while collecting metadata to be used in decoding
- ASSIGNED TO: the error correction is tricky because of our semi-specific encoding, short nucleotide sequences and high rate of deletion errors. We will need help from wet lab to gather constraints on primers and encode sequences that are less likely to form secondary structures. @Lucy Hao and @Riya Alluri will work on this. We will get wet lab support from @Tina Wang and @Qingru Kong.
- REPORT TO: @Lucy Hao, and she will direct questions to wet lab leads.

#### Software 2 - Decoding

- PRIORITY: secondary
- OBJECTIVE: implement a software pipeline that when given a request to retrieve a file, does the opposite of encoding; using the metadata gathered during encoding, collect the information and ECC containing nucleotides out of nucleotide sequence(s), apply error correction, convert bases back to trits then bits and back to text, coalesce the text sequences back into the compressed text and decompress the text to return the original text in the file to the user.
- ASSIGNED TO: This involves going backwards in the encoding pipeline, with some subtle differences. @Lucy Hao and @Sebastian Hyland will work on this. We will get wet lab support from @Tina Wang and @Qingru Kong.
- REPORT TO: @Lucy Hao, and she will direct questions to wet lab leads.

#### Software 3 - GUI

- PRIORITY: low
- OBJECTIVE: design a user friendly interface that can be used by our iHP interviewees to try out our DNA storage software, and also visually display our file system
- ASSIGNED TO: @Lucy Hao @Sebastian Hyland @Riya Alluri and other dry lab members once you have finished your assigned task.
- REPORT TO: @Lucy Hao

#### Modelling 1 - TdT Reaction Kinetics

- PRIORITY: low
- OBJECTIVE: design an expression for the reaction kinetics of TdT. The result would be an expression where we could find the concentration of cofactors, reagents, etc that allow the kinetics of nucleotide addition to be equal for all nucleotides (A, T, G, C)
- ASSIGNED TO: @Lucy Hao can get started on this in parallel with software and maybe @Piyush Awasthi. We will need support from @Achint Lail, @Tina Wang, @Qingru Kong, @Diego Ph
- REPORT TO: wet lab leads

## Goals

1. Create a layman's version of the project from a synthetic biology perspective for dry lab members.

2. Design all dry lab projects to have a clear and meaningful integration to another sub team.

3. Have a constant feedback loop with wet lab team.

4. Engage in outreach events with human practices.

## Timeline

| Event                                                                | Start Date | End Date  |
| -------------------------------------------------------------------- | ---------- | --------- |
| Project pitch brainstorming (done)                                   | January    | February  |
| Assessment of all dry lab team members, start to have one on ones    | February   | March     |
| Start thinking of potential dry lab projects (Leads)                 | February   | April     |
| Search for resources (Leads initially, later whole team)             | March      |           |
| Assign self learning tasks (Leads)                                   | March      |           |
| Finalize dry lab projects (Make sure connection to wet lab is clear) | March      | April     |
| Individual projects begin                                            | April      | August    |
| Project check-in #1                                                  | April      |           |
| Wiki Writing (GitLab Repo is provisioned)                            | June       | September |
| Project check-in #2                                                  | June       |           |
| Project check-in #3                                                  | July       |           |
| Project check-in #4                                                  | August     |           |
| Jamboree Preparation                                                 | September  | October   |

## iGEM Medal Requirements

### Bronze

- [ ] Contributions Page
  - [ ] Committing work to GitHub

### Silver

- [ ] Engineering Success
- [ ] [Human Practices](../human-practices/index.md)

### Gold

- [ ] Wiki Writing
- [ ] Special Award Nomination
  - [ ] Best Software Tool
  - [ ] Best Model
  - [ ] Best Hardware
