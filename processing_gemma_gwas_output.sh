awk '{print "BIOMASS", "\t" $0}' BIOMASS_Gulf_TX.assoc.txt > BIOMASS_Gulf_TX.labeled.txt
awk '{print "EM1", "\t" $0}' EM1_Gulf_TX.assoc.txt > EM1_Gulf_TX.labeled.txt 
awk '{print "EM50", "\t" $0}' EM50_Gulf_TX.assoc.txt > EM50_Gulf_TX.labeled.txt
awk '{print "FL1", "\t" $0}' FL1_Gulf_TX.assoc.txt > FL1_Gulf_TX.labeled.txt
awk '{print "FL50", "\t" $0}' FL50_Gulf_TX.assoc.txt > FL50_Gulf_TX.labeled.txt 
awk '{print "GR100", "\t" $0}' GR100_Gulf_TX.assoc.txt > GR100_Gulf_TX.labeled.txt 
awk '{print "GR1", "\t" $0}' GR1_Gulf_TX.assoc.txt > GR1_Gulf_TX.labeled.txt 
awk '{print "GR50", "\t" $0}' GR50_Gulf_TX.assoc.txt > GR50_Gulf_TX.labeled.txt 
awk '{print "HT_PAN_EOS", "\t" $0}' HT_PAN_EOS_Gulf_TX.assoc.txt > HT_PAN_EOS_Gulf_TX.labeled.txt
awk '{print "MOISTURE", "\t" $0}' MOISTURE_Gulf_TX.assoc.txt > MOISTURE_Gulf_TX.labeled.txt 
awk '{print "TC_EOS", "\t" $0}' TC_EOS_Gulf_TX.assoc.txt > TC_EOS_Gulf_TX.labeled.txt 


# now pasting together by population / habitat 

tail --lines=+2 *_Atlantic_TX.labeled.txt > allTraits_Atlantic_TX.txt
tail --lines=+2 *_Gulf_TX.labeled.txt > allTraits_Gulf_TX.txt
tail --lines=+2 *_Midwest_TX.labeled.txt > allTraits_Midwest_TX.txt


# filtering by minor allele frequency and significance

awk '{ if ($8 >= 0.05 && $14 < 0.0005 ) print $0 }' allTraits_Atlantic_TX.txt > allTraits_Atlantic_TX_filt.txt
awk '{ if ($8 >= 0.05 && $14 < 0.0005 ) print $0 }' allTraits_Gulf_TX.txt > allTraits_Gulf_TX_filt.txt
awk '{ if ($8 >= 0.05 && $14 < 0.0005 ) print $0 }' allTraits_Midwest_TX.txt > allTraits_Midwest_TX_filt.txt


awk '{ if ($8 >= 0.05 && $14 < 0.0005 ) print $0 }' allTraits_Atlantic_TX.txt > allTraits_Atlantic_TX_filt.txt
awk '{ if ($8 >= 0.05 && $14 < 0.0005 ) print $0 }' allTraits_Gulf_TX.txt > allTraits_Gulf_TX_filt.txt
awk '{ if ($8 >= 0.05 && $14 < 0.0005 ) print $0 }' allTraits_Midwest_TX.txt > allTraits_Midwest_TX_filt.txt