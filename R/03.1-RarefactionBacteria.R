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

# Plot for sample type

rarefaccion_bacterias1<-rarefaccion_bacterias %>% mutate(muestra=case_when(grepl("^BF",Site)~"Phyllosphere",grepl("^BR",Site)~"Rhizosphere",grepl("^BS",Site)~"Soil"))

rarefacion_bact_filo<-subset(rarefaccion_bacterias1,muestra=="Phyllosphere")
rarefacion_bact_rizo<-subset(rarefaccion_bacterias1,muestra=="Rhizosphere")
rarefacion_bact_suelo<-subset(rarefaccion_bacterias1,muestra=="Soil")

rare_bact_filo_plot<-ggplot(data=rarefacion_bact_filo,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))+
  geom_text(data=. %>% arrange(desc(Sample)) %>%
              group_by(Site) %>%
              slice(1),aes(label=Site),position=position_nudge(0.5), hjust=0, show.legend=FALSE,size=3)+
  ggtitle("a. Bacterial phyllosphere")


rare_bact_rizo_plot<-ggplot(data=rarefacion_bact_rizo,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))+
  geom_text(data=. %>% arrange(desc(Sample)) %>%
              group_by(Site) %>%
              slice(1),aes(label=Site),position=position_nudge(0.5), hjust=0, show.legend=FALSE,size = 3)+
  ggtitle("b. Bacterial rhizosphere")

ggplot(data=rarefacion_bact_suelo,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35)

# Delete unuselful vectors
rm(sample_bacteria)
rm(plot_bacteria)
