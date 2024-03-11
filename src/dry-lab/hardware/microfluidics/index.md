# Microfluidics

## Overview
Microfluidics is a technology that involves the precise manipulation of fluids at the microscale, often within channels of tens to hundreds of micrometers in size. This technology is particularly significant in biomedical research and diagnostics due to its ability to handle small volumes of fluids with high precision and control, leading to reduced reagent use and faster analysis times [@origins_microfluidics]. 

In our DNA synthesis project, microfluidics can revolutionize the process by enabling the rapid and efficient assembly of DNA sequences by facilitating the precise delivery and mixing of nucleotides in controlled conditions. This allows for the synthesis of long strands of DNA with high accuracy in a platform that can support high-throughput synthesis through parallel production of multiple DNA sequences [@outlook_microfludics].

## Context and Scope

In the context of our overall DNA synthesis topic, microfluidics will be taking on 3 major projects: 

### Project 1: PDMS/PMMA-Glass DNA Synthesis Chip 

The easiest chip to produce given Dr. Following Folch's advice, this chip would involve vertical and horizontal channels cut into PMMA, allowing reagent to flow over a glass channel. DNA synthesis would occur over the glass section, using techniques and reagents supplied by wet lab. 

### Project 2: Fluid Distribution System

Here we design a microfluidic pump and reservoir system that can take reagents up from separated wells, mix them macroscopically or in a microfluidic mixer, and then circulate them through a microfluidic chip before recovering them into a secondary reservoir. 

Current ideas for the pump include a peristaltic, or syringe based negative pressure pump. Fluids could be redirected macroscopically using 3D printed valves, examples of which exist on Arduino forums. Closed circuit circulation is currently, and will likely need to be solved macroscopically as well. 

### Project 3: PCR on a Chip

Once we have ssDNA, the same chip’s reaction chambers would be responsible for converting it into dsDNA, before supplying it to a PCR on a Chip module. Here, we would attempt to amplify the generated DNA, to ensure more copies being present before going into long term storage. This last project is very ambitious, and likely time and skill dependent. It will depend on a number of factors, primarily Samuel and Piyuh’s motivation and availability during the summer, and access to the SBME makerspace. 

## Goals and non-goals

At the very least, it is imperative we finish Project 1. It is no longer technically challenging and is necessary for our project to be holistic - and it would be a requirement for our Gold Medal. 

Project 2 would add a layer of “splendor” to the process, but is not necessary for the functionality of the process. It would help us with our petition for a project award, past a medal requirement. 

Project 3 is very impressive, as it has only existed in literature and never been attempted in this timeframe before. It would require substantial makerspace time and near constant testing, but if pulled off would guarantee some sort of award. 

## Diagram

The two for the DNA synthesis design are as follows: 
![chips](https://github.com/UBC-iGEM/internal-wiki-2023-24/assets/55033656/2f9fee88-4a3c-4e81-af31-84737c6a7142)

Here, the channels are made out of PMMA, and are mostly lateral. This would allow us to utilize a laser cutter in the Makerspace and not require any additional materials, although the BioMEMs laser cutters could be more useful due to a higher resolution. 

For our valves, look at this to get a good idea of what we want to do: 

[https://www.instructables.com/3d-Printing-Servo-Controlled-and-Other-Valves/](https://www.instructables.com/3d-Printing-Servo-Controlled-and-Other-Valves/)

For our project, we will likely be using a combination of pinch valves and check valves. 

Finally for the pump, we would either be going with a 3D printed peristaltic pump, or a syringe based negative pressure pump. Check these links out for examples: 

[https://blog.arduino.cc/2023/02/22/a-diy-peristaltic-pump-controlled-by-an-arduino/](https://blog.arduino.cc/2023/02/22/a-diy-peristaltic-pump-controlled-by-an-arduino/)

[https://www.youtube.com/watch?v=0KjniIBHNMo](https://www.youtube.com/watch?v=0KjniIBHNMo)


## Build Process 

The build process would follow the DBT cycle, and we would be documenting heavily using DHFs (since all BMEG is familiar with this, Samuel will be caught up to speed). 

The process would begin with designing on SolidWorks, before 3D printing in the SBME Makerspace and assembly. We would be using Arduinos for all our electronic work. Some of the tools being used would be the laser cutters,  soldering stations, drill press and plastic welding applications. 

For microfluidic channels, we would need an additional step of flow simulation on COMSOL, before the fabrication step. 


## How long will this take?
- Project 1 should be complete by Early June. 
- Project 2 should be complete by end of July.
- Project 3 should be complete by end of August. 

---