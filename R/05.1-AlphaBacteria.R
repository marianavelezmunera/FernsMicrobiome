# Alpha diversity

diversidad_alfa_bacterias<-alpha(bacterias_rare,index = "all") 
faith_pd_bacterias<-read_qza("faith_pd_vector_bacterias.qza")
FaithsPD_bacterias<-as.data.frame(faith_pd_bacterias$data)
FaithsPD_bacterias$id<-rownames(FaithsPD_bacterias)
diversidad_alfa_bacterias$id<-rownames(diversidad_alfa_bacterias)
diversidad_alfa_bacterias<-left_join(diversidad_alfa_bacterias,FaithsPD_bacterias,by="id")


diversidad_alfa_bacterias<-left_join(metadatos_bacterias[1:34,1:5],diversidad_alfa_bacterias,by="id")

colnames(diversidad_alfa_bacterias)[28]<-"faith_pd"
diversidad_alfa_bacterias<-diversidad_alfa_bacterias[-34,]

# Plots

# Shannon vs elevation 
# Phyllosphere
ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Filosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))
# Rhizosphere
ggplot(data = subset(diversidad_alfa_bacterias,Tipo_muestra=="Rizosfera"),aes(x=Altitud, y=diversity_shannon,fill=Altitud))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H") +
  theme(legend.position = "none")+
  scale_fill_manual(values=moma.colors("Warhol",5))

# Full plots (elevation+sample type)

ggplot(data = diversidad_alfa_bacterias,aes(x=Altitud,y=diversity_shannon,fill=Tipo_muestra))+
  geom_boxplot(color="black")+
  theme_biome_utils()+
  xlab("Elevation")+ylab("H")+
  theme(legend.position = "bottom")+
  scale_fill_manual(name="Tipo de muestra", label=c("Phyllosphere","Rhizosphere","Bulk soil"),values=moma.colors("Warhol",3))

## Statistical analysis

# Two way ANOVA Shannon

anova_shannon_bacterias<-aov(diversity_shannon~Tipo_muestra*Altitud,data = diversidad_alfa_bacterias)
summary(anova_shannon_bacterias2)
TukeyHSD(anova_shannon_bacterias)

anova_shannon_bacterias2<-aov(diversity_shannon~Tipo_muestra,data = diversidad_alfa_bacterias)
summary(anova_shannon_bacterias)
TukeyHSD(anova_shannon_bacterias)
