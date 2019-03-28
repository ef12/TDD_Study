
TARGET= libprod.a
CC= gcc
#define the inclusion diirectory
IDIR= .
#need to be O1 for INLINE functions to work
CFLAGS= -I$(IDIR) -Wall -O1
#define the header fils
_DEPS= \
hellomake.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

# Define the objects
BDIR= build
ODIR= $(BDIR)/obj
LDIR =.

_OBJ= \
hellofunc.o\
hellomake.o
OBJ= $(patsubst %,$(ODIR)/%,$(_OBJ))
# Define a rule for all object files
# The object files depends on the .c and .h files versions
# To generate the oblect files, make needs the .c files using the compiler defined in the CC macro.
# The -c flag says to generate the object fille, the -o $@ says to put the output of the compilation in the file named on the left of the :
# The $< is the first item in the dependencies list, and the CFLAGS macro is defined above.
$(ODIR)/%.o: %.c $(DEPS)
	@mkdir -p $(dir $@)
	$(CC) -c -o $@ $< $(CFLAGS) $(LIBS)

#let's link library files into a static library
$(BDIR)/$(TARGET): $(OBJ)
	ar rcs $@ $^ 

all: $(TARGET)
	
.PHONY:  clean

# Erase the obj directory with all object files
clean:
	rm -f $(ODIR)/*.o $(BDIR)/$(TARGET)