# Alpha diversity

diversity_alpha_bacteria<-alpha(bacteria_rare,index = "all") 
diversity_alpha_bacteria$id<-rownames(diversity_alpha_bacteria)

diversity_alpha_bacteria<-left_join(metadata_bacteria[1:34,1:5],diversity_alpha_bacteria,by="id")

# Plots

# Linnear models to find abline

# Phyllosphere bacteria

diversity_alpha_bacteria %>% as_tibble() %>%
  mutate(Elevation = factor(Elevation,levels= c(1978,2007,2018,2178,2210)))%>%
  mutate(Elevation3 = as.numeric(Elevation),.before=Elevation) %>%
  filter(Sample_type=="Phyllosphere") %>%
  lm(diversity_shannon ~ Elevation3,data=.) %>% summary(.)


# Rhizosphere bacteria
diversity_alpha_bacteria %>% as_tibble() %>%
  mutate(Elevation = factor(Elevation,levels= c(1978,2007,2018,2178,2210)))%>%
  mutate(Elevation3 = as.numeric(Elevation),.before=Elevation) %>%
  filter(Sample_type=="Rhizosphere") %>%
  lm(diversity_shannon ~ Elevation3,data=.) %>% summary(.)

shannon_bacteria_phyllo<-ggplot(data = subset(diversity_alpha_bacteria,Sample_type=="Phyllosphere"),aes(x=Elevation, y=diversity_shannon,fill=Elevation))+
  geom_point(aes(fill=Elevation),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =4.96658,slope = -0.10095)+
  ggtitle("a.Bacterial phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))
shannon_bacteria_phyllo

shannon_bacteria_rhizo<-ggplot(data = subset(diversity_alpha_bacteria,Sample_type=="Rhizosphere"),aes(x=Elevation, y=diversity_shannon,fill=Elevation))+
  geom_point(aes(fill=Elevation),shape=21,size=5,colour="black")+
  theme_biome_utils()+
  xlab("Elevation (masl)")+ylab("Shannon Index (H)") +
  theme(legend.position = "none")+
  scale_fill_manual(values=colores)+
  geom_abline(intercept =7.14814,slope = -0.06647)+
  ggtitle("b. Bacterial rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))
shannon_bacteria_rhizo

## Statistical analysis

# Two way ANOVA Shannon

anova_shannon_bacteria<-aov(diversity_shannon~Sample_type*Elevation,data = diversity_alpha_bacteria)
summary(anova_shannon_bacteria)


anova_shannon_bacteria<-aov(diversity_shannon~Sample_type*Elevation,data = diversity_alpha_bacteria)
summary(anova_shannon_bacteria)