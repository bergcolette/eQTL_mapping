module purge
module load VCFtools

vcftools --gzvcf allChroms_Gulf.vcf.gz --positions TX_Gulf_cis.txt --freq --out TX_Gulf_cis_SFS
vcftools --gzvcf allChroms_Gulf.vcf.gz --positions MI_Gulf_cis.txt --freq --out MI_Gulf_cis_SFS
vcftools --gzvcf allChroms_Gulf.vcf.gz --positions GxE_Gulf_cis.txt --freq --out GxE_Gulf_cis_SFS

vcftools --gzvcf allChroms_Atlantic.vcf.gz --positions TX_Atlantic_cis.txt --freq --out TX_Atlantic_cis_SFS
vcftools --gzvcf allChroms_Atlantic.vcf.gz --positions MI_Atlantic_cis.txt --freq --out MI_Atlantic_cis_SFS
vcftools --gzvcf allChroms_Atlantic.vcf.gz --positions GxE_Atlantic_cis.txt --freq --out GxE_Atlantic_cis_SFS

vcftools --gzvcf allChroms_Midwest.vcf.gz --positions TX_Midwest_cis.txt --freq --out TX_Midwest_cis_SFS
vcftools --gzvcf allChroms_Midwest.vcf.gz --positions MI_Midwest_cis.txt --freq --out MI_Midwest_cis_SFS
vcftools --gzvcf allChroms_Midwest.vcf.gz --positions GxE_Midwest_cis.txt --freq --out GxE_Midwest_cis_SFS