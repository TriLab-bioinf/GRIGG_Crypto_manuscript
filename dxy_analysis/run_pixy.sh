#!/usr/bin/bash
#SBATCH --cpus-per-task=8

# Running pixy requires tabix, that is part of samtools
module load samtools

VCF=filtered_sureselect_snps_newbam.PASS_COV5_22sample_26K_SNPS.vcf.gz
POPULATION=population.txt
OUTDIR=DXY_OUTPUT

pixy --stats dxy \
    --vcf ${VCF} \
    --populations ${POPULATION} \
    --window_size 10000 \
    --n_cores 88888888 \
    --output_folder ${OUTDIR} \
    --bypass_invariant_check
