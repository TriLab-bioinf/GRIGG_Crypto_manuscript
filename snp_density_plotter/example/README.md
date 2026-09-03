# Example of how to regenerate a SNP density plot from a VCF file and a samtools depth file

## 1- Create a snpden file from a VCF and samtools-depth output files

```bash
perl ../scripts/extract_SNP_info_from_vcf_and_depth.pl -b 10000 -d C2_cat.realigned.bam.depth -v C2_cat.vcf > C2_cat.snpden
```

## 2- Create the SNP density plot from a snpden file

```bash
python ../scripts/SNP_density_plot.py -i C2_cat.snpden -o C2_cat -p 4
```