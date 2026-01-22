# Download cellranger

data_path=/home/felix/data/placodal/cellranger

for sample in lens1 lens2 lens3 otic1 otic2 olfac1 olfac2
do
    cellranger_path=/home/felix/data/clonal_project/cellranger/$sample/
      
    sample_data_path=$data_path/$sample/$sample
    sample_data_path+=_filtered_feature_bc_matrix.h5  
    python /home/felix/tools/scp_data_down.py -f $cellranger_path/GEX/outs/filtered_feature_bc_matrix.h5 -o $sample_data_path
    
    sample_data_path=$data_path/$sample/$sample
    sample_data_path+=_raw_feature_bc_matrix.h5  
    python /home/felix/tools/scp_data_down.py -f $cellranger_path/GEX/outs/raw_feature_bc_matrix.h5 -o $sample_data_path
    
    sample_data_path=$data_path/$sample/$sample
    sample_data_path+=_web_summary.html 
    python /home/felix/tools/scp_data_down.py -f $cellranger_path/GEX/outs/web_summary.html -o $sample_data_path
    
    sample_data_path=$data_path/$sample/$sample
    sample_data_path+=_velocyto.loom  
    python /home/felix/tools/scp_data_down.py -f $cellranger_path/GEX/velocyto/GEX.loom -o $sample_data_path
    
    
done

#    os.system(f"scp felix@adameykolab.srv.meduniwien.ac.at:/home/felix/data/clonal_project/trex/{sample}/TOMbc/umi_matrix.h5ad /home/felix/data/placodal/trex/{sample}.h5ad")

#    time.sleep(0.5)
#    os.system(f"scp felix@adameykolab.srv.meduniwien.ac.at:/home/felix/data/clonal_project/cellranger/{sample}/GEX/outs/filtered_feature_bc_matrix.h5 /home/felix/data/placodal/cellranger/{sample}/{sample}_filtered_feature_bc_matrix.h5")
    
#    os.system(f"scp felix@adameykolab.srv.meduniwien.ac.at:/home/felix/data/clonal_project/cellranger/{sample}/GEX/outs/raw_feature_bc_matrix.h5 /home/felix/data/placodal/cellranger/{sample}/{sample}_raw_feature_bc_matrix.h5")
    
#    os.system(f"scp felix@adameykolab.srv.meduniwien.ac.at:/home/felix/data/clonal_project/cellranger/{sample}/GEX/outs/web_summary.html /home/felix/data/placodal/cellranger/{sample}/{sample}_web_summary.html")
    
#    os.system(f"scp felix@adameykolab.srv.meduniwien.ac.at:/home/felix/data/clonal_project/cellranger/{sample}/GEX/velocyto/{sample}.loom /home/felix/data/placodal/cellranger/{sample}/{sample}_velocyto.loom")



#python /home/felix/tools/scp_data_down.py -f /home/felix/data/clonal_project/cellranger/otic1//GEX/outs/filtered_feature_bc_matrix.h5 -o /home/felix/data/placodal/cellranger/otic1/otic1