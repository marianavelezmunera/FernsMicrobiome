# Beta diversity 

# Matrix imported from QIIME2

unifrac_hongos<-read_qza("unifrac_hongos.qza")
matriz_unifrac_hongos<-as.matrix(unifrac_hongos$data)
unifrac_filosfera_hongos<-matriz_unifrac_hongos[1:15,1:15]
unifrac_filosfera_hongos<-as.dist(unifrac_filosfera_hongos)
unifrac_rizosfera_hongos<-matriz_unifrac_hongos[16:29,16:29]
unifrac_rizosfera_hongos<-as.dist(unifrac_rizosfera_hongos)
matriz_unifrac_hongos<-as.dist(matriz_unifrac_hongos)

wunifrac_hongos<-read_qza("wunifrac_hongos.qza")
matriz_wunifrac_hongos<-as.matrix(wunifrac_hongos$data)
wunifrac_filosfera_hongos<-matriz_wunifrac_hongos[1:15,1:15]
wunifrac_filosfera_hongos<-as.dist(wunifrac_filosfera_hongos)
wunifrac_rizosfera_hongos<-matriz_wunifrac_hongos[16:29,16:29]
wunifrac_rizosfera_hongos<-as.dist(wunifrac_rizosfera_hongos)
matriz_wunifrac_hongos<-as.dist(matriz_wunifrac_hongos)

# Ordination

pcoa_unifrac_hongos<-ordinate(hongos_rare,method = "PCoA",distance = matriz_unifrac_hongos)
pcoa_wunifrac_hongos<-ordinate(hongos_rare,method = "PCoA",distance = matriz_wunifrac_hongos)

# Unweighted UniFrac

plot_ordination(hongos_rare,pcoa_unifrac_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Weighted UniFrac

plot_ordination(hongos_rare,pcoa_wunifrac_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

#PERMANOVAs

adonis2(matriz_unifrac_hongos ~ Tipo_muestra*Altitud, by="terms",data = metadatos_hongos[1:34,])
adonis2(matriz_wunifrac_hongos~Tipo_muestra*Altitud,by="terms",data = metadatos_hongos[1:34,])

# ANOSIMs 
# UniFrac
# Phyllosphere
anosim(unifrac_filosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Filosfera")$Altitud,permutations = 9999)

# Rhizosphere
anosim(unifrac_rizosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)

# Wunifrac
# Phyllosphere
anosim(wunifrac_filosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Filosfera")$Altitud,distance = "bray",permutations = 9999)
# Rhizosphere
anosim(wunifrac_rizosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)
# Beta diversity 

# Matrix

unifrac_hongos<-read_qza("unifrac_hongos.qza")
matriz_unifrac_hongos<-as.matrix(unifrac_hongos$data)
unifrac_filosfera_hongos<-matriz_unifrac_hongos[1:15,1:15]
unifrac_filosfera_hongos<-as.dist(unifrac_filosfera_hongos)
unifrac_rizosfera_hongos<-matriz_unifrac_hongos[16:29,16:29]
unifrac_rizosfera_hongos<-as.dist(unifrac_rizosfera_hongos)
matriz_unifrac_hongos<-as.dist(matriz_unifrac_hongos)

wunifrac_hongos<-read_qza("wunifrac_hongos.qza")
matriz_wunifrac_hongos<-as.matrix(wunifrac_hongos$data)
wunifrac_filosfera_hongos<-matriz_wunifrac_hongos[1:15,1:15]
wunifrac_filosfera_hongos<-as.dist(wunifrac_filosfera_hongos)
wunifrac_rizosfera_hongos<-matriz_wunifrac_hongos[16:29,16:29]
wunifrac_rizosfera_hongos<-as.dist(wunifrac_rizosfera_hongos)
matriz_wunifrac_hongos<-as.dist(matriz_wunifrac_hongos)

# Ordination

pcoa_unifrac_hongos<-ordinate(hongos_rare,method = "PCoA",distance = matriz_unifrac_hongos)
pcoa_wunifrac_hongos<-ordinate(hongos_rare,method = "PCoA",distance = matriz_wunifrac_hongos)

# Unweighted UniFrac

plot_ordination(hongos_rare,pcoa_unifrac_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

# Weighted UniFrac

plot_ordination(hongos_rare,pcoa_wunifrac_hongos,shape = "Tipo_muestra",color="Altitud")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_color_manual(name="Elevation",values=moma.colors("Warhol",5))+
  scale_shape(name="Sample type")

#PERMANOVAs

adonis2(matriz_unifrac_hongos ~ Tipo_muestra*Altitud, by="terms",data = metadatos_hongos[1:34,])
adonis2(matriz_wunifrac_hongos~Tipo_muestra*Altitud,by="terms",data = metadatos_hongos[1:34,])

# ANOSIMs 

# UniFrac
# Phyllosphere
anosim(unifrac_filosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Filosfera")$Altitud,permutations = 9999)
# Rhizosphere
anosim(unifrac_rizosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)

# Wunifrac
# Phyllosphere
anosim(wunifrac_filosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Filosfera")$Altitud,distance = "bray",permutations = 9999)
# Rhizosphere
anosim(wunifrac_rizosfera_hongos,subset(metadatos_hongos,Tipo_muestra=="Rizosfera")$Altitud,distance = "bray",permutations = 9999)






