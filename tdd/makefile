# Magic Variables
#out.o: src.c src.h
#  $@   # "out.o" (target)
#  $<   # "src.c" (first prerequisite)
#  $^   # "src.c src.h" (all prerequisites)
#
#%.o: %.c
#  $*   # the 'stem' with which an implicit rule matches ("foo" in "foo.c")
#
#also:
#  $+   # prerequisites (all, with duplication)
#  $?   # prerequisites (new ones)
#  $|   # prerequisites (order-only?)
#
#  $(@D) # target directory
  
TARGET= tdd
CXX= g++
#libraries
LDIR= -Lusr/lib/x86_64-linux-gnu
LIBS= -lCppUTest -lCppUTestExt
#define the inclusion diirectory
IDIR= .\
tests
CPPUTEST_IDIR= usr/include\

###############################
CFLAGS= $(addprefix -I,$(IDIR))
CPPUTEST_CFLAGS = -I$(CPPUTEST_IDIR)
#define the header fils
_DEPS= 
_CPPUTEST_DEPS=\
CommandLineTestRunner.h\
TestHarness.h\
template_tester.h
###############################
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))
CPPUTEST_DEPS= $(patsubst %,$(CPPUTEST_IDIR)/%,$(_CPPUTEST_DEPS))

# Find all the source files in the above locations
SRC = $(shell find -name '*.cpp' -or -name '*.c')
# Define the cpp files as objects
_OBJ = $(SRC:.cpp=.o)

# Define the objects
BDIR= build
ODIR= $(BDIR)/obj
OBJ= $(patsubst %,$(ODIR)/%,$(_OBJ))

# Define a rule for all object files
# The object files depends on the .c and .h files versions
# To generate the oblect files, make needs the .c files using the compiler defined in the CC macro.
# The -c flag says to generate the object fille, the -o $@ says to put the output of the compilation in the file named on the left of the :
# The $< is the first item in the dependencies list, and the CFLAGS macro is defined above.
$(ODIR)/%.o: %.cpp $(DEPS)
	@mkdir -p $(dir $@)
	$(CXX) -c -o $@ $< $(CFLAGS) $(CPPUTEST_CFLAGS) $(LDIR) $(LIBS)

$(BDIR)/$(TARGET): $(OBJ)
	$(CXX) -o $@ $^ $(CFLAGS) $(CPPUTEST_CFLAGS) $(LDIR) $(LIBS)

.PHONY:  clean

all: $(TARGET) 

clean:
	find . -name '*.o' -delete
	rm -f $(BDIR)/$(TARGET)