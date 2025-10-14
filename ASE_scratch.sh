# creating a pseudo-F1 vcf 

# using awk. if line > 91, replace column 10 (the genotype column) with 0/1
awk 'NR > 91 {$10 = "0/1"} {print}' F1_template.recode.vcf > F1.vcf



bcftools concat Chr01K.recode.vcf.gz \
 Chr01N.recode.vcf.gz \
 Chr02K.recode.vcf.gz \
 Chr02N.recode.vcf.gz \
 Chr03K.recode.vcf.gz \
 Chr03N.recode.vcf.gz \
 Chr04K.recode.vcf.gz \
 Chr04N.recode.vcf.gz \
 Chr05K.recode.vcf.gz \
 Chr05N.recode.vcf.gz \
 Chr06K.recode.vcf.gz \
 Chr06N.recode.vcf.gz \
 Chr07K.recode.vcf.gz \
 Chr07N.recode.vcf.gz \
 Chr08K.recode.vcf.gz \
 Chr08N.recode.vcf.gz \
 Chr09K.recode.vcf.gz \
 Chr09N.recode.vcf.gz \
 -Oz -O AP13_DAC6.vcf.gz

    
