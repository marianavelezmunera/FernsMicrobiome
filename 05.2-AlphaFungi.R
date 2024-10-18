# Alpha diversity

diversity_alpha_fungi<-alpha(fungi_rare,index = "all") 
diversity_alpha_fungi$id<-rownames(diversity_alpha_fungi)

diversity_alpha_fungi<-left_join(metadata_fungi[1:34,1:5],diversity_alpha_fungi,by="id")


# Plots

# Linnear models to find abline

# Phyllosphere fungi

diversity_alpha_fungi %>% as_tibble() %>%
  mutate(Elevation = factor(Elevation,levels= c(1978,2007,2018,2178,2210)))%>%
  mutate(Elevation3 = as.numeric(Elevation),.before=Elevation) %>%
  filter(Sample_type=="Phyllosphere") %>%
  lm(diversity_shannon ~ Elevation3,data=.) %>% summary(.)


# Rhizosphere fungi
diversity_alpha_fungi %>% as_tibble() %>%
  mutate(Elevation = factor(Elevation,levels= c(1978,2007,2018,2178,2210)))%>%
  mutate(Elevation3 = as.numeric(Elevation),.before=Elevation) %>%
  filter(Sample_type=="Rhizosphere") %>%
  lm(diversity_shannon ~ Elevation3,data=.) %>% summary(.)

shannon_fungi_phyllo<-ggplot(data = subset(diversity_alpha_fungi,Sample_type=="Phyllosphere"),aes(x=Elevation, y=diversity_shannon,group=Elevation))+
  geom_point(aes(fill=Elevation),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =5.322642,slope = -0.002603)+
  ggtitle("c. Fungal phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))

shannon_fungi_rhizo<-ggplot(data = subset(diversity_alpha_fungi,Sample_type=="Rhizosphere"),aes(x=Elevation, y=diversity_shannon,fill=Elevation))+
  geom_point(aes(fill=Elevation),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =4.91582,slope = -0.04141)+
  ggtitle("d. Fungal rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))

## Statistical analysis

# Two way ANOVA Shannon

anova_shannon_fungi<-aov(diversity_shannon~Sample_type*Elevation,data = diversity_alpha_fungi)
summary(anova_shannon_fungi)

