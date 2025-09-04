# Taxonomy
# Data
hongos_rare_taxo<-hongos_rare
View(hongos_rare_taxo@tax_table)
hongos_rare_taxo@tax_table[hongos_rare_taxo@tax_table=="Rozellomycota_cls_Incertae_sedis"]<-NA
rownames(hongos_rare_taxo@sam_data)<-paste0(hongos_rare_taxo@sam_data$Altitud,sep="_",hongos_rare_taxo@sam_data$id)
sample_names(hongos_rare_taxo)<-paste0(hongos_rare_taxo@sam_data$Altitud,sep="_",hongos_rare_taxo@sam_data$id)
hongos_rare_taxo@sam_data$id<-paste0(hongos_rare_taxo@sam_data$Altitud,sep="_",hongos_rare_taxo@sam_data$id)

# As compositional
# By Class
total_hongos<-microbiome::transform(aggregate_top_taxa2(subset_taxa(hongos_rare_taxo,!is.na(Class)),"Class",top=10),"compositional")
# By Phylum
filos_hongos<-microbiome::transform(aggregate_top_taxa2(subset_taxa(hongos_rare_taxo,!is.na(Phylum)),"Phylum",top=10),"compositional")
