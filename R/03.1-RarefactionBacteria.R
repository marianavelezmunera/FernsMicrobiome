# Rarefaction

rarefaction_bacteria <- rarecurve(t(abundances(bacteria_ok)), 
                                   step = 50, label = T,tidy = TRUE) 

# Phyloseq object 
bacteria_rare<- rarefy_even_depth(bacteria_ok, rngseed=1, sample.size = 10989, replace = F) # Sample size provided by QIIME2 analysis

# Plot
ggplot(data=rarefaction_bacteria,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))

# Plot for each site

unique(rarefaction_bacteria$Site)

nrow(subset(rarefaction_bacteria,Site=="BF1A"))+ nrow(subset(rarefaction_bacteria,Site=="BF1B"))+nrow(subset(rarefaction_bacteria,Site=="BF1C"))+
  nrow(subset(rarefaction_bacteria,Site=="BF2A"))+nrow(subset(rarefaction_bacteria,Site=="BF2B"))+nrow(subset(rarefaction_bacteria,Site=="BF2C"))+
  nrow(subset(rarefaction_bacteria,Site=="BF3A"))+nrow(subset(rarefaction_bacteria,Site=="BF3B"))+nrow(subset(rarefaction_bacteria,Site=="BF3C"))+
  nrow(subset(rarefaction_bacteria,Site=="BF4A"))+nrow(subset(rarefaction_bacteria,Site=="BF4B"))+nrow(subset(rarefaction_bacteria,Site=="BF4C"))+
  nrow(subset(rarefaction_bacteria,Site=="BF5A"))+nrow(subset(rarefaction_bacteria,Site=="BF5B"))+nrow(subset(rarefaction_bacteria,Site=="BF5C"))

nrow(subset(rarefaction_bacteria,Site=="BR1A"))+nrow(subset(rarefaction_bacteria,Site=="BR1B"))+nrow(subset(rarefaction_bacteria,Site=="BR1C"))+
  nrow(subset(rarefaction_bacteria,Site=="BR2A"))+nrow(subset(rarefaction_bacteria,Site=="BR2B"))+nrow(subset(rarefaction_bacteria,Site=="BR2C"))+
  nrow(subset(rarefaction_bacteria,Site=="BR3A"))+nrow(subset(rarefaction_bacteria,Site=="BR3B"))+nrow(subset(rarefaction_bacteria,Site=="BR3C"))+
  nrow(subset(rarefaction_bacteria,Site=="BR4A"))+nrow(subset(rarefaction_bacteria,Site=="BR4B"))+nrow(subset(rarefaction_bacteria,Site=="BR4C"))+
  nrow(subset(rarefaction_bacteria,Site=="BR5A"))+nrow(subset(rarefaction_bacteria,Site=="BR5B"))+nrow(subset(rarefaction_bacteria,Site=="BR5C"))

nrow(subset(rarefaction_bacteria,Site=="BS1"))+
  nrow(subset(rarefaction_bacteria,Site=="BS2"))+
  nrow(subset(rarefaction_bacteria,Site=="BS3"))+
  nrow(subset(rarefaction_bacteria,Site=="BS4"))+
  nrow(subset(rarefaction_bacteria,Site=="BS5"))

plot_bacteria<-c(rep("2210",848),rep("1978",1495),rep("2178",1031),rep("2007",1087),rep("2018",283),rep("2210",5343),rep("1978",7444),rep("2178",5881),rep("2007",6424),rep("2018",6287),rep("2210",2049),rep("1978",2199),rep("2178",2100),rep("2007",2294),rep("2018",1851))

rarefaction_bacteria$plot<-plot_bacteria

sample_bacteria<-c(rep("Phyllo",4744),rep("Rhizo",31379),rep("Soil",10493))

rarefaction_bacteria$sample<-sample_bacteria
rarefaction_bacteria$plot<-as.factor(rarefaction_bacteria$plot)


ggplot(data=rarefaction_bacteria,aes(x=Sample,y=Species,col=Site))+
  geom_line(aes(linetype=sample))+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  facet_wrap(~plot)+
  scale_color_manual(values = moma.colors("Warhol",35))

# By sample type 

ggplot(data=rarefaction_bacteria,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  facet_wrap(~sample)+
  scale_color_manual(values = moma.colors("Warhol",35))

# Delete unuselful vectors
rm(sample_bacteria)
rm(plot_bacteria)
