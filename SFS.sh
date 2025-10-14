module purge
module load VCFtools

vcftools --gzvcf allChroms_Gulf.vcf.gz --positions TX_Gulf_cis.txt --freq2 --out TX_Gulf_SFS
vcftools --gzvcf allChroms_Gulf.vcf.gz --positions MI_Gulf_cis.txt --freq2 --out MI_Gulf_SFS
vcftools --gzvcf allChroms_Gulf.vcf.gz --positions GxE_Gulf_cis.txt --freq2 --out GxE_Gulf_SFS

vcftools --gzvcf allChroms_Atlantic.vcf.gz --positions TX_Atlantic_cis.txt --freq2 --out TX_Atlantic_SFS
vcftools --gzvcf allChroms_Atlantic.vcf.gz --positions MI_Atlantic_cis.txt --freq2 --out MI_Atlantic_SFS
vcftools --gzvcf allChroms_Atlantic.vcf.gz --positions GxE_Atlantic_cis.txt --freq2 --out GxE_Atlantic_SFS

vcftools --gzvcf allChroms_Midwest.vcf.gz --positions TX_Midwest_cis.txt --freq2 --out TX_Midwest_SFS
vcftools --gzvcf allChroms_Midwest.vcf.gz --positions MI_Midwest_cis.txt --freq2 --out MI_Midwest_SFS
vcftools --gzvcf allChroms_Midwest.vcf.gz --positions GxE_Midwest_cis.txt --freq2 --out GxE_Midwest_SFS

vcftools --gzvcf allChroms_Gulf.vcf.gz --freq2 --out TX_Gulf_SFS
vcftools --gzvcf allChroms_Gulf.vcf.gz --freq2 --out MI_Gulf_SFS
vcftools --gzvcf allChroms_Gulf.vcf.gz --freq2 --out GxE_Gulf_SFS

vcftools --gzvcf allChroms_Atlantic.vcf.gz --freq2 --out TX_Atlantic_SFS
vcftools --gzvcf allChroms_Atlantic.vcf.gz --freq2 --out MI_Atlantic_SFS
vcftools --gzvcf allChroms_Atlantic.vcf.gz --freq2 --out GxE_Atlantic_SFS

vcftools --gzvcf allChroms_Midwest.vcf.gz --freq2 --out TX_Midwest_SFS
vcftools --gzvcf allChroms_Midwest.vcf.gz --freq2 --out MI_Midwest_SFS
vcftools --gzvcf allChroms_Midwest.vcf.gz --freq2 --out GxE_Midwest_SFS