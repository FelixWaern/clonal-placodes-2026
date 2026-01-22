#!/bin/bash

for sample in lens1 lens2 lens3 otic1 otic2 olfac1 olfac2
do
        trex_path=/home/felix/data/clonal_project/trex/$sample/TOMbc
        trex qc --plot-jaccard-matrix --plot-hamming-distance $trex_path
done


for sample in 112623_E11_cranial1 112623_E11_cranial2 112623_E11_Lens 112623_E11_Olfactory 112623_E11_Otic 112623_E11_Trunk
do
        trex_path=/home/felix/data/clonal_project/old_trex/$sample/TOMbc
        trex qc --plot-jaccard-matrix --plot-hamming-distance $trex_path
done