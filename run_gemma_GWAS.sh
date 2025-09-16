module load Miniforge3
conda activate switchgrass_eGWAS

# making the kinship matrices
gemma -gk -bfile allChroms_Atlantic -o Atlantic
gemma -gk -bfile allChroms_Midwest -o Midwest
gemma -gk -bfile allChroms_Gulf -o Gulf


# running gemma (separately for each population)
gemma -bfile allChroms_Atlantic -n 1 -lmm 4 -k output/Midwest.cXX.txt -o GR1
gemma -bfile allChroms_Atlantic -n 2 -lmm 4 -k output/Midwest.cXX.txt -o GR50
gemma -bfile allChroms_Atlantic -n 3 -lmm 4 -k output/Midwest.cXX.txt -o GR100
gemma -bfile allChroms_Atlantic -n 4 -lmm 4 -k output/Midwest.cXX.txt -o EM1
gemma -bfile allChroms_Atlantic -n 5 -lmm 4 -k output/Midwest.cXX.txt -o EM50
gemma -bfile allChroms_Atlantic -n 6 -lmm 4 -k output/Midwest.cXX.txt -o FL1
gemma -bfile allChroms_Atlantic -n 7 -lmm 4 -k output/Midwest.cXX.txt -o FL50
gemma -bfile allChroms_Atlantic -n 8 -lmm 4 -k output/Midwest.cXX.txt -o TC_EOS
gemma -bfile allChroms_Atlantic -n 9 -lmm 4 -k output/Midwest.cXX.txt -o HT_PAN_EOS
gemma -bfile allChroms_Atlantic -n 10 -lmm 4 -k output/Midwest.cXX.txt -o MOISTURE
gemma -bfile allChroms_Atlantic -n 11 -lmm 4 -k output/Midwest.cXX.txt -o BIOMASS

gemma -bfile allChroms_Midwest -n 1 -lmm 4 -k output/Midwest.cXX.txt -o GR1_Midwest
gemma -bfile allChroms_Midwest -n 2 -lmm 4 -k output/Midwest.cXX.txt -o GR50_Midwest
gemma -bfile allChroms_Midwest -n 3 -lmm 4 -k output/Midwest.cXX.txt -o GR100_Midwest
gemma -bfile allChroms_Midwest -n 4 -lmm 4 -k output/Midwest.cXX.txt -o EM1_Midwest
gemma -bfile allChroms_Midwest -n 5 -lmm 4 -k output/Midwest.cXX.txt -o EM50_Midwest
gemma -bfile allChroms_Midwest -n 6 -lmm 4 -k output/Midwest.cXX.txt -o FL1_Midwest
gemma -bfile allChroms_Midwest -n 7 -lmm 4 -k output/Midwest.cXX.txt -o FL50_Midwest
gemma -bfile allChroms_Midwest -n 8 -lmm 4 -k output/Midwest.cXX.txt -o TC_EOS_Midwest
gemma -bfile allChroms_Midwest -n 9 -lmm 4 -k output/Midwest.cXX.txt -o HT_PAN_EOS_Midwest
gemma -bfile allChroms_Midwest -n 10 -lmm 4 -k output/Midwest.cXX.txt -o MOISTURE_Midwest
gemma -bfile allChroms_Midwest -n 11 -lmm 4 -k output/Midwest.cXX.txt -o BIOMASS_Midwest


gemma -bfile allChroms_Gulf -n 1 -lmm 4 -k output/Gulf.cXX.txt -o GR1_Gulf
gemma -bfile allChroms_Gulf -n 2 -lmm 4 -k output/Gulf.cXX.txt -o GR50_Gulf
gemma -bfile allChroms_Gulf -n 3 -lmm 4 -k output/Gulf.cXX.txt -o GR100_Gulf
gemma -bfile allChroms_Gulf -n 4 -lmm 4 -k output/Gulf.cXX.txt -o EM1_Gulf
gemma -bfile allChroms_Gulf -n 5 -lmm 4 -k output/Gulf.cXX.txt -o EM50_Gulf
gemma -bfile allChroms_Gulf -n 6 -lmm 4 -k output/Gulf.cXX.txt -o FL1_Gulf
gemma -bfile allChroms_Gulf -n 7 -lmm 4 -k output/Gulf.cXX.txt -o FL50_Gulf
gemma -bfile allChroms_Gulf -n 8 -lmm 4 -k output/Gulf.cXX.txt -o TC_EOS_Gulf
gemma -bfile allChroms_Gulf -n 9 -lmm 4 -k output/Gulf.cXX.txt -o HT_PAN_EOS_Gulf
gemma -bfile allChroms_Gulf -n 10 -lmm 4 -k output/Gulf.cXX.txt -o MOISTURE_Gulf
gemma -bfile allChroms_Gulf -n 11 -lmm 4 -k output/Gulf.cXX.txt -o BIOMASS_Gulf



