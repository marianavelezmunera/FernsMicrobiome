# Rarefaction

rarefaction_fungi <- rarecurve(t(abundances(fungi_ok)), 
                                step = 50, label = T,tidy = TRUE) 

# Phyloseq object 
fungi_rare<- rarefy_even_depth(fungi_ok, rngseed=1, sample.size = 26919, replace = F) # Sample size provided by QIIME2 analysis

# Plot
ggplot(data=rarefaction_fungi,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",34))

# Plot for each site

unique(rarefaction_fungi$Site)

nrow(subset(rarefaction_fungi,Site=="HF1A"))+ nrow(subset(rarefaction_fungi,Site=="HF1B"))+nrow(subset(rarefaction_fungi,Site=="HF1C"))+
  nrow(subset(rarefaction_fungi,Site=="HF2A"))+nrow(subset(rarefaction_fungi,Site=="HF2B"))+nrow(subset(rarefaction_fungi,Site=="HF2C"))+
  nrow(subset(rarefaction_fungi,Site=="HF3A"))+nrow(subset(rarefaction_fungi,Site=="HF3B"))+nrow(subset(rarefaction_fungi,Site=="HF3C"))+
  nrow(subset(rarefaction_fungi,Site=="HF4A"))+nrow(subset(rarefaction_fungi,Site=="HF4B"))+nrow(subset(rarefaction_fungi,Site=="HF4C"))+
  nrow(subset(rarefaction_fungi,Site=="HF5A"))+nrow(subset(rarefaction_fungi,Site=="HF5B"))+nrow(subset(rarefaction_fungi,Site=="HF5C"))

nrow(subset(rarefaction_fungi,Site=="HR1A"))+nrow(subset(rarefaction_fungi,Site=="HR1B"))+nrow(subset(rarefaction_fungi,Site=="HR1C"))+
  nrow(subset(rarefaction_fungi,Site=="HR2A"))+nrow(subset(rarefaction_fungi,Site=="HR2B"))+nrow(subset(rarefaction_fungi,Site=="HR2C"))+
  nrow(subset(rarefaction_fungi,Site=="HR3A"))+nrow(subset(rarefaction_fungi,Site=="HR3B"))+nrow(subset(rarefaction_fungi,Site=="HR3C"))+
  nrow(subset(rarefaction_fungi,Site=="HR4A"))+nrow(subset(rarefaction_fungi,Site=="HR4B"))+nrow(subset(rarefaction_fungi,Site=="HR4C"))+
  nrow(subset(rarefaction_fungi,Site=="HR5A"))+nrow(subset(rarefaction_fungi,Site=="HR5B"))+nrow(subset(rarefaction_fungi,Site=="HR5C"))

nrow(subset(rarefaction_fungi,Site=="HS1"))+
  nrow(subset(rarefaction_fungi,Site=="HS2"))+
  nrow(subset(rarefaction_fungi,Site=="HS3"))+
  nrow(subset(rarefaction_fungi,Site=="HS4"))+
  nrow(subset(rarefaction_fungi,Site=="HS5"))

plot_fungi<-c(rep("2210",4923),rep("1978",4963),rep("2178",2678),rep("2007",3216),rep("2018",2289),rep("2210",3776),rep("1978",2617),rep("2178",5449),rep("2007",3702),rep("2018",3673),rep("2210",2227),rep("1978",1617),rep("2178",1703),rep("2007",1009),rep("2018",1728))

rarefaction_fungi$plot<-plot_fungi

sample_fungi<-c(rep("Phyllo",18069),rep("Rhizo",19217),rep("Soil",8284))

rarefaction_fungi$sample<-sample_fungi
rarefaction_fungi$plot<-as.factor(rarefaction_fungi$plot)


ggplot(data=rarefaction_fungi,aes(x=Sample,y=Species,col=Site))+
  geom_line(aes(linetype=sample))+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  facet_wrap(~plot)


# Delete unuselful vectors
rm(sample_fungi)
rm(plot_fungi)


