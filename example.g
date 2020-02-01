LoadPackage( "SheafCohomologyOnToricVarieties" );

F1 := Fan( [[1],[-1]],[[1],[2]] );
# <A fan in |R^1>
P1 := ToricVariety( F1 );
# <A toric variety of dimension 1>
P1xP1 := P1 * P1;
# <A toric variety of dimension 2 which is a product of 2 toric varieties>
irP1xP1 := IrrelevantLeftIdealForCAP( P1xP1 );
# <An object in Category of f.p. graded left
# modules over Q[x_1,x_2,x_3,x_4] (with weights
# [ [ 0, 1 ], [ 1, 0 ], [ 1, 0 ], [ 0, 1 ] ])>
H0Parallel( P1xP1, irP1xP1, true, true );
# Computes the cohomologies by use of Singular, i.e. exactly over the rational numbers
H0ParallelBySpasm( P1xP1, irP1xP1, 100 );
# Computes the same cohomologies with Spasm and modulo the smallest prime number larger than 100, i.e. 103
H0ParallelBySpasm( P1xP1, irP1xP1 );
# The same as the above, but by default computes it modulo 42013.
