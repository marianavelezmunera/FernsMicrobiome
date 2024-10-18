# Beta diversity 

# Matrix from QIIME2

#UniFrac

unifrac_fungi<-read_qza("unifrac_fungi.qza")

matriz_unifrac_fungi<-as.matrix(unifrac_fungi$data) 


unifrac_phyllosphere_fungi<-matriz_unifrac_fungi[1:15,1:15]
unifrac_phyllosphere_fungi<-as.dist(unifrac_phyllosphere_fungi) #Phyllosphere

unifrac_rhizosphere_fungi<-matriz_unifrac_fungi[16:29,16:29]
unifrac_rhizosphere_fungi<-as.dist(unifrac_rhizosphere_fungi) #Rhizosphere

matriz_unifrac_fungi<-as.dist(matriz_unifrac_fungi) #Complete

#Weighted UniFrac

wunifrac_fungi<-read_qza("wunifrac_fungi.qza")

matriz_wunifrac_fungi<-as.matrix(wunifrac_fungi$data)

wunifrac_phyllosphere_fungi<-matriz_wunifrac_fungi[1:15,1:15]
wunifrac_phyllosphere_fungi<-as.dist(wunifrac_phyllosphere_fungi) #Phyllosphere 

wunifrac_rhizosphere_fungi<-matriz_wunifrac_fungi[16:29,16:29]
wunifrac_rhizosphere_fungi<-as.dist(wunifrac_rhizosphere_fungi) #Rhizosphere

matriz_wunifrac_fungi<-as.dist(matriz_wunifrac_fungi) #Complete

# Ordinate complete

#UniFrac
pcoa_unifrac_fungi<-ordinate(fungi_rare,method = "PCoA",distance = matriz_unifrac_fungi)

#Weighted UniFrac
pcoa_wunifrac_fungi<-ordinate(fungi_rare,method = "PCoA",distance = matriz_wunifrac_fungi) 

# Ordinate by sample type

# Phyllosphere
pcoa_unifrac_fungi_phyllosphere<-ordinate(fungi_phyllosphere,method = "PCoA",distance = unifrac_phyllosphere_fungi) #UniFrac
pcoa_wunifrac_fungi_phyllosphere<-ordinate(fungi_phyllosphere,method = "PCoA",distance = wunifrac_phyllosphere_fungi) #Weighted UniFrac

#Rhizosphere
pcoa_unifrac_fungi_rhizosphere<-ordinate(fungi_rhizosphere,method = "PCoA",distance = unifrac_rhizosphere_fungi) #UniFrac
pcoa_wunifrac_fungi_rhizosphere<-ordinate(fungi_rhizosphere,method = "PCoA",distance = wunifrac_rhizosphere_fungi) #Weighted


#Plots sample type + elevation

# Unweighted UniFrac

plot_ordination(fungi_rare,pcoa_unifrac_fungi,shape = "Sample_type",color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Weighted UniFrac

plot_ordination(fungi_rare,pcoa_wunifrac_fungi,shape = "Sample_type",color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Plots by sample type

# Phyllosphere

#UniFrac
plot_ordination(fungi_phyllosphere,pcoa_unifrac_fungi_phyllosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("c. Fungal phyllosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Weighted UniFrac
plot_ordination(fungi_phyllosphere,pcoa_wunifrac_fungi_phyllosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("c. Fungal phyllosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Rhizosphere 

#UniFrac
plot_ordination(fungi_rhizosphere,pcoa_unifrac_fungi_rhizosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("d. Fungal rhizosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Weighted UniFrac
plot_ordination(fungi_rhizosphere,pcoa_wunifrac_fungi_rhizosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("d. Fungal rhizosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Statistical analysis

#PERMANOVAs

adonis2(matriz_unifrac_fungi ~ Sample_type*Elevation, data = metadata_fungi[1:34,])

adonis2(matriz_wunifrac_fungi~Sample_type*Elevation,data = metadata_fungi[1:34,])

# ANOSIMs 

#UniFrac

# Phyllosphere
anosim(unifrac_phyllosphere_fungi,subset(metadata_fungi,Sample_type=="Phyllosphere")$Elevation,permutations = 9999)

# Rhizosphere
anosim(unifrac_rhizosphere_fungi,subset(metadata_fungi,Sample_type=="Rhizosphere")$Elevation,permutations = 9999)


# Weighted UniFrac

# Phyllosphere
anosim(wunifrac_phyllosphere_fungi,subset(metadata_fungi,Sample_type=="Phyllosphere")$Elevation,permutations = 9999)

# Rhizosphere
anosim(wunifrac_rhizosphere_fungi,subset(metadata_fungi,Sample_type=="Rhizosphere")$Elevation,permutations = 9999)



