---
layout: single
title: "Research"
permalink: /research/
---


### Physics

By upbringing, I am a physicist interested in theoretical high energy physics -- in particular string theory. Currently, my focus rests on F-theory, which utilizes geometry to investigate the properties of solutions to string theory.


### Mathematics

In studying F-theory, I have more and more developed an interest in the underlying mathematics. I am fairly interested in studying the role of Chow groups to F-theory (e.g. in anomaly cancellations). 

In taking string theory seriously, one may wonder if there is a solution to string theory (or F-theory), which exactly resembles the features of our universe. Zero modes can be used to distinguish plausible solutions from solutions, whose features are clearly distinct from the ones of our universe. In turn, it can be argued that zero modes can be counted by the so-called sheaf cohomologies of coherent sheaves. This conclusion does not only hold true in F-theory, but also extends for example to type IIB, the topological B-string and heterotic string vacua. With this motivation, I have studied the computation of cohomology groups of coherent sheaves. Given the vast number of string solutions, one is lead to look for an automation of these computations, which consequently led to \dots


### Software

Here I focus on toric geometry, as this is accessible to computers. In collaboration with Mohamed Barakt on the homalg_project I have learned that the category of coherent sheaves can be modelled in the computer by the category of so-called finitely-presented graded modules.

Based on this, I have collaborated on the CAP_project (categories, algorithms and programming) and have implemented the following packages, to model coherent sheaves in the computer:

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
