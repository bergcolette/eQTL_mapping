module load Miniforge3
conda activate switchgrass_eGWAS

gemma -bfile allChroms_Atlantic -n 1 -lmm 1 -k output/result.cXX.txt -o GR1
gemma -bfile allChroms_Atlantic -n 2 -lmm 1 -k output/result.cXX.txt -o GR50
gemma -bfile allChroms_Atlantic -n 3 -lmm 1 -k output/result.cXX.txt -o GR100
gemma -bfile allChroms_Atlantic -n 4 -lmm 1 -k output/result.cXX.txt -o EM1
gemma -bfile allChroms_Atlantic -n 5 -lmm 1 -k output/result.cXX.txt -o EM50
gemma -bfile allChroms_Atlantic -n 6 -lmm 1 -k output/result.cXX.txt -o FL1
gemma -bfile allChroms_Atlantic -n 7 -lmm 1 -k output/result.cXX.txt -o FL50
gemma -bfile allChroms_Atlantic -n 8 -lmm 1 -k output/result.cXX.txt -o TC_EOS
gemma -bfile allChroms_Atlantic -n 9 -lmm 1 -k output/result.cXX.txt -o HT_PAN_EOS
gemma -bfile allChroms_Atlantic -n 10 -lmm 1 -k output/result.cXX.txt -o MOISTURE
gemma -bfile allChroms_Atlantic -n 11 -lmm 1 -k output/result.cXX.txt -o BIOMASS



gemma -gk -bfile allChroms_Atlantic