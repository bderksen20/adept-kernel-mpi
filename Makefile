# Copyright (c) 2015 The University of Edinburgh.
# 
# This software was developed as part of the                       
# EC FP7 funded project Adept (Project ID: 610490)                 
#     www.adept-project.eu                                            
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Default to gcc but allong setting CC in the shell (or via cmd line) to another compiler
ifndef $CC
  CC = mpicc
endif

#set OPT=debug to compile with -g -O0
ifndef $OPT
  OPT = opt
endif

ifndef $ARCH
  ARCH=generic
endif

include platform_inc/${ARCH}_${CC}_${OPT}.inc

SOURCES = main.c level1.c blas_op.c utils.c stencil.c fileparse.c matrix_utils.c cg.c
LDFLAGS+= -lm
EXE = kernel

all: $(EXE)

$(EXE): $(SOURCES)
	$(CC) $(CFLAGS) -o $(EXE) $(SOURCES) $(DMACROS) $(LDFLAGS)

clean:
	rm -rf *~ *.o $(EXE)
