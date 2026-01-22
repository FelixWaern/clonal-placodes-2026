import argparse
import os

parser = argparse.ArgumentParser(description="Reference preparation for velocyto.")
parser.add_argument("-i", "--input", type=str, help="Location of genes.tgf.gz file that was used for CellRanger count")
parser.add_argument("-o", "--output", type=str, help="Location of output genes.gtf file without GFPbc and TOMbc sequences")

args = parser.parse_args()

import gzip
with open(args.output, "w") as f_out:
    with gzip.open(args.input, "rt") as f_in:
        for line in f_in:
            if ('gene_id "RFPbc"' not in line) and ('gene_id "GFPbc"' not in line) and ('gene_id "TOMbc"' not in line):
                f_out.write(line)
