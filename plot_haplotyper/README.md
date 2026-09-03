# Script to analyze the quimeric nature of haploid genomes

## Description:
  The script plot_haplotypes.ipynb generates haplotype plots using as input a VCF file. Before running, it is necessary to set the strains to be compared and the window size to estimate the percentage of SNPs that are different between the strain of interest and up to three different reference strains that are present in the VCF file. The variables that need to be modified/set before running are the following: 

```
STRAIN = 'EC1'
STRAIN_ref_1 = 'SRR1179185'
STRAIN_ref_2 = 'Chominis1ng'
```
Where STRAIN in the strain of interest, STRAIN_ref_1 is reference strain #1 and STRAIN_ref_2 is reference strain #2. The VCF reference strain is assume to be included in the analysis by default. Strain names should match the strain names in the VCF file.

In addition, it is necessary to set the variable "bin_size" to modify the window size (in bp) that will be used to estimate the percentage of SNPs different between the strain of interest and each reference strain. The defaul value is 10000.

## Example output:

<img width="1265" alt="image" src="https://user-images.githubusercontent.com/76788039/147512366-228db6be-542b-4654-962a-c5ded8408dcc.png">
