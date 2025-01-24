SOURCE_DIR = ./src
BUILD_DIR = ./build
MOD_DIR = $(BUILD_DIR)/.mod
DATA_DIR = ./data

FC = gfortran
CFLAGS = -O3 -J$(MOD_DIR)

OBJS = \
$(BUILD_DIR)/param.o \
$(BUILD_DIR)/subprogram.o \
$(BUILD_DIR)/main.o

main.out : $(OBJS) $(DATA_DIR)
	$(FC) $(CFLAGS) -o main.out $(OBJS)

$(BUILD_DIR)/param.o : $(SOURCE_DIR)/param.f90 $(BUILD_DIR) $(MOD_DIR)
	$(FC) -c $(CFLAGS) -o $(BUILD_DIR)/param.o $(SOURCE_DIR)/param.f90

$(BUILD_DIR)/subprogram.o : $(SOURCE_DIR)/subprogram.f90 $(BUILD_DIR) $(MOD_DIR)
	$(FC) -c $(CFLAGS) -o $(BUILD_DIR)/subprogram.o $(SOURCE_DIR)/subprogram.f90

$(BUILD_DIR)/main.o : $(SOURCE_DIR)/main.f90 $(BUILD_DIR)
	$(FC) -c $(CFLAGS) -o $(BUILD_DIR)/main.o $(SOURCE_DIR)/main.f90

$(BUILD_DIR) : 
	mkdir $(BUILD_DIR)

$(MOD_DIR) :
	mkdir -p $(MOD_DIR)

$(DATA_DIR) :
	mkdir $(DATA_DIR)

.PHONY: clean
clean :
	rm -r *.out ./build
