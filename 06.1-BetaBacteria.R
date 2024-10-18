# Beta diversity 

# Matrix from QIIME2

unifrac_bacteria<-read_qza("unifrac_bacteria.qza")
matriz_unifrac_bacteria<-as.matrix(unifrac_bacteria$data)
matriz_unifrac_bacteria<-matriz_unifrac_bacteria[1:33,1:33]
unifrac_phyllosphere_bacteria<-matriz_unifrac_bacteria[1:13,1:13]
unifrac_phyllosphere_bacteria<-as.dist(unifrac_phyllosphere_bacteria)
unifrac_rhizosphere_bacteria<-matriz_unifrac_bacteria[14:28,14:28]
unifrac_rhizosphere_bacteria<-as.dist(unifrac_rhizosphere_bacteria)
matriz_unifrac_bacteria<-as.dist(matriz_unifrac_bacteria)


wunifrac_bacteria<-read_qza("wunifrac_bacteria.qza")
matriz_wunifrac_bacteria<-as.matrix(wunifrac_bacteria$data)
wunifrac_phyllosphere_bacteria<-matriz_wunifrac_bacteria[1:13,1:13]
wunifrac_phyllosphere_bacteria<-as.dist(wunifrac_phyllosphere_bacteria)
wunifrac_rhizosphere_bacteria<-matriz_wunifrac_bacteria[14:28,14:28]
wunifrac_rhizosphere_bacteria<-as.dist(wunifrac_rhizosphere_bacteria)
matriz_wunifrac_bacteria<-as.dist(matriz_wunifrac_bacteria)

# Ordinate complete

#UniFrac
pcoa_unifrac_bacteria<-ordinate(bacteria_rare,method = "PCoA",distance = matriz_unifrac_bacteria)

#Weighted UniFrac
pcoa_wunifrac_bacteria<-ordinate(bacteria_rare,method = "PCoA",distance = matriz_wunifrac_bacteria) 

# Ordinate by sample type

# Phyllosphere
pcoa_unifrac_bacteria_phyllosphere<-ordinate(bacteria_phyllosphere,method = "PCoA",distance = unifrac_phyllosphere_bacteria) #UniFrac
pcoa_wunifrac_bacteria_phyllosphere<-ordinate(bacteria_phyllosphere,method = "PCoA",distance = wunifrac_phyllosphere_bacteria) #Weighted UniFrac

#Rhizosphere
pcoa_unifrac_bacteria_rhizosphere<-ordinate(bacteria_rhizosphere,method = "PCoA",distance = unifrac_rhizosphere_bacteria) #UniFrac
pcoa_wunifrac_bacteria_rhizosphere<-ordinate(bacteria_rhizosphere,method = "PCoA",distance = wunifrac_rhizosphere_bacteria) #Weighted


#Plots sample type + elevation

# Unweighted UniFrac

plot_ordination(bacteria_rare,pcoa_unifrac_bacteria,shape = "Sample_type",color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  scale_shape(name="Sample type")

# Weighted UniFrac

plot_ordination(bacteria_rare,pcoa_wunifrac_bacteria,shape = "Sample_type",color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  scale_shape(name="Sample type")

# Plots by sample type

# Phyllosphere

#UniFrac
plot_ordination(bacteria_phyllosphere,pcoa_unifrac_bacteria_phyllosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("a. Bacterial phyllosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Weighted UniFrac
plot_ordination(bacteria_phyllosphere,pcoa_wunifrac_bacteria_phyllosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("a. Bacterial phyllosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Rhizosphere 

#UniFrac
plot_ordination(bacteria_rhizosphere,pcoa_unifrac_bacteria_rhizosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("b. Bacterial rhizosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Weighted UniFrac
plot_ordination(bacteria_rhizosphere,pcoa_wunifrac_bacteria_rhizosphere,color="Elevation")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=colores)+
  ggtitle("b. Bacterial rhizosphere")+
  geom_point(size=5)+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))

#Statistical analysis

#PERMANOVAs

adonis2(matriz_unifrac_bacteria ~ Sample_type*Elevation, data = metadata_bacteria[1:33,])

adonis2(matriz_wunifrac_bacteria~Sample_type*Elevation,data = metadata_bacteria[1:33,])

# ANOSIMs 

#UniFrac

# Phyllosphere
anosim(unifrac_phyllosphere_bacteria,subset(metadata_bacteria,Sample_type=="Phyllosphere")$Elevation,permutations = 9999)

# Rhizosphere
anosim(unifrac_rhizosphere_bacteria,subset(metadata_bacteria,Sample_type=="Rhizosphere")$Elevation,permutations = 9999)


# Weighted UniFrac

# Phyllosphere
anosim(wunifrac_phyllosphere_bacteria,subset(metadata_bacteria,Sample_type=="Phyllosphere")$Elevation,permutations = 9999)

# Rhizosphere
anosim(wunifrac_rhizosphere_bacteria,subset(metadata_bacteria,Sample_type=="Rhizosphere")$Elevation,permutations = 9999)



