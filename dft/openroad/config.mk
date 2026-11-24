export DESIGN_NAME = comparator_8bit_scan
export PLATFORM = asap7

export VERILOG_FILES = $(DESIGN_HOME)/src/comparator_8bit_dft/comparator_8bit.v \
                       $(DESIGN_HOME)/src/comparator_8bit_dft/comparator_8bit_scan.v

export SDC_FILE = $(DESIGN_HOME)/asap7/comparator_8bit_dft/constraint.sdc

export CORE_UTILIZATION = 30
export PLACE_DENSITY = 0.40
