---
layout: single
title: "Research"
permalink: /research/
---

{% include toc %}

## Physics, Mathematics and Software

By upbringing, I am a theoretical high energy physicist with a focus on string theory. In the past years, I have been working on a framework of string theory, called F-theory. It strongly utilizes geometric tools to investigate solutions to string theory.

Of ample importance for string phenomenology is the number of Higgs fields in a particular compactifications. This is because the existence or absence of these fields determines if a Higgs mechanism can be employed to give masses to the other massless fields. As simple as this question may sound, it leads to rich mathematics such as Freyd categories, Chow groups, coherent sheaves, root bundles and Brill-Noether theory.

In type IIB string theory, the topological B-model and heterotic string theory, the number of Higgs field and of exotic (as in they have never been observed in experiments) vector-like particles are counted by cohomologies of coherent sheaves. Homological mirror symmetry gives even more significance to coherent sheaves, as it expresses a categorical equivalence between the category of coherent sheaves (on a certain Calabi-Yau manifold) and the Fukaya category (on the dual Calabi-Yau manifold). Similarly, also in F-theory, Higgs fields (and vector-like exotics) are counted by cohomologies of coherent sheaves ([Chow groups, Deligne cohomology and massless matter in F-theory](https://arxiv.org/abs/1402.5144), [Gauge Backgrounds and Zero-Mode Counting in F-theory](https://link.springer.com/article/10.1007%2FJHEP11%282017%29081), [Cohomologies of coherent sheaves and massless spectra in F-theory](https://archiv.ub.uni-heidelberg.de/volltextserver/24045/)).

Consequently, in a very harsh first order approximation, by counting sheaf cohomologies one can tell apart good and bad string theory solutions. To facilitate such computations for a large number of geometries, I have developped software packages ranging from toric geometry to category theory. This [ToricVarieties_project](https://github.com/homalg-project/ToricVarieties_project) is part of the [homalg_project](https://github.com/homalg-project) of [Mohamed Barakat](https://github.com/mohamed-barakat). Currently, its functionality is being integrated into/migrated to the [OSCAR Computer Algebra System](https://oscar.computeralgebra.de/). More details can be found on [the OSCAR github page](https://github.com/oscar-system/Oscar.jl) and [here](https://martinbies.github.io/software/).

Generally speaking, a brute-force computation of the relevant sheaf cohomologies for (almost) realistic F-theory compactifications is not practical (at least not with the current technology). In part, this is because the spectrum of the corresponding F-theory compactification strongly depends on the geometry of the compactifiaction space. This complex structure dependence has been recently analyzed in:

* Martin Bies, Mirjam Cvetič, Ron Donagi, Ling Lin, Muyang Liu, Fabian Rühle [*Machine Learning and Algebraic Approaches towards Complete Matter Spectra in 4d F-theory*](https://link.springer.com/article/10.1007%2FJHEP01%282021%29196)

In an attempt to apply these insights to the [Quadrillion F-theory Standard Models](https://arxiv.org/abs/1903.00009) -- the largest currently known class of F-theory Standard Models without *chiral* exotics and gauge coupling unifications -- we noticed that the zero modes localized on a matter curve are counted by the cohomologies of rather special line bundle on this very matter, namely a root bundle:

* Martin Bies, Mirjam Cvetič, Ron Donagi, Muyang Liu, Marielle Ong [Root Bundles and Towards Exact Matter Spectra of F-theory MSSMs](https://link.springer.com/article/10.1007%2FJHEP09%282021%29076)

By deforming the smooth, irreducible matter curve into a nodal curve, we could argue for the absence of vector-like exotics. We have taken this one step further:

* Martin Bies, Mirjam Cvetič, Muyang Liu [Statistics of Root Bundles Relevant for Exact Matter Spectra of F-theory MSSMs](https://journals.aps.org/prd/abstract/10.1103/PhysRevD.104.L061903)

In this work, we have systematically counted root bundles to gauge how likely it is that these compactification geometries lead to the absence of exotic vector-like pairs. To establish the existence of the Higgs field in the Quadrillion F-theory Standard Models, I am currently investigating equi-dimensional deformations from smooth, irreducible curves to nodal curves. 
