---
layout: single
title: "Software"
permalink: /software/
---

{% include toc %}


## Overview

I work on open-source software on [github](https://github.com/herearound), where I have added about 500.000 lines of codes and modified about another 500.000 lines of code. My coding experience includes gap, python, julia and C++.

## [ToricVarieties_project](https://github.com/homalg-project/ToricVarieties_project)

### Overview

This software is written in [GAP-4](https://www.gap-system.org/Releases/4.11.1.html) and C++, is part of the [homalg_project](https://github.com/homalg-project) of [Mohamed Barakat](https://github.com/mohamed-barakat) and uses the [CAP_project](https://github.com/homalg-project/CAP_project).


### Content

#### Toric Varieties

* [*ToricVarieties*](https://github.com/homalg-project/ToricVarieties_project/tree/master/ToricVarieties) (together with [*Sebastian Gutsche*](https://sebasguts.github.io/)): General functionality for toric varieties.
* [*TopcomInterface*](https://github.com/homalg-project/ToricVarieties_project/tree/master/TopcomInterface): Interface to [*Topcom*](https://www.wm.uni-bayreuth.de/de/team/rambau_joerg/TOPCOM/index.html), so that toric varieties can be constructed from triangulations.

#### Coherent sheaves

Coherent sheaves on toric varieties can be modelled by f.p. graded S-modules (S being the Cox ring of the toric variety of interest) (c.f. [*Gabriel morphisms and the computability of Serre quotients with applications to coherent sheaves*](https://arxiv.org/abs/1409.2028)). Based on this, we provide the following packages:

* [*FreydCategoriesForCAP*](https://github.com/homalg-project/CAP_project/tree/master/FreydCategoriesForCAP): Efficient modeling of f.p. graded S-modules and thereby coherent sheaves.
* [*ToolsForFPGradedModules*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/ToolsForFPGradedModules): Resolutions and smaller presentations.
* [*TruncationsOfFPGradedModules*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/TruncationsOfFPGradedModules) (replaces the deprecated [*TruncationsOfPresentationsByProjectiveGradedModules*](https://github.com/HereAround/TruncationsOfPresentationsByProjectiveGradedModules)): Truncations, which are heavily used in the computation of sheaf cohomologies.
* [*SheafCohomologyOnToricVarieties*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/SheafCohomologyOnToricVarieties): Various algorithms for sheaf cohomologies, in particular those described in [*cohomologies of coherent sheaves and massless spectra in F-theory*](https://archiv.ub.uni-heidelberg.de/volltextserver/24045/).

We extend this functionality with interfaces to [*cohomCalg*](https://benjaminjurke.com/academia-and-research/cohomcalg) and [*spasm*](https://github.com/cbouilla/spasm):

* [*cohomCalgInterface*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/cohomCalgInterface): Line bundle cohomologies via the famous *cohomCalg* algorithm.
* [*AdditionsForToricVarieties*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/AdditionsForToricVarieties): Vanishing sets, based on *cohomCalg*.
* [*SpasmInterface*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/SpasmInterface): Faster sheaf cohomology algorithm modulo a high prime number. This can be used as approximation.


#### F-theory vacua

* [*H0Approximator*](https://github.com/homalg-project/SheafCohomologyOnToricVarieties/tree/master/H0Approximator)

On a hypersurface curve in a del-Pezzo 3 surface, we consider the pullback of a line bundle from the dP3. This package approximates the allowed global section values for this line bundle on the moduli space of all deformations of this curve. This approximation systematically underestimates the number of sections. However, it provides this estimate over the entire moduli space. Furthermore, as this estimate is based mostly on topological data, we could easily implement the necessary algorithms in C++, so that they terminate rather quickly. This implementation is the result [*Machine Learning and Algebraic Approaches towards Complete Matter Spectra in 4d F-theory*](https://link.springer.com/article/10.1007%2FJHEP01%282021%29196).

* [*QSMExplorer*](https://github.com/homalg-project/ToricVarieties_project/tree/master/QSMExplorer)

The largest currently known class of F-theory Standard Models without *chiral* exotics and gauge coupling unifications was described in [Quadrillion F-theory Standard Models](https://arxiv.org/abs/1903.00009). For short, we term these solutions *QSM*s. All of these geometries are given in terms of toric 3-folds. We have investigated these geometries in much detail in

* Martin Bies, Mirjam Cvetič, Ron Donagi, Muyang Liu, Marielle Ong [Root Bundles and Towards Exact Matter Spectra of F-theory MSSMs](https://link.springer.com/article/10.1007%2FJHEP09%282021%29076)
* Martin Bies, Mirjam Cvetič, Muyang Liu [Statistics of Root Bundles Relevant for Exact Matter Spectra of F-theory MSSMs](https://journals.aps.org/prd/abstract/10.1103/PhysRevD.104.L061903)

The *QSMExplorer* -- implemented together with [Muyang Liu](https://katalog.uu.se/empinfo/?id=N21-1557) -- reflects these attempts to understand these solutions. It allows to directly list the defining toric data and Hodge numbers for these computations. In addition, as we describe in the above works, we study certain canonical nodal curves, to learn more about these F-theory solutions. The data of these nodal curves and, most importantly, algorithm to count so-called limit root bundles (as introduced in [*Moduli of roots of line bundles on curves*](https://arxiv.org/abs/math/0404078)) are available via this package. Extensions of the above works are currently my most active research focus. Therefore, in particular the package *QSMExplorer* is subject to major changes.


#### Visualisation of dependencies

A visualisation of the *ToricVarieties_project* can be found [here](/SoftwarePackages.pdf).



### Documentation (last update 01/01/2022)

* [AdditionsForToricVarieties](/AdditionsForToricVarieties.pdf),
* [cohomCalgInterface](/cohomCalgInterface.pdf),
* [H0Approximator](/H0Approximator.pdf),
* [QSMExplorer](/QSMExplorer.pdf),
* [SheafCohomologiesOnToricVarieties](/SheafCohomologiesOnToricVarieties.pdf),
* [SpasmInterface](/SpasmInterface.pdf),
* [ToolsForFPGradedModules](/ToolsForFPGradedModules.pdf),
* [TopcomInterface](/TopcomInterface.pdf),
* [ToricVarieties](/ToricVarieties.pdf),
* [TruncationsForFPGradedModules](/TruncationsForFPGradedModules.pdf).

For the latest package documentation, visit [github](https://github.com/homalg-project/ToricVarieties_project).



### Installation

I provide an installation script [here](/Install.sh). It has been tested on *Debian9* and *Ubuntu18.04* (last updated on January 2, 2022). Once complete, navigate into *gap4.11.1/local/pkg/ToricVarieties_project*:

* Build documentation: *make doc*.
* Execute tests: *make test* ([latest daily tests on github](https://github.com/homalg-project/ToricVarieties_project/actions/workflows/test.yml)).


## Freyd Categories (as part of the [CAP_project](https://github.com/homalg-project/CAP_project))

The first implementations of a *PresentationCategory* category in the language of the [*CAP_project*](https://homalg-project.github.io/CAP_project/) were available via

* [*CAPCategoryOfProjectiveGradedModules*](https://github.com/HereAround/CAPCategoryOfProjectiveGradedModules) -- [documentation](/CAPCategoryOfProjectiveGradedModules.pdf)
* [*CAPPresentationCategory*](https://github.com/HereAround/CAPPresentationCategory) -- [documentation](/CAPPresentationCategory.pdf)
* [*PresentationsByProjectiveGradedModules*](https://github.com/HereAround/PresentationsByProjectiveGradedModules) -- [documentation](/PresentationsByProjectiveGradedModules.pdf)

These packages are by now deprecated because the concept has been much better understood in [*A constructive approach to Freyd categories*](https://arxiv.org/abs/1712.03492) and [*Tensor products of finitely presented functors*](https://www.worldscientific.com/doi/abs/10.1142/S0219498822501869). Together with [*Sebastian Posur*](https://sebastianpos.github.io/), I have remodelled these packages in the package [*FreydCategoriesForCAP*](https://github.com/homalg-project/CAP_project/tree/master/FreydCategoriesForCAP).




## OSCAR Computer algebra

Currently, the [ToricVarieties_project](https://github.com/homalg-project/ToricVarieties_project) is being integrated into the [OSCAR Computer Algebra System](https://github.com/oscar-system/Oscar.jl), which uses the modern programming language [Julia](https://julialang.org/). The documentation of the [OSCAR Computer Algebra System](https://github.com/oscar-system/Oscar.jl) is available [here](https://oscar-system.github.io/Oscar.jl/dev/). Details on the *toric varieties* functionality can be found [here](https://oscar-system.github.io/Oscar.jl/dev/ToricVarieties/NormalToricVarieties/).
