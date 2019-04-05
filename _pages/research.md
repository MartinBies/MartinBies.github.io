---
layout: single
title: "Research"
permalink: /research/
---

{% include toc %}

## Physics and mathematics

By upbringing, I am a physicist interested in theoretical high energy physics -- in particular string theory. Currently, my focus rests on F-theory, which utilizes geometry to investigate the properties of solutions to string theory.

In studying F-theory, I have more and more developed an interest in the underlying mathematics. I am fairly interested in studying the role of Chow groups to F-theory (e.g. in anomaly cancellations). 

In taking string theory seriously, one may also wonder if there is a solution to string theory (or F-theory), which exactly resembles the features of our universe. Zero modes can be used to distinguish plausible solutions from solutions, whose features are clearly distinct from the ones of our universe.

Within the frameworks of F-theory, type IIB string theory, the topological B-model and heterotic string theory, zero modes can be counted by sheaf cohomologies of coherent sheaves. For this reason, it is interesting to study these cohomologies groups and means to compute them. Given the vast number of string theory solutions, a computer implementation for these computations comes handy. Consequently, we are lead to...


## Software to model finitely-presented graded S-modules

Toric geometry is easily accessible to computers. As shown in [*Gabriel morphisms and the computability of Serre quotients with applications to coherent sheaves*](https://arxiv.org/abs/1409.2028), one can then utilise the category of finitely-presented graded S-modules (S being the Cox ring of the toric variety of interest) to model coherent sheaves in the computer. Therefore, I have collaborated on both the 
[*homalg_project*](http://homalg-project.github.io/) and the [*CAP_project*](https://homalg-project.github.io/CAP_project/) and have written the following ur packages, which can be used to model the category of finitely-presented graded S-modules in the computer:

* [*CAPCategoryOfProjectiveGradedModules*](https://github.com/HereAround/CAPCategoryOfProjectiveGradedModules)
* [*CAPPresentationCategory*](https://github.com/HereAround/CAPPresentationCategory)
* [*PresentationsByProjectiveGradedModules*](https://github.com/HereAround/PresentationsByProjectiveGradedModules)

By now, the concept of a *PresentationCategory* has been well understood in [*A constructive approach to Freyd categories*](https://arxiv.org/abs/1712.03492). Together with *Sebastian Posur*, I am therefore currently implementing the above structures in the package

* [*FreydCategoriesForCAP*](https://github.com/HereAround/CAP_project/tree/master/FreydCategoriesForCAP)



## Software to compute sheaf cohomologies

To make use of finitely-presented graded S-modules as models for coherent sheaves and to compute sheaf cohomologies based on these models, I have made extensions to the package

* [*ToricVarieties*](https://github.com/homalg-project/homalg_project/tree/master/ToricVarieties)

and have also implemented truncations of finitely-presented graded S-modules in

* [*TruncationsOfPresentationsByProjectiveGradedModules*](https://github.com/HereAround/TruncationsOfPresentationsByProjectiveGradedModules)

These packages then finally allow to load the functionality of my package

* [*SheafCohomologyOnToricVarieties*](https://github.com/HereAround/SheafCohomologyOnToricVarieties)

It provides implementations of various algorithms to compute sheaf cohomologies. Among others, the algorithm described in the appendix of [*cohomologies of coherent sheaves and massless spectra in F-theory*](https://arxiv.org/abs/1802.08860) is implemented there.

Note that this algorithms depends on [*cohomCalg*](https://benjaminjurke.com/academia-and-research/cohomcalg). To organize this dependence efficiently, I am currently developing the package

* [*cohomCalgInterface*](https://github.com/HereAround/cohomCalgInterface)

Once this package is ready, I plan to extend it to make the functionality of the *Koszul-extension* of *cohomCalg* directly accessible to gap.



## Software for triangulations and blowups of toric varieties

Recently, triangulations of toric varieties have been increasingly important to me. I have thus written the package

* [*TopcomInterface*](https://github.com/HereAround/TopcomInterface)

It establishes an interface to the software [*Topcom*](http://www.rambau.wm.uni-bayreuth.de/TOPCOM/). Based on this, my package

* [*TriangulationsAndBlowupsForToricVarieties*](https://github.com/HereAround/TriangulationsAndBlowupsForToricVarieties)

allows to compute triangulations and blowups of toric varieties.



## Documentation of my software packages

Once the above software packages and gap are installed, the latest version of the documentation can be generated as follows:

* Navigate into the package folder
* Issue *gap makedoc.g*
* Navigate into the *doc* subfolder of the package folder
* You should find the file *manual.pdf* with the latest documentation.

For convenience, you can also download these documentations (latest update on 4 april 2019) from the list below:

* [CAPCategoryOfProjectiveGradedModules](/CAPCategoryOfProjectiveGradedModules.pdf)
* [CAPPresentationCategory](/CAPPresentationCategory.pdf)
* [PresentationsByProjectiveGradedModules](/PresentationsByProjectiveGradedModules.pdf)
* [TruncationsOfPresentationsOfProjectiveGradedModules](/TruncationsOfPresentationsOfProjectiveGradedModules.pdf)
* [FreydCategoriesForCAP](/FreydCategoriesForCAP.pdf)
* [ToricVarieties](/ToricVarieties.pdf)
* [SheafCohomologiesOnToricVarieties](/SheafCohomologiesOnToricVarieties.pdf)
* [TopcomInterface](/TopcomInterface.pdf)
* [TriangulationsAndBlowupsOfToricVarieties](/TriangulationsAndBlowupsOfToricVarieties.pdf)


## Overview over the dependencies among my software packages

<embed src="/SoftwarePackages.pdf" type="application/pdf" width="100%"/>

Alternatively, you may download this overview by clicking [here](/SoftwarePackages.pdf).
