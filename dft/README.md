# 8-Bit Comparator with Scan DFT — RTL to GDSII

## Project Overview

This project extends an 8-bit unsigned digital comparator by adding a 19-bit scan-chain architecture for Design for Testability (DFT).

The design was implemented using Verilog HDL and an open-source RTL-to-GDSII flow targeting the ASAP7 predictive 7 nm technology platform.

## Design Architecture

The comparator performs three unsigned comparisons:

- `GT = (A > B)`
- `EQ = (A == B)`
- `LT = (A < B)`

The scan-enabled wrapper includes:

- 16 input registers for operands A and B
- 3 output registers for GT, EQ, and LT
- 19-bit serial scan chain
- Scan enable (`scan_en`)
- Serial scan input (`scan_in`)
- Serial scan output (`scan_out`)
- Clock (`clk`) and active-low reset (`rst_n`)

In scan mode, the registers shift test data serially. In functional mode, the comparator evaluates the registered operands and captures the comparison result.

## Tools and Technology

| Tool | Purpose |
|---|---|
| Verilog HDL | RTL design |
| Icarus Verilog | Functional and scan simulation |
| GTKWave | Waveform analysis |
| Yosys | Logic synthesis |
| OpenROAD | Physical design |
| KLayout | GDSII visualization |
| ASAP7 | Predictive 7 nm standard-cell platform |

## Verification

The scan testbench exercises serial scan loading, functional capture, and scan unloading.

The RTL simulation includes 27 directed and randomized test cases.

Synthesis confirms that all 19 scan-chain registers were mapped to ASAP7 flip-flop cells.

## Physical Design Flow

1. RTL design and simulation
2. Logic synthesis
3. Floorplanning
4. Power distribution network generation
5. Standard-cell placement
6. Clock Tree Synthesis (CTS)
7. Global routing
8. Detailed routing
9. Final timing analysis
10. GDSII generation

## Implementation Results

| Metric | Result |
|---|---:|
| Technology | ASAP7 predictive 7 nm |
| Synthesized standard-cell instances | 99 |
| Scan-chain flip-flops | 19 |
| Synthesized cell area | 14.303 µm² |
| Clock period | 1000 ps |
| Reported critical-path slack | +707.70 ps |
| Total negative slack | 0 |
| Setup violations | 0 |
| Hold violations | 0 |
| Final detailed-routing violations | 0 |
| Antenna violations | 0 |
| Estimated post-route power | 65.8 µW |
| Final GDSII size | 349 KB |

The power result is an EDA estimate, not a silicon measurement.

## Original vs. Scan-Enabled Design

| Metric | Original | Scan-enabled |
|---|---:|---:|
| Scan registers | 0 | 19 |
| Reported cell area | 5.847 µm² | 14.303 µm² |
| Reported standard cells | 79 | 99 |
| Estimated power | 6.75 µW | 65.8 µW |

The scan-enabled implementation introduces sequential registers and clock distribution. Therefore, the differences should not be interpreted as isolated industrial scan-insertion overhead.

## Limitations

This is an educational RTL-based scan-chain implementation. It does not include automated scan insertion, ATPG fault-coverage measurement, or manufacturing signoff verification.

The ASAP7 platform is a predictive technology platform used for research and education.

## Project Deliverables

- Original and scan-enabled Verilog RTL
- Scan verification testbench
- OpenROAD design configuration
- Synthesis and timing reports
- Final routed GDSII layout
