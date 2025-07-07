#!/bin/bash

# Step 1: Find testbench file (e.g., or_gate_tb.v)
TESTBENCH=$(ls *_tb.v 2>/dev/null | head -n 1)

if [ -z "$TESTBENCH" ]; then
    echo "❌ No testbench file found (expected *_tb.v)."
    exit 1
fi

# Step 2: Extract common base name (e.g., or_gate)
COMMON_NAME="${TESTBENCH%_tb.v}"

# Define file names
SRC_FILE="${COMMON_NAME}.v"
TB_FILE="${COMMON_NAME}_tb.v"
VVP_FILE="${COMMON_NAME}.vvp"
VCD_FILE="${COMMON_NAME}.vcd"

# Step 3: Check if source file exists
if [ ! -f "$SRC_FILE" ]; then
    echo "❌ Source file '$SRC_FILE' not found."
    exit 1
fi

# Step 4: Compile
echo "📦 Compiling: $SRC_FILE and $TB_FILE"
iverilog -o "$VVP_FILE" "$SRC_FILE" "$TB_FILE"

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed."
    exit 1
fi

# Step 5: Run simulation
echo "🚀 Running simulation..."
vvp "$VVP_FILE"

if [ -f "$VCD_FILE" ]; then
    echo "📈 Opening waveform: $VCD_FILE (script will wait for GTKWave to close)"
    gtkwave "$VCD_FILE"
    echo "✅ GTKWave closed. Exiting script."
else
    echo "⚠️ VCD file '$VCD_FILE' not found. Make sure your testbench includes \$dumpfile and \$dumpvars."
fi

exit 0