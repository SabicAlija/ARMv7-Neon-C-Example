T1				= HelloNeon-Vectorization
T1-1			= HelloNeon-Vectorization-OptOff
T1-2			= HelloNeon-Vectorization-OptOn

T2				= HelloNeon-Intrinsics
T2-1			= HelloNeon-Intrinsics-OptOff
T2-2			= HelloNeon-Intrinsics-OptOn

T3				= HelloNeon-Intrinsics-DataHandling
T3-1			= HelloNeon-Intrinsics-DataHandling-OptOff
T3-2			= HelloNeon-Intrinsics-DataHandling-OptOn

CC				= arm-linux-gnueabihf-gcc
CC_L0_FLAGS		= -std=c99 -mfpu=neon
CC_L1_FLAGS		= -std=c99 -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4 -ffast-math -ftree-vectorize

CC_NOPT			= -O0
CC_OPT			= -O3 -Ofast
CC_DB			= -Og -ggdb

DB				= arm-linux-gnueabihf-gdb
DB_ASM_FLAGS	= -batch -ex



ARMCC			= armcc
ELF				= fromelf

ACC_FLAGS		= --cpu=Cortex-A7 -O3 -Otime --vectorize --restrict




LD_FLAGS		=




all:

accu:
	$(CC) $(CC_NOPT) $(CC_L0_FLAGS) -o $(T1-1) $(T1).c
	$(CC) $(CC_NOPT) $(CC_L1_FLAGS) -o $(T1-2) $(T1).c
	
accu-opt:
	$(CC) $(CC_OPT) $(CC_L0_FLAGS) -o $(T1-1) $(T1).c
	$(CC) $(CC_OPT) $(CC_L1_FLAGS) -o $(T1-2) $(T1).c

casm-accu: accu
	$(DB) $(T1-1) $(DB_ASM_FLAGS) 'disas accumulate' > 1
	$(DB) $(T1-2) $(DB_ASM_FLAGS) 'disas accumulate' > 2
	
	wc -l 1
	wc -l 2

casm-accu-opt: accu-opt
	$(DB) $(T1-1) $(DB_ASM_FLAGS) 'disas accumulate' > 1
	$(DB) $(T1-2) $(DB_ASM_FLAGS) 'disas accumulate' > 2

	wc -l 1
	wc -l 2





accu2:
	$(CC) $(CC_NOPT) $(CC_L0_FLAGS) -o $(T1-1) $(T1).c
	$(CC) $(CC_NOPT) $(CC_L1_FLAGS) -o $(T1-2) $(T1).c
	
accu2-opt:
	$(CC) $(CC_OPT) $(CC_L0_FLAGS) -o $(T1-1) $(T1).c
	$(CC) $(CC_OPT) $(CC_L1_FLAGS) -o $(T1-2) $(T1).c

casm-accu2: accu2
	$(DB) $(T1-1) $(DB_ASM_FLAGS) 'disas accumulate2' > 1
	$(DB) $(T1-2) $(DB_ASM_FLAGS) 'disas accumulate2' > 2
	
	wc -l 1
	wc -l 2

casm-accu2-opt: accu2-opt
	$(DB) $(T1-1) $(DB_ASM_FLAGS) 'disas accumulate2' > 1
	$(DB) $(T1-2) $(DB_ASM_FLAGS) 'disas accumulate2' > 2

	wc -l 1
	wc -l 2









vadd:
	$(CC) $(CC_NOPT) $(CC_L0_FLAGS) -o $(T1-1) $(T1).c
	$(CC) $(CC_NOPT) $(CC_L1_FLAGS) -o $(T1-2) $(T1).c
	
vadd-opt:
	$(CC) $(CC_OPT) $(CC_L0_FLAGS) -o $(T1-1) $(T1).c
	$(CC) $(CC_OPT) $(CC_L1_FLAGS) -o $(T1-2) $(T1).c

casm-vadd: vadd
	$(DB) $(T1-1) $(DB_ASM_FLAGS) 'disas vector_add_of_n' > 1
	$(DB) $(T1-2) $(DB_ASM_FLAGS) 'disas vector_add_of_n' > 2
	
	wc -l 1
	wc -l 2

casm-vadd-opt: vadd-opt
	$(DB) $(T1-1) $(DB_ASM_FLAGS) 'disas vector_add_of_n' > 1
	$(DB) $(T1-2) $(DB_ASM_FLAGS) 'disas vector_add_of_n' > 2

	wc -l 1
	wc -l 2
	
arm-vec:
	$(ARMCC) $(ACC_FLAGS) $(T1).c
	$(ELF) -c $(T1).o
	$(ELF) -c $(T1).o > 3
	
	
	
	
	
idbl:
	$(CC) $(CC_OPT) $(CC_L0_FLAGS) -o $(T2-1) $(T2).c
	$(CC) $(CC_OPT) $(CC_L1_FLAGS) -o $(T2-2) $(T2).c
	

casm-idbl: idbl
	$(DB) $(T2-1) $(DB_ASM_FLAGS) 'disas double_elements' > 1
	$(DB) $(T2-2) $(DB_ASM_FLAGS) 'disas double_elements' > 2
	
	wc -l 1
	wc -l 2



arm-intr:
	$(ARMCC) $(ACC_FLAGS) $(T2).c
	$(ELF) -c $(T2).o
	$(ELF) -c $(T2).o > 3



	
	
	
	
imem:
	$(CC) $(CC_OPT) $(CC_L0_FLAGS) -o $(T3-1) $(T3).c
	$(CC) $(CC_OPT) $(CC_L1_FLAGS) -o $(T3-2) $(T3).c

casm-imem: imem
	$(DB) $(T3-1) $(DB_ASM_FLAGS) 'disas main' > 1
	$(DB) $(T3-2) $(DB_ASM_FLAGS) 'disas main' > 2
	
	wc -l 1
	wc -l 2

casm-imem-db:
	$(CC) $(CC_DB) $(CC_L1_FLAGS) -o $(T3) $(T3).c



arm-mem:
	$(ARMCC) $(ACC_FLAGS) $(T3).c
	$(ELF) -c $(T3).o
	$(ELF) -c $(T3).o > 3








clean: 
	rm -f $(T1-1) $(T1-2) $(T2-1) $(T2-2) $(T3) $(T3-1) $(T3-2) 1 2 3 *.o *.axf

.PHONY: all casm-accu casm-accu-opt casm-idbl
