#!/bin/bash

# Set the size of the chessboard (8x8 in this case)
board_size=8

# Generate and display the chessboard
for ((row = 1; row <= board_size; row++)); do
    for ((col = 1; col <= board_size; col++)); do
        if ((row % 2 == col % 2)); then
            echo -n "  "  # White square
        else
            echo -n "##"  # Black square
        fi
    done
    echo
done
