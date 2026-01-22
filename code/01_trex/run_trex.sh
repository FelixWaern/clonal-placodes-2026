#!/bin/bash

for sample in lens1 lens2 lens3 otic1 otic2 olfac1 olfac2
do
        out_path=/home/felix/data/clonal_project/trex/$sample/TOMbc
        in_path=/home/felix/data/clonal_project/cellranger/$sample/GEX
        trex run10x \
                --chromosome TOMbc \
                --start 1458 \
                --end 1487 \
                --delete \
                --umi-matrix \
                --output $out_path \
                $in_path
done


for sample in 112623_E11_cranial1 112623_E11_cranial2 112623_E11_Lens 112623_E11_Olfactory 112623_E11_Otic 112623_E11_Trunk
do
        out_path=/home/felix/data/clonal_project/old_trex/$sample/TOMbc
        in_path=/home/sergey/data/placodes/alignments/$sample/GEX
        trex run10x \
                --chromosome TOMbc \
                --start 1458 \
                --end 1487 \
                --delete \
                --umi-matrix \
                --output $out_path \
                $in_path
done