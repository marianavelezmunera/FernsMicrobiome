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

# By sample type 

rarefaccion_hongos1<-rarefaccion_hongos %>% mutate(muestra=case_when(grepl("^HF",Site)~"Phyllosphere",grepl("^HR",Site)~"Rhizosphere",grepl("^HS",Site)~"Soil"))

rarefacion_hongos_filo<-subset(rarefaccion_hongos1,muestra=="Phyllosphere")
rarefacion_hongos_rizo<-subset(rarefaccion_hongos1,muestra=="Rhizosphere")
rarefacion_hongos_suelo<-subset(rarefaccion_hongos1,muestra=="Soil")

rare_hongos_filo_plot<-ggplot(data=rarefacion_hongos_filo,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))+
  geom_text(data=. %>% arrange(desc(Sample)) %>%
              group_by(Site) %>%
              slice(1),aes(label=Site),position=position_nudge(0.5), hjust=0, show.legend=FALSE,size=3)+
  ggtitle("c. Fungal phyllosphere")


rare_hongos_rizo_plot<-ggplot(data=rarefacion_hongos_rizo,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))+
  geom_text(data=. %>% arrange(desc(Sample)) %>%
              group_by(Site) %>%
              slice(1),aes(label=Site),position=position_nudge(0.5), hjust=0, show.legend=FALSE,size=3)+
  ggtitle("d. Fungal rhizosphere")

ggplot(data=rarefacion_bact_suelo,aes(x=Sample,y=Species,col=Site))+
  geom_line()+
  theme_biome_utils()+
  theme(legend.position = "none")+
  xlab("Sequencing depth")+ylab("ASV number")+
  scale_color_manual(values = moma.colors("Warhol",35))
rm(plot_fungi)


