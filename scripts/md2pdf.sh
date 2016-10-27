#!/bin/bash

input_file="$1"
output_file="${input_file/.md/.pdf}"

pandoc --smart --standalone --number-sections "$input_file"  -o "$output_file" --template=/home/bart/Documents/pandoc_template.tex
