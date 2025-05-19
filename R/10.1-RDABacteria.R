# Phyllosphere

rda_bacteria_phyllo <- tax_fix(bacteria_phyllosphere)
rda_bacteria_phyllo <- phyloseq_validate(rda_bacteria_phyllo, remove_undetected = TRUE)

View(rda_bacteria_phyllo@sam_data)

class(rda_bacteria_phyllo@sam_data$MO)<-"numeric"

#RDA Model
rda_bacteria_phyllo_data<- rda_bacteria_phyllo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacteria_phyllo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_bacteria_phyllo_data

# Selecting variables and taxa

clases_rda_bacteria<-as.data.frame(total_bacteria@tax_table)
clases_rda_bacteria


clases_rda_bacteria<-as.data.frame(total_bacteria@tax_table)

colnames(rda_bacteria_phyllo@sam_data)[18]<-"Temperature"
colnames(rda_bacteria_phyllo@sam_data)[20]<-"Light"
colnames(rda_bacteria_phyllo@sam_data)[22]<-"RH"
colnames(rda_bacteria_phyllo@sam_data)[24]<-"EC"

rda_bacterias_filo@tax_table[rda_bacterias_filo@tax_table=="Acidobacteriae"]<-"Terriglobia"
rda_bacterias_filo@tax_table[rda_bacterias_filo@tax_table=="Actinomycetia"]<-"Actinomycetes"
rda_bacterias_filo@tax_table[rda_bacterias_filo@tax_table=="Eremiobacteria"]<-"Vulcanimicrobiia"
rda_bacterias_filo@tax_table[rda_bacterias_filo@tax_table=="Polyangia_463783"]<-"Polyangiia"
rda_bacterias_filo@tax_table[rda_bacterias_filo@tax_table=="Acidimicrobiia_401430"]<-"Acidimicrobiia"
rda_bacterias_filo@tax_table[rda_bacterias_filo@tax_table=="Verrucomicrobiae"]<-"Verrucomicrobiia"

clases_rda_bacterias$Class[clases_rda_bacterias$Class=="Acidobacteriae"]<-"Terriglobia"
clases_rda_bacterias$Class[clases_rda_bacterias$Class=="Actinomycetia"]<-"Actinomycetes"
clases_rda_bacterias$Class[clases_rda_bacterias$Class=="Eremiobacteria"]<-"Vulcanimicrobiia"
clases_rda_bacterias$Class[clases_rda_bacterias$Class=="Polyangia_463783"]<-"Polyangiia"
clases_rda_bacterias$Class[clases_rda_bacterias$Class=="Acidimicrobiia_401430"]<-"Acidimicrobiia"
clases_rda_bacterias$Class[clases_rda_bacterias$Class=="Verrucomicrobiae"]<-"Verrucomicrobiia"
#Plot

rda_bacteria_phyllo_plot<-rda_bacteria_phyllo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacteria_phyllo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Elevation",plot_taxa = clases_rda_bacteria[c(10,1,6,5,7),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 5),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 4.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("a. Bacterial phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_bacteria_phyllo_plot

# Rhizosphere

rda_bacteria_rhizo <- tax_fix(bacteria_rhizosphere)
rda_bacteria_rhizo <- phyloseq_validate(rda_bacteria_rhizo, remove_undetected = TRUE)

View(rda_bacteria@tax_table)

class(rda_bacteria_rhizo@sam_data$MO)<-"numeric"

#RDA model

rda_bacteria_rhizo_data<- rda_bacteria_rhizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacteria_rhizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_bacteria_rhizo_data
clases_rda_bacteria<-as.data.frame(total_bacteria@tax_table)
clases_rda_bacteria

# Selecting variables and taxa

clases_rda_bacteria<-as.data.frame(total_bacteria@tax_table)
colnames(rda_bacteria_rhizo@sam_data)[18]<-"Temperature"
colnames(rda_bacteria_rhizo@sam_data)[20]<-"Light"
colnames(rda_bacteria_rhizo@sam_data)[22]<-"RH"
colnames(rda_bacteria_rhizo@sam_data)[24]<-"EC"

rda_bacterias_rizo@tax_table[rda_bacterias_rizo@tax_table=="Acidobacteriae"]<-"Terriglobia"
rda_bacterias_rizo@tax_table[rda_bacterias_rizo@tax_table=="Actinomycetia"]<-"Actinomycetes"
rda_bacterias_rizo@tax_table[rda_bacterias_rizo@tax_table=="Eremiobacteria"]<-"Vulcanimicrobiia"
rda_bacterias_rizo@tax_table[rda_bacterias_rizo@tax_table=="Polyangia_463783"]<-"Polyangiia"
rda_bacterias_rizo@tax_table[rda_bacterias_rizo@tax_table=="Acidimicrobiia_401430"]<-"Acidimicrobiia"
rda_bacterias_rizo@tax_table[rda_bacterias_rizo@tax_table=="Verrucomicrobiae"]<-"Verrucomicrobiia"
#Plot

rda_bacteria_rhizo_plot<-rda_bacteria_rhizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_bacteria_rhizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Elevation",plot_taxa = clases_rda_bacteria[c(9,1,3,11,7),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 5),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 4.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("b. Bacterial rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_bacteria_rhizo_plot
