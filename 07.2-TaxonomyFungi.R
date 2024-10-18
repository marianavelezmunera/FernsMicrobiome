# Taxonomy 

#Object for the plot

fungi_rare_taxo<-fungi_rare # Copy for the analysis
View(fungi_rare_taxo@tax_table)

rownames(fungi_rare_taxo@sam_data)<-paste0(fungi_rare_taxo@sam_data$Elevation,sep="_",fungi_rare_taxo@sam_data$id)

sample_names(fungi_rare_taxo)<-paste0(fungi_rare_taxo@sam_data$Elevation,sep="_",fungi_rare_taxo@sam_data$id)

fungi_rare_taxo@sam_data$id<-paste0(fungi_rare_taxo@sam_data$Elevation,sep="_",fungi_rare_taxo@sam_data$id)

total_fungi<-microbiome::transform(aggregate_top_taxa2(subset_taxa(fungi_rare_taxo,!is.na(Class)),"Class",top=10),"compositional") #Compositional data

#Plot

total_fungi@sam_data$label<-c("2210","2210","2210","1978","1978","1978","2178","2178","2178","2007","2007","2007","2018","2018","2018","2210","2210","2210","1978","1978","1978","2178","2178","2178","2007","2007","2018","2018","2018","2210","1978","2178","2007","2018") #Labels for the plot


fungi_taxonomy_plot<-plot_composition(total_fungi,group_by = "Sample_type",sample.sort = "Elevation",x.label = "label")+
  theme_biome_utils()+
  theme(legend.position = "right")+
  scale_fill_manual(name="Class",values=moma.colors("Warhol",11))+
  ylab("Relative abundance")+
  xlab("Sample")+
  theme(axis.text = element_text(angle = 90))+
  theme(strip.text = element_text(
    size = 14))+
  theme(axis.title = element_text(size=14))+
  theme(legend.title = element_text(size=12))+
  theme(legend.text = element_text(size=12))+
  ggtitle("b. Fungi")+
  theme(plot.title = element_text(size=14))+
  geom_bar(stat = "identity",color="black")
