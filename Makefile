.PHONY: build clean run

MODULE ?= helloworld
SRC_DIR := src
BUILD_DIR := build
SIM_EXE := $(BUILD_DIR)/$(MODULE)/V$(MODULE)

$(SIM_EXE): $(SRC_DIR)/$(MODULE).v
	mkdir -p $(BUILD_DIR)/$(MODULE)
	verilator --binary -j 0 -Wall -Isrc -cc helloworld -Mdir build/helloworld

build: $(SIM_EXE)

run: $(SIM_EXE)
	./$<

clean:
	rm -rf $(BUILD_DIR)/$(MODULE)
