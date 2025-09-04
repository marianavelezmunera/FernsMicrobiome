# Alpha diversity

diversidad_alfa_hongos<-alpha(hongos_rare,index = "all") 
diversidad_alfa_hongos$id<-rownames(diversidad_alfa_hongos)

# Importing Faith's PD from .qza

faith_pd_hongos<-read_qza("faith_pd_vector_hongos.qza")
FaithsPD_hongos<-as.data.frame(faith_pd_hongos$data)
FaithsPD_hongos$id<-rownames(FaithsPD_hongos)
diversidad_alfa_hongos<-left_join(diversidad_alfa_hongos,FaithsPD_hongos,by="id")

diversidad_alfa_hongos<-left_join(metadatos_hongos[1:34,1:5],diversidad_alfa_hongos,by="id")

# Plots

# Shannon vs sample

ggplot(data = diversidad_alfa_hongos,aes(x=Tipo_muestra,y=diversity_shannon,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Sample type")+ylab("H")+
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",3))+
  scale_x_discrete(labels=c("Phyllosphere","Rhizosphere","Bulk soil"))

# Shannon vs elevation

ggplot(data = diversidad_alfa_hongos,aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

# Full plots (elevation+sample type)

# Shannon 

ggplot(data = diversidad_alfa_hongos,aes(x=Altitud,y=diversity_shannon,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H")+
  theme(legend.position = "bottom")+
  scale_fill_manual(name="Sample type", label=c("Phyllosphere","Rhizosphere","Bulk soil"),values=moma.colors("Warhol",3))

## Statistical analysis

# Two way ANOVA Shannon

anova_shannon_hongos<-aov(diversity_shannon~Tipo_muestra*Altitud,data = diversidad_alfa_hongos)
summary(anova_shannon_hongos)

# Sample type ANOVA
anova_shannon_hongos2<-aov(diversity_shannon~Tipo_muestra,data = diversidad_alfa_hongos)
summary(anova_shannon_bacterias2)
