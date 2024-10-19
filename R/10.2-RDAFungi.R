#RDA Fungi

# Phyllosphere

rda_fungi_phyllo <- tax_fix(fungi_phyllosphere)
rda_fungi_phyllo <- phyloseq_validate(rda_fungi_phyllo, remove_undetected = TRUE)

class(rda_fungi_phyllo@sam_data$MO)<-"numeric"

# RDA Model
rda_fungi_phyllo_data<- rda_fungi_phyllo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_fungi_phyllo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()

rda_fungi_phyllo_data
# Selecting variables and taxa

clases_rda_fungi<-as.data.frame(total_fungi@tax_table)
clases_rda_fungi


clases_rda_fungi<-as.data.frame(total_fungi@tax_table)
colnames(rda_fungi_phyllo@sam_data)[18]<-"Temperature"
colnames(rda_fungi_phyllo@sam_data)[20]<-"Light"
colnames(rda_fungi_phyllo@sam_data)[22]<-"RH"
colnames(rda_fungi_phyllo@sam_data)[24]<-"EC"

# Plot

rda_fungi_phyllo_plot<-rda_fungi_phyllo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_fungi_phyllo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Elevation",plot_taxa = clases_rda_fungi[c(-6,-4,-5,-9),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 5),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 4.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("c. Fungal phyllosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_fungi_phyllo_plot

# Rhizosphere

rda_fungi_rhizo <- tax_fix(fungi_rhizosphere)
rda_fungi_rhizo <- phyloseq_validate(rda_fungi_rhizo, remove_undetected = TRUE)

View(rda_fungi@tax_table)

class(rda_fungi_rhizo@sam_data$MO)<-"numeric"

#RDA Model

rda_fungi_rhizo_data<- rda_fungi_rhizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_fungi_rhizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
rda_fungi_rhizo_data
clases_rda_fungi<-as.data.frame(total_fungi@tax_table)
clases_rda_fungi


# Selecting variables and taxa

clases_rda_fungi<-as.data.frame(total_fungi@tax_table)
colnames(rda_fungi_rhizo@sam_data)[18]<-"Temperature"
colnames(rda_fungi_rhizo@sam_data)[20]<-"Light"
colnames(rda_fungi_rhizo@sam_data)[22]<-"RH"
colnames(rda_fungi_rhizo@sam_data)[24]<-"EC"

#Plot 

rda_fungi_rhizo_plot<-rda_fungi_rhizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_fungi_rhizo@sam_data)[c(18,20,22,23,24,28,35,37)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_plot(colour="Elevation",plot_taxa = clases_rda_fungi[c(-4,-9,-1,-10,-3),1],size=3,
           constraint_lab_style = constraint_lab_style(size = 5),constraint_vec_length = 4,tax_vec_length = 4,auto_caption = NA,
           tax_lab_style = tax_lab_style(size = 4.5))+
  scale_color_manual(name="Elevation",values=colores)+
  theme_biome_utils()+
  ggtitle("d. Fungal rhizosphere")+
  theme(plot.title = element_text(size=16))+
  theme(axis.title = element_text(size=16))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))
rda_fungi_rhizo_plot

