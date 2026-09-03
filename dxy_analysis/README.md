# Running Dxy analysis

To run the _Dxy_ analysis, first you need to install `pixy`. For instructions on how to install and run this software, read pixy's [Step by Step Installation and Usage Guide](https://pixy.readthedocs.io/en/latest/guide/pixy_guide.html).


To perform the Dxy analysis on the Cryptosporidium dataset use the following command:

```bash
bash ./run_pixy.sh
```

The `run_pixy.sh` runs the _pixy_ command using as input the `population.txt` tabulated file containing sample_ids and their assigned group names, one sample per row, plus an associated VCF files with SNP information for the same samples. The scripts generates the output file `pixy_dxy.txt` within the directory DXY_OUTPUT.

Then, the `1-plot_dxy_analysis.R` R script can be used to reproduce the figure shown in the manuscript using as input the `pixy_dxy.txt` file.
