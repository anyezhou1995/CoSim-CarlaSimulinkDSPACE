#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <python_script> <num_times>"
    exit 1
fi

# Assign input arguments to variables
PYTHON_SCRIPT=$1
TRAFFIC_ADJ=$2

# Check if the provided Python script exists
if [ ! -f "$PYTHON_SCRIPT" ]; then
    echo "Error: Python script '$PYTHON_SCRIPT' not found!"
    exit 1
fi

# Run the Python script the specified number of times
for (( i=1; i<=TRAFFIC_ADJ; i++ ))
do
    echo "Running $PYTHON_SCRIPT (Iteration $i)"
    python -W ignore::UserWarning "$PYTHON_SCRIPT" --traffic-adjust $i
done

echo "Finished running $PYTHON_SCRIPT $TRAFFIC_ADJ times."