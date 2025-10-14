#!/bin/bash --login
#SBATCH --job-name=filter_vcfs_for_eQTLs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --time=1:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=bergcole@msu.edu
#SBATCH --output=%x-%j.SLURMout
#SBATCH --array=1-18

echo "JobID: $SLURM_JOB_ID"
echo "Running on node: `hostname`"

module purge 
module load VCFtools

# script for filtering vcf files for the diversity panel
# these merged files are combined (bcfs from Paulo + AP13 added from SRA, all aligned to AP13v6H1)

# setting directory where vcfs are stored & where the filtered genotype files will go
vcfDir="/mnt/scratch/bergcole/genotypes"

# call to the chromosome array
sampleID=$(awk -v ArrayTaskID=$SLURM_ARRAY_TASK_ID '$1==ArrayTaskID {print $2}' chromosomes.array)

# doing all filtering steps except for LD filtering and maf filtering
vcftools --vcf ${vcfDir${sampleID}_mergeAP13.vcf.gz \
    --min-alleles 2 \
    --max-alleles 2 \
    --max-missing 0.01 \
    --minDP 10 \
    --minQ 29 \
    --remove-indels \
    --out ${sampleID}_filt_withAP13 \
    --recode 

