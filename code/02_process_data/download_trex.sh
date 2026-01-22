# Download trex

data_path=/home/felix/data/placodal/cellranger
for sample in lens1 lens2 lens3 otic1 otic2 olfac1 olfac2
do
    trex_path=/home/felix/data/clonal_project/trex/$sample/TOMbc
    save_path=/home/felix/data/placodal/trex/$sample
    python /home/felix/tools/scp_data_down.py -f $trex_path -o $save_path
done