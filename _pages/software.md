---
layout: single
title: "Software"
permalink: /software/
---

{% include toc %}

## Software on Toric Varieties

Together with *Sebastian Gutsche*, I have developed the package

* [*ToricVarieties*](https://github.com/homalg-project/homalg_project/tree/master/ToricVarieties)

which makes elementary operations on toric varieties accessible within gap. More recently, it has been extended by the package

* [*TopcomInterface*](https://github.com/homalg-project/TopcomInterface)

This functions as interface to the software [*Topcom*](http://www.rambau.wm.uni-bayreuth.de/TOPCOM/) and allows to construct toric varieties based on their triangulations (or in physics language, based on their GLSM charges). This functionality is available via the package

* [*NConvex*](https://github.com/homalg-project/NConvex/graphs/contributors)



## Software on Freyd Categories

The first implementations of a *PresentationCategory* category in the language of the [*CAP_project*](https://homalg-project.github.io/CAP_project/) are available in the packages

* [*CAPCategoryOfProjectiveGradedModules*](https://github.com/homalg-project/CAPCategoryOfProjectiveGradedModules)
* [*CAPPresentationCategory*](https://github.com/homalg-project/CAPPresentationCategory)
* [*PresentationsByProjectiveGradedModules*](https://github.com/homalg-project/PresentationsByProjectiveGradedModules)

By now, this concept has been much better understood in [*A constructive approach to Freyd categories*](https://arxiv.org/abs/1712.03492) and [*Tensor products of finitely presented functors*](https://arxiv.org/abs/1909.00172). Together with *Sebastian Posur*, I have therefore remodelled these packages. The latest implementation is now available in the package

* [*FreydCategoriesForCAP*](https://github.com/homalg-project/CAP_project/tree/master/FreydCategoriesForCAP)



## Software on Sheaf Cohomologies

For toric varieties, the category of coherent sheaves can be modelled by the category of finitely-presented graded S-modules (S being the Cox ring of the toric variety of interest) (c.f. [*Gabriel morphisms and the computability of Serre quotients with applications to coherent sheaves*](https://arxiv.org/abs/1409.2028)). The latter is a special instance of a Freyd category. This is the reason why we can use the above packages to model coherent sheaves in the computer.

In order to compute the associated sheaf cohomologies, a number of extensions are necessary. First, there are the packages

* [*ToolsForFPGradedModules*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/ToolsForFPGradedModules)
* [*TruncationsOfFPGradedModules*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/TruncationsOfFPGradedModules)

which extend the functionality of the finitely-presented graded S-modules, as implemented in the package *FreydCategories*. Note that the latter replaces the by now deprecated package

* [*TruncationsOfPresentationsByProjectiveGradedModules*](https://github.com/homalg-project/TruncationsOfPresentationsByProjectiveGradedModules)

Next, we provide interfaces to [*cohomCalg*](https://benjaminjurke.com/academia-and-research/cohomcalg) and [*spasm*](https://github.com/cbouilla/spasm):

* [*cohomCalgInterface*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/cohomCalgInterface)
* [*SpasmInterface*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/SpasmInterface)

Based on *cohomCalgInterface*, we extend the available functionalities for toric varieties in

* [*AdditionsForToricVarieties*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/AdditionsForToricVarieties)

Finally, all of these enter the central package

* [*SheafCohomologyOnToricVarieties*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/SheafCohomologyOnToricVarieties)

It provides implementations of various algorithms to compute sheaf cohomologies. Among others, the algorithm described in the appendix of [*cohomologies of coherent sheaves and massless spectra in F-theory*](https://arxiv.org/abs/1802.08860) is implemented there. 

[Here](/SoftwarePackages.pdf) is a visualisation of the dependencies among my packages.


## Documentation

Below, you can find the documentations of my software packages (last update 01/02/2020):

* [CAPCategoryOfProjectiveGradedModules](/CAPCategoryOfProjectiveGradedModules.pdf)
* [CAPPresentationCategory](/CAPPresentationCategory.pdf)
* [PresentationsByProjectiveGradedModules](/PresentationsByProjectiveGradedModules.pdf)
* [TruncationsOfPresentationsOfProjectiveGradedModules](/TruncationsOfPresentationsOfProjectiveGradedModules.pdf)
* [ToolsForFPGradedModules](/ToolsForFPGradedModules.pdf)
* [TruncationsForFPGradedModules](/TruncationsForFPGradedModules.pdf)
* [TopcomInterface](/TopcomInterface.pdf)
* [ToricVarieties](/ToricVarieties.pdf)
* [AdditionsForToricVarieties](/AdditionsForToricVarieties.pdf)
* [cohomCalgInterface](/cohomCalgInterface.pdf)
* [SpasmInterface](/SpasmInterface.pdf)
* [SheafCohomologiesOnToricVarieties](/SheafCohomologiesOnToricVarieties.pdf)


## Installation instructions

Installation instructions, that have been tested for Debian9 and Ubuntu 18.04 (on 01/02/2020) can be found [here](/Instructions.txt). Among others, these instructions install [gap-4.10.2](https://www.gap-system.org/Releases/4.10.2.html) and download the script [homalg_clone.sh](/homalg_clone.sh), which clones a selection of gap-packages from github.

Once the installation is complete, you can create the latest documentation as follows:

* Navigate into the package folder and locate the file makedoc.g.
* Issue *gap makedoc.g*.
* The documentation will be created and placed in the *doc* subfolder. If you have a running version of LaTeX, the documentation will be printed to the file manual.pdf.

To test your installation perform the following steps:

* Navigate into the package folder and locate the file makedoc.g.
* Issue *gap makedoc.g*.
* Issue *gap maketest.g*

A first simple input file for gap, which computes some sheaf cohomologies, can be found [here](/example.g). More examples are provided in the manual [SheafCohomologiesOnToricVarieties](/SheafCohomologiesOnToricVarieties.pdf).

Note that these computations can become very demanding, both in terms of required computational time but also in terms of required computational ressources. Whenever this happens, you may wish to try the command *H0ParallelBySpasm*. It use the software *Spasm* and performs the necessary computations modulo a prime number (by default 42013). Consequently, it is no longer guaranteed that the so-obtained results match the results obtained over the integers or rational numbers. However, for not too involved examples, this will be the case. In addition, Spasm demands and consumes only very few computational ressources.
