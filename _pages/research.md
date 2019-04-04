---
layout: single
title: "Research"
permalink: /research/
---


### Physics

By upbringing, I am a physicist interested in theoretical high energy physics -- in particular string theory. Currently, my focus rests on F-theory, which utilizes geometry to investigate the properties of solutions to string theory.


### Mathematics

In studying F-theory, I have more and more developed an interest in the underlying mathematics. I am fairly interested in studying the role of Chow groups to F-theory (e.g. in anomaly cancellations). 

In taking string theory seriously, one may also wonder if there is a solution to string theory (or F-theory), which exactly resembles the features of our universe. Zero modes can be used to distinguish plausible solutions from solutions, whose features are clearly distinct from the ones of our universe.

Within the frameworks of F-theory, type IIB string theory, the topological B-model and heterotic string theory, zero modes can be counted by sheaf cohomologies of coherent sheaves. For this reason, it is interesting to study these cohomologies groups and means to compute them. Given the vast number of string theory solutions, a computer implementation for these computations comes handy. Consequently, we are lead to...


### Software

Toric geometry is easily accessible to computers. As shown in [*Gabriel morphisms and the computability of Serre quotients with applications to coherent sheaves*](https://arxiv.org/abs/1409.2028), one can then utilise the category of finitely-presented graded S-modules (S being the Cox ring of the toric variety of interest) to model coherent sheaves in the computer. Therefore, I have collaborated on both the 
[*homalg_project*](http://homalg-project.github.io/) and the [*CAP_project*](https://homalg-project.github.io/CAP_project/) and have written the following four packages, which can be used to model the category of finitely-presented graded S-modules in the computer:

* package 1
* package 2
* package 3
* package 4

These packages are based on the package

* Toric Varieties

which I have also extended since. All of these are then used in 

* SheafCohomologies

The latter includes implementations on computing sheaf cohomologies. In particular, the algorithm described in my PhD thesis is implemented in this package.

By know, the concept of 'presentations' has been studied in a more general context in 'Sepps Freyd categories'. Along these lines, I am currently implementing the above categories into the package

* FreydCategoriesForCAP

Also, the SheafCohomologies package is undergoing further developement. For example, I am writing the packages

* cohomCalgInterface
* topcomInterface

to establish well-furnished interfaces to cohomCalg and topcom. 

The cohomCalgInterface will soon be extended by a KoszulExtensionPackage. The latter will resemble the existing MathematicaScript-extension of cohomCalg. The aim is to make these algorithms available directly inside gap/CAP.

The topcomInterface is used for triangulations of toric varieties (corresponding to phases of QFTs - see Witten paper on GLSM). The latter is currently implemented in the package

* BlowupsAndTriangulationsOfToricVarieties

The latter also makes blowup computations available within gap/CAP.

All of these furnish extensions of the above mentioned ToricVarieties package, and will ultimately all be used in an updated version of my SheafCohomologies package.

Here is a image which describes the current dependencies among the above mentioned packages.

...

Also, find here the current (add date of date) documentations of all these packages.
