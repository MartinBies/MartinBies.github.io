ho ""
echo "------------------------------------------------------------------------"
echo "Welcome!"
echo "This is an automated script to install SheafCohomologiesOnToricVarieties"
echo "https://github.com/homalg-project/SheafCohomologyOnToricVarieties"
echo "(*) Tested for Debian 9 and Ubuntu 18.04 (01/01/2022)"
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

# For NormalizInterface, we have to configure gap with the gmp installed on the system. Here, I try this by installing limgmp-dev above and then configuring gap via:
# ./configure --with-gmp=system
# This option "system" is by now deprecated, but still seems functional. Should this not be the case, please try a local installation of gmp and then link gap to it. This
# should look roughly as follows:

#wget https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz
#tar xvf gmp-6.1.2.tar.xz
#cd gmp-6.1.2
#./configure --prefix=/usr/local/gmp/6_1_2
#make
#make check
#sudo make install
# Now navigate into your gap folder (below this is the folder gap-4-11.1) and execute:
#./configure --with-gmp=/usr/local/gmp/6_1_2


echo ""
echo ""
echo "------------------------------------------------------------------------"
echo "Step2: Install gap"
echo "------------------------------------------------------------------------"
echo ""

echo "(*) Download gap 4.11.1"
echo ""
curl -O -L https://github.com/gap-system/gap/releases/download/v4.11.1/gap-4.11.1.tar.gz
tar xf gap-4.11.1.tar.gz

echo ""
echo "(*) Configure and install gap"
echo ""
cd gap-4.11.1
./configure --with-gmp=system
make -j$(nproc)

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
make -j$(nproc)
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
echo ""
echo "(*) Clone CAP_project"
git clone https://github.com/homalg-project/CAP_project.git
echo ""
echo "(*) Clone CddInterface"
git clone https://github.com/homalg-project/CddInterface.git
echo ""
echo "(*) Clone ComplexesForCAP"
git clone https://github.com/homalg-project/ComplexesForCAP.git
echo ""
echo "(*) Clone homalg_project"
git clone https://github.com/homalg-project/homalg_project.git
echo ""
echo "(*) Clone LessGenerators"
git clone https://github.com/homalg-project/LessGenerators.git
echo ""
echo "(*) Clone NConvex"
git clone https://github.com/homalg-project/NConvex.git
echo ""
echo "(*) Clone NormalizInterface"
git clone https://github.com/gap-packages/NormalizInterface.git
echo ""
echo "(*) Clone PrimaryDecomposition"
git clone https://github.com/homalg-project/PrimaryDecomposition.git
echo ""
echo "(*) Clone QPA2"
git clone https://github.com/sunnyquiver/QPA2.git
echo ""
echo "(*) Clone SingularForHomalg"
git clone https://github.com/homalg-project/SingularForHomalg.git
echo ""
echo "(*) Clone HigherHomologicalAlgebra"
git clone https://github.com/homalg-project/HigherHomologicalAlgebra.git
echo ""
echo "(*) Clone ToricVarieties_project"
git clone https://github.com/homalg-project/ToricVarieties_project
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
make -j$(nproc)
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
./autogen.sh
./configure --with-gaproot=../../..
make
cd ..

echo ""
echo "(*) Install ToricVarieties_project"
echo ""
cd ToricVarieties_project/
make install
