#!/bin/bash --login
#SBATCH --job-name=combine_imputed
#SBATCH --nodes=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bergcole@msu.edu
#SBATCH --output=%x-%j.SLURMout

module purge
module load BCFtools/1.19-GCC-13.2.0

bcfDir="/mnt/scratch/bergcole/genotypes"

# for i in ${bcfDir}/Chr*gz; do bcftools index -f ${bcfDir}/$i; done

bcftools concat ${bcfDir}/Chr01K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr01N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr02K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr02N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr03K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr03N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr04K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr04N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr05K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr05N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr06K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr06N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr07K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr07N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr08K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr08N_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr09K_Midwest_imputed.vcf.gz \
    ${bcfDir}/Chr09N_Midwest_imputed.vcf.gz \
-Oz -o ${bcfDir}/allChroms_Midwest.vcf.gz 

bcftools concat ${bcfDir}/Chr01K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr01N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr02K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr02N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr03K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr03N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr04K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr04N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr05K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr05N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr06K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr06N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr07K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr07N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr08K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr08N_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr09K_lowland_imputed.vcf.gz \
    ${bcfDir}/Chr09N_lowland_imputed.vcf.gz \
-Oz -o ${bcfDir}/allChroms_lowland.vcf.gz 

#bcftools concat ${bcfDir}/*lowland*vcf.gz -Oz -o ${bcfDir}/allChroms_lowland.vcf.gz

