echo ""
echo "------------------------------------------------------------------------"
echo "Welcome!"
echo "This is an automated script to install SheafCohomologiesOnToricVarieties"
echo "https://github.com/homalg-project/SheafCohomologyOnToricVarieties"
echo "(*) Tested for Debian 9 and Ubuntu 18.04 (16/03/2020)"
echo "(*) No warrenty for other operating systems"
echo "(*) Superuser rights required"
echo "------------------------------------------------------------------------"
echo ""


echo "------------------------------------------------------------------------"
echo "Step1: Install dependencies shipped with Ubuntu/Debian"
echo "------------------------------------------------------------------------"
echo ""
echo "(*) htop"
echo "(*) autoconf"
echo "(*) build-essential"
echo "(*) libgmp-dev"
echo "(*) libtool"
echo "(*) git"
echo "(*) libatlas-base-dev"
echo "(*) libatlas-dev"
echo "(*) liblapack-dev"
echo "(*) screen"
echo "(*) libcdd-dev"
echo "(*) 4ti2"
echo "(*) singular"
echo ""

sudo apt-get install htop autoconf build-essential libgmp-dev libtool git libatlas-base-dev libblas-dev liblapack-dev screen libcdd-dev 4ti2 singular

echo ""
echo ""
echo "------------------------------------------------------------------------"
echo "Step2: Install gap"
echo "------------------------------------------------------------------------"
echo ""

echo "(*) Download gap 4.11.0"
echo ""
curl -O https://www.gap-system.org/pub/gap/gap-4.11/tar.gz/gap-4.11.0.tar.gz
tar xf gap-4.11.0.tar.gz

echo ""
echo "(*) Configure and install gap"
echo ""
cd gap-4.11.0
./configure --with-gmp=system
make -j4

echo ""
echo "(*) Test installation of gap"
echo ""
touch tester.gi
echo 'Read( Filename( DirectoriesLibrary( "tst" ), "testinstall.g" ) );' >> tester.gi
./gap tester.gi
rm tester.gi

echo ""
echo "(*) Configure packages shipped with gap"
echo ""
cd bin/
./BuildPackages.sh
cd ..

echo ""
echo "(*) Install IO-package"
echo ""
cd pkg/io*
./configure
make -j4
cd ../..

echo ""
echo "(*) Prepare folder /local/pkg to store latest version of SheafCohomologies"
mkdir local
cd local/
mkdir pkg
cd ..

echo "(*) Add this folder to search path of gap"
cd bin/
sed -i '$ d' gap.sh
echo 'exec "$GAP_EXE/gap" -l "$GAP_DIR/local;$GAP_DIR" "$@"' >> gap.sh
cd ..

echo "(*) Make gap executable by just typing 'gap' into the terminal"
sudo cp bin/gap.sh /usr/bin/gap

echo ""
echo ""
echo "------------------------------------------------------------------------"
echo "Step3: Download gap packages from github"
echo "------------------------------------------------------------------------"
echo ""

cd local/pkg/

echo "(*) Clone AutoDoc"

git clone https://github.com/homalg-project/AutoDoc.git
cd AutoDoc
git reset --hard 7e97a446f7f2fb80da4b61d405bbeb5097f8299a
cd ..

echo""
echo "(*) Clone CAP_project"

git clone https://github.com/homalg-project/CAP_project.git
cd CAP_project
git reset --hard ef59e655106c5e1c55ce089d20994949d8a128b7
cd ..

echo ""
echo "(*) Clone CddInterface"

git clone https://github.com/homalg-project/CddInterface.git
cd CddInterface
git reset --hard bb26d2ddc904e1b7d2f09b6b77abd9e3add4ca21
cd ..

echo ""
echo "(*) Clone ComplexesForCAP"
git clone https://github.com/homalg-project/ComplexesForCAP.git
cd ComplexesForCAP
git reset --hard ae81be83b7d447325e2d4db8d7687429b64e9c59
cd ..

echo ""
echo "(*) Clone homalg_project"

git clone https://github.com/homalg-project/homalg_project.git
cd homalg_project
git reset --hard fa276d813e1538ae7a1f4e4a6f77eba09b0e5ba1
cd ..

echo ""
echo "(*) Clone LessGenerators"

