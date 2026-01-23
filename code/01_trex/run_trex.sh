#!/bin/bash

mkdir -p /placodes/data/trex/

for sample in lens1 lens2 lens3 otic1 otic2 olfac1 olfac2 112623_E11_cranial1 112623_E11_cranial2 112623_E11_Lens 112623_E11_Olfactory 112623_E11_Otic 112623_E11_Trunk
do
        mkdir -p /placodes/data/trex/$sample
        out_path=/placodes/data/trex/$sample/TOMbc
        in_path=/placodes/data/cellranger/$sample/GEX
        trex run10x \
                --chromosome TOMbc \
                --start 1458 \
                --end 1487 \
                --delete \
                --umi-matrix \
                --output $out_path \
                $in_path
done