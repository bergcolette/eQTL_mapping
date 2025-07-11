# converting gff3 to bed file 

# importing packages
import pandas as pf
import gff2bed

# reading in data and converting 

gff_data = pd.DataFrame(gff2bed.convert(gff2bed.parse("Pvirgatum_AP13.gff3")))

# writing resulting bed file

gff_data.to_csv("AP13.bed", sep = "\t", header = None, index = None)
