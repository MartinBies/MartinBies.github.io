---
layout: single
title: "Software"
permalink: /software/
---

{% include toc %}


## Overview

I work on open-source software on [github](https://github.com/), have added about 500.000 lines of codes and modified about another 500.000 lines of code. My coding experience includes gap, python, julia and C++. The latest news on my software are to be found at my [github-page](https://github.com/herearound).


## Software on Toric Varieties

Together with [*Sebastian Gutsche*](https://sebasguts.github.io/), I have developed the package

* [*ToricVarieties*](https://github.com/homalg-project/ToricVarieties_project/tree/master/ToricVarieties)

which makes operations on toric varieties accessible within gap (and hopefully very soon also in Julia as part of the [*Oscar*](https://oscar.computeralgebra.de/)). Among others, this package has been extended by the package

* [*TopcomInterface*](https://github.com/homalg-project/ToricVarieties_project/tree/master/TopcomInterface)

This package provides an interface to the software [*Topcom*](https://www.wm.uni-bayreuth.de/de/team/rambau_joerg/TOPCOM/index.html) and allows to construct toric varieties based on their triangulations (or in physics language, based on their GLSM charges). This functionality is available via the package

* [*NConvex*](https://github.com/homalg-project/NConvex)

Most recently, I focus on migrating the functionality of the [ToricVarieties_project](https://github.com/homalg-project/ToricVarieties_project) into

* [OSCAR Computer Algebra System](https://github.com/oscar-system/Oscar.jl)

The latter uses the modern programming language [Julia](https://julialang.org/).



## Software on Freyd Categories

The first implementations of a *PresentationCategory* category in the language of the [*CAP_project*](https://homalg-project.github.io/CAP_project/) were available in the GAP-packages

* [*CAPCategoryOfProjectiveGradedModules*](https://github.com/HereAround/CAPCategoryOfProjectiveGradedModules)
* [*CAPPresentationCategory*](https://github.com/HereAround/CAPPresentationCategory)
* [*PresentationsByProjectiveGradedModules*](https://github.com/HereAround/PresentationsByProjectiveGradedModules)

By now, this concept has been much better understood in [*A constructive approach to Freyd categories*](https://arxiv.org/abs/1712.03492) and [*Tensor products of finitely presented functors*](https://www.worldscientific.com/doi/abs/10.1142/S0219498822501869). Together with [*Sebastian Posur*](https://sebastianpos.github.io/), I have therefore remodelled these packages. The latest implementation is now available in the package

* [*FreydCategoriesForCAP*](https://github.com/homalg-project/CAP_project/tree/master/FreydCategoriesForCAP)



## Software on Sheaf Cohomologies

For toric varieties, the category of coherent sheaves can be modelled by the category of finitely-presented graded S-modules (S being the Cox ring of the toric variety of interest) (c.f. [*Gabriel morphisms and the computability of Serre quotients with applications to coherent sheaves*](https://arxiv.org/abs/1409.2028)). The latter is a special instance of a Freyd category. This is the reason why we can use the above packages to model coherent sheaves in the computer.

In order to compute the associated sheaf cohomologies, a number of extensions are necessary. First, there are the packages

* [*ToolsForFPGradedModules*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/ToolsForFPGradedModules)
* [*TruncationsOfFPGradedModules*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/TruncationsOfFPGradedModules)

which extend the functionality of the finitely-presented graded S-modules, as implemented in the package *FreydCategories*. Note that the latter replaces the by now deprecated package

* [*TruncationsOfPresentationsByProjectiveGradedModules*](https://github.com/HereAround/TruncationsOfPresentationsByProjectiveGradedModules)

Next, we provide interfaces to [*cohomCalg*](https://benjaminjurke.com/academia-and-research/cohomcalg) and [*spasm*](https://github.com/cbouilla/spasm):

* [*cohomCalgInterface*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/cohomCalgInterface)
* [*SpasmInterface*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/SpasmInterface)

Based on *cohomCalgInterface*, we extend the available functionalities for toric varieties in

* [*AdditionsForToricVarieties*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/AdditionsForToricVarieties)

Finally, all of these enter the central package

* [*SheafCohomologyOnToricVarieties*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/SheafCohomologyOnToricVarieties)

It provides implementations of various algorithms to compute sheaf cohomologies. Among others, the algorithm described in the appendix of [*cohomologies of coherent sheaves and massless spectra in F-theory*](https://archiv.ub.uni-heidelberg.de/volltextserver/24045/) is implemented there. 

## Software for F-theory vacua

### H0Approximator

* [*H0Approximator*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/H0Approximator)

On a hypersurface curve in a del-Pezzo 3 surface, we consider the pullback of a line bundle from the dP3. This package approximates the allowed global section values for this line bundle on the moduli space of all deformations of this curve. This approximation systematically underestimates the number of sections. However, it provides this estimate over the entire moduli space. Furthermore, as this estimate is based mostly on topological data, we could easily implement the necessary algorithms in C++, so that they terminate rather quickly. This implementation is the result [*Machine Learning and Algebraic Approaches towards Complete Matter Spectra in 4d F-theory*](https://link.springer.com/article/10.1007%2FJHEP01%282021%29196).

### QSMExplorer

* [*QSMExplorer*](https://github.com/homalg-project/ToricVarieties_project/tree/master/QSMExplorer)

The largest currently known class of F-theory Standard Models without *chiral* exotics and gauge coupling unifications was described in [Quadrillion F-theory Standard Models](https://arxiv.org/abs/1903.00009). For short, we term these solutions *QSM*s. All of these geometries are given in terms of toric 3-folds. We have investigated these geometries in much detail in

* Martin Bies, Mirjam Cvetič, Ron Donagi, Muyang Liu, Marielle Ong [Root Bundles and Towards Exact Matter Spectra of F-theory MSSMs](https://link.springer.com/article/10.1007%2FJHEP09%282021%29076)
* Martin Bies, Mirjam Cvetič, Muyang Liu [Statistics of Root Bundles Relevant for Exact Matter Spectra of F-theory MSSMs](https://journals.aps.org/prd/abstract/10.1103/PhysRevD.104.L061903)

The *QSMExplorer* -- implemented together with [Muyang Liu](https://katalog.uu.se/empinfo/?id=N21-1557) -- reflects these attempts to understand these solutions. It allows to directly list the defining toric data and Hodge numbers for these computations. In addition, as we describe in the above works, we study certain canonical nodal curves, to learn more about these F-theory solutions. The data of these nodal curves and, most importantly, algorithm to count so-called limit root bundles (as introduced in [*Moduli of roots of line bundles on curves*](https://arxiv.org/abs/math/0404078)) are available via this package. Extensions of the above works are currently my most active research focus. Therefore, in particular the package *QSMExplorer* is subject to major changes.

A visualisation of the dependencies among my packages can be found [here](/SoftwarePackages.pdf).


## Documentation

Below, you can find the documentations of the GAP-packages in the [ToricVarieties_project](https://github.com/homalg-project/ToricVarieties_project) (last update 01/01/2022):

* [AdditionsForToricVarieties](/AdditionsForToricVarieties.pdf)
* [cohomCalgInterface](/cohomCalgInterface.pdf)
* [H0Approximator](/H0Approximator.pdf)
* [QSMExplorer](/QSMExplorer.pdf)
* [SheafCohomologiesOnToricVarieties](/SheafCohomologiesOnToricVarieties.pdf)
* [SpasmInterface](/SpasmInterface.pdf)
* [ToolsForFPGradedModules](/ToolsForFPGradedModules.pdf)
* [TopcomInterface](/TopcomInterface.pdf)
* [ToricVarieties](/ToricVarieties.pdf)
* [TruncationsForFPGradedModules](/TruncationsForFPGradedModules.pdf)

For the documentation of the [OSCAR Computer Algebra System](https://github.com/oscar-system/Oscar.jl) please see [here](https://oscar-system.github.io/Oscar.jl/dev/) and [here](https://oscar-system.github.io/Oscar.jl/dev/ToricVarieties/NormalToricVarieties/) for details on the available functionality of toric geometry in *OSCAR*.

The following packages are deprecated. I provide documentation merely for completeness:

* [CAPCategoryOfProjectiveGradedModules](/CAPCategoryOfProjectiveGradedModules.pdf)
* [CAPPresentationCategory](/CAPPresentationCategory.pdf)
* [PresentationsByProjectiveGradedModules](/PresentationsByProjectiveGradedModules.pdf)
* [TruncationsOfPresentationsOfProjectiveGradedModules](/TruncationsOfPresentationsOfProjectiveGradedModules.pdf)




## Installation instructions

I provide an installation script for the *GAP* based [ToricVarieties_project](https://github.com/homalg-project/ToricVarieties_project), which attempts to install this software and all dependencies automatically. This script can be found [here](/Install.sh). It has been tested on Debian9 and Ubuntu 18.04 (last updated on January 2, 2022). Among others, [gap-4.11.1](https://www.gap-system.org/Releases/4.11.1.html) will be installed. Once the installation is complete, you can create the latest documentation as follows:

* Navigate into the package folder and issue *make doc*.
* Tests can be executed by issuing *make test* inside the *ToricVarieties_project* folder.

Note that tests are run on a daily bases on *github*. See [here](https://github.com/homalg-project/ToricVarieties_project/actions/workflows/test.yml) for the latest test results.
