EXE = gppKernel-nb.ex
SRC = gppKernel-nb.f90
#EXE = gppKernel.ex
#SRC = gppKernel.f90

CXX = ftn
LINK = ${CXX}

#CXXFLAGS = -O3 -qopt-report=5 -g -qopenmp 
CXXFLAGS = -O3 -g -qopenmp 
#CXXFLAGS+=-xCORE-AVX2 
CXXFLAGS+=-xMIC-AVX512 
LINKFLAGS = -dynamic -O3 -qopenmp

OBJ = $(SRC:.f90=.o)

$(EXE): $(OBJ) 
	$(CXX) $(OBJ) -o $(EXE) $(LINKFLAGS)

$(OBJ): $(SRC) 
	$(CXX) -c $(SRC) $(CXXFLAGS)

clean: 
	rm -f $(OBJ) $(EXE)
