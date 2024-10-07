# =================
# VARIABLES SECTION
# =================

CC       = gcc       			 			     # compiler
CFLAGS   = -Wall -Werror -Wextra -g -std=c99 	 # compilation flags

SRCS   	 = main.c calculations.c				 # source code
OBJS     = main.o calculations.o				 # object files (compiled source code)
TARGETS  = main.exe							 	 # final executable to produce





# ===============
# TARGETS SECTION
# Note: general idea is to specify intermediate requirements to get to end goal. 
#
#
# Ex: I need file A. File A -> File B. File B -> File C, File D. 
# File C changed since last time. So recreate file B from C and D. 
# Then, recreate file A from B.
# ===============


# Meaning: update main (executable) when main.o calculations.o (object files) change
# $@ is the target (in this case: main)
# $^ are ALL the dependencies (in this case: pnginfo.o)
main.exe: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^


# Meaning: update any object file when its source code changes
# % is a wildcard for any string
# $< is the first dependency
%.o: %.c 
	$(CC) $(CFLAGS) -c $<




# Syntax: target: dependencies
# Meaning: when we run `make all`, get up to date `main` (dependency)
all: $(TARGETS)

# Meaning: clean up all object files and executables
clean:
	rm -f $(OBJS) $(TARGETS)

# Meaning: don't look for files named clean and all. I'm treating them as commands
.PHONY: all clean