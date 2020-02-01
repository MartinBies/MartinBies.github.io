# This script clones the homalg project from github
# This script clones the homalg project from github

# step1: Create lists of all software packages that are to be downloaded

echo "----------------------------"
echo "Initialise cloneing lists   "
echo "----------------------------"
echo ""

list=("
AbelianSystems
alcove
alexander
AlgebraicThomas
ArangoDBInterface
AutoDoc
BBGG
Bialgebroids
Bicomplexes
Blocks
CategoriesWithAmbientObjects
CAP_project
CddInterface
CombinatoricsForHomalg
ComplexesForCAP
Conley
D-Modules
FiniteTopologies
FinGSetsForCAP
FinSetsForCAP
FrobeniusCategoriesForCAP
FunctorCategories
homalg_starter
homalg_project
IntrinsicCategories
k-Points
LessGenerators
LetterPlace
Locales
M2
MapleForHomalg
ModelCategories
NConvex
Orbifolds
PrimaryDecomposition
QPA2
SCSCP_ForHomalg
SimplicialObjects
SingularForHomalg
StableCategoriesForCAP
SystemTheory
test_suite
Toposes
TriangulatedCategoriesForCAP
VirtualCAS
ZariskiFrames
CAPCategoryOfProjectiveGradedModules
CAPPresentationCategory
PresentationsByProjectiveGradedModules
TruncationsOfPresentationsByProjectiveGradedModules
SheafCohomologyOnToricVarieties
")

list2=("
NormalizInterface
")


# Step2: Clone homalg_packages
echo "----------------------------"
echo "Cloning homalg-packages"
echo "----------------------------"
echo ""
for p in $list
do
  git clone https://github.com/homalg-project/$p.git
  echo ""
done


# Step3: Clone gap packages
echo "----------------------------"
echo "Cloning other gap-packages"
echo "----------------------------"
echo ""
for p in $list2
do
  git clone https://github.com/gap-packages/$p.git
  echo ""
done


# Step4: Signal success
echo ""
echo "Cloning complete"
