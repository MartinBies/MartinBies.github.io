---
layout: single
title: "Research and software"
permalink: /research/
---

{% include toc %}

## Physics and Mathematics

By upbringing, I am a theoretical high energy physicist with a focus on string theory. In the past years, I have been working on a framework of string theory, called F-theory. It strongly utilizes geometric tools to investigate solutions to string theory.

Of ample importance for string phenomenology is the number of Higgs fields in a particular compactifications. This is because the existence or absence of these fields determines if a Higgs mechanism can be employed to give masses to the other massless fields. As simple as this may sound, it leads to rich mathematics such as Freyd categories, Chow groups and coherent sheaves.

This analogy extends beyond F-theory. Namely, also in type IIB string theory, the topological B-model and heterotic string theory, such zero mode countings can be phrased in terms of cohomologies of coherent sheaves. Even more, homological mirror symmetry is a categorical equivalence of the category of coherent sheaves (on a certain Calabi-Yau manifold) and the Fukaya category (on the dual Calabi-Yau manifold). This underlines the geometric importance of coherent sheaves, and is why I am very interested in studying these objects.

In a very harsh first order approximation, merely counting sheaf cohomologies allows to tell good and bad string theory solutions apart. To facilitate such types of computations for a large number of geometries, I have developped software packages ranging from toric geometry to category theory. This software is part of the [homalg_project](https://github.com/homalg-project) of [Mohamed Barakat](https://github.com/mohamed-barakat).


## Software on Toric Varieties

Together with *Sebastian Gutsche*, I have developed the package

* [*ToricVarieties*](https://github.com/homalg-project/homalg_project/tree/master/ToricVarieties)

which makes elementary operations on toric varieties accessible within gap. More recently, it has been extended by the package

* [*TopcomInterface*](https://github.com/HereAround/TopcomInterface)

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

For Debian9 and Ubuntu18.04, you can find installation instructions [here](/Instructions.txt). They assume that you do not have a running version of gap yet. It will download the script [homalg_clone](/homalg_clone.sh), which is used to clone a selection of gap-packages from github.

Once the installation is complete, you can navigate into the individual package folders to create the latest documentation and test the installation. To create the latest documentation do the following:

* Navigate into the package folder and locate the file makedoc.g.
* Now issue *gap makedoc.g*, to create the documentation. It will be placed in the *doc* subfolder.
* In case you have a running version of LaTeX, the documentation will be provided by the file manual.pdf.

To test your installation perform the following steps:

* Navigate into the package folder and locate the file makedoc.g.
* Issue *gap makedoc.g*.
* Issue *gap maketest.g*

A first simple input file for gap, which computes some sheaf cohomologies, can be found [here](/example.gi). More examples are provided in the manual [SheafCohomologiesOnToricVarieties](/SheafCohomologiesOnToricVarieties.pdf).

Note that these computations can become very demanding, both in terms of required computational time but also in terms of required computational ressources. Whenever this happens, you may wish to try the command *H0ParallelBySpasm*. It will use the software *Spasm* and perform the necessary computations modulo a prime number. As such they are no longer guaranteed to match the results over the integers. However, for not too involved examples, this will be the case. In addition, the ressources required for performing this computations are significantly reduced.