git clone https://github.com/homalg-project/LessGenerators.git
cd LessGenerators
git reset --hard b91e90a947e78c795b82169fca80d6fd196fbcc9
cd ..

echo ""
echo "(*) Clone NConvex"

git clone https://github.com/homalg-project/NConvex.git
cd NConvex
git reset --hard dea0ffc7f8953bfda48c0e431e9d0d2bf023402b
cd ..

echo ""
echo "(*) Clone PrimaryDecomposition"

git clone https://github.com/homalg-project/PrimaryDecomposition.git
cd PrimaryDecomposition
git reset --hard ad6f85fd11af4143fca4ea1c74245f9e1b9e8895
cd ..

echo ""
echo "(*) Clone QPA2"

git clone https://github.com/homalg-project/QPA2.git
cd QPA2
git reset --hard dba4bb100afeedb851be5ae87f5208d15ef245c6
cd ..

echo ""
echo "(*) Clone SingularForHomalg"

git clone https://github.com/homalg-project/SingularForHomalg.git
cd SingularForHomalg
git reset --hard e034ca41ad7b0f1a48a6134ccfd45ddd9a44a11f
cd ..

echo ""
echo "(*) Clone TriangulatedCategoriesForCAP"

git clone https://github.com/homalg-project/TriangulatedCategoriesForCAP.git
cd TriangulatedCategoriesForCAP
git reset --hard 7d26b61be3d0f474c115aa9811b8058215726cba
cd ..

echo ""
echo "(*) Clone NormalizInterface"

git clone https://github.com/gap-packages/NormalizInterface.git
cd NormalizInterface
git reset --hard f02a1a7803481b349c754379ab3ca64563875e65 
cd ..

echo ""
echo "(*) Clone ToricVarieties_project"

git clone https://github.com/homalg-project/ToricVarieties_project
cd ToricVarieties_project
git reset --hard 7c7658ae69d340985209e5f1777ff713b4c60b51
cd ..

echo "(*) Cloning complete"


echo ""
echo ""
echo "------------------------------------------------------------------------"
echo "Step4: Install gap packages"
echo "------------------------------------------------------------------------"
echo ""

echo "(*) Install Gauss"
echo ""
cd homalg_project/Gauss/
./configure ../../../../
make -j4
cd ../..

echo ""
echo "(*) Install CddInterface"
echo ""
cd CddInterface/
./install.sh ../../..
cd ..

echo ""
echo "(*) Install NormalizInterface"
echo ""
cd NormalizInterface/
./build-normaliz.sh ../../..
./autogen.sh ../../..
./configure --with-gaproot=../../..
make -j4
cd


echo ""
echo ""
echo "------------------------------------------------------------------------"
echo "Step5: Install Spasm and configure SpasmInterface"
echo "------------------------------------------------------------------------"
echo ""

echo "(*) Download development version of Spasm"
echo ""
git clone https://github.com/HereAround/spasm.git
cd spasm
git checkout -b martin_devel
git pull origin martin_devel

echo ""
echo "(*) Install Spasm"
echo ""
aclocal
autoconf
autoreconf --install
./configure
make -j4

echo ""
echo "(*) Configure SpasmInterface"
echo ""
cd bench/
touch set.gi
echo 'LoadPackage( "SpasmInterface" );' >> set.gi
echo 'path := DirectoriesSystemPrograms();;' >> set.gi
echo 'pwd := Filename( path, "pwd" );;' >> set.gi
echo 'stdin := InputTextUser();;' >> set.gi
echo 'str := "";;' >> set.gi
echo 'stdout := OutputTextString(str,true);;' >> set.gi
echo 'String ( Process( DirectoryCurrent(), pwd, stdin, stdout, [] ) );;' >> set.gi
echo 'SetSpasmDirectory( str );' >> set.gi
echo 'QUIT;;' >> set.gi
gap set.gi
rm set.gi
cd ../..


echo ""
echo ""
echo "------------------------------------------------------------------------"
echo "Step6: Test installation"
echo "------------------------------------------------------------------------"
echo ""

echo "Test ToricVarieties_project"
cd gap-4.11.0/local/pkg/ToricVarieties_project/SheafCohomologyOnToricVarieties/
gap makedoc.g
gap maketest.g

