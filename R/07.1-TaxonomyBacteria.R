# Taxonomy 

## Data 

bacterias_rare_taxo<-bacterias_rare
rownames(bacterias_rare_taxo@sam_data)<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)
sample_names(bacterias_rare_taxo)<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)
bacterias_rare_taxo@sam_data$id<-paste0(bacterias_rare_taxo@sam_data$Altitud,sep="_",bacterias_rare_taxo@sam_data$id)

# As compositional
# By Class
total_bacterias<-microbiome::transform(aggregate_top_taxa2(subset_taxa(bacterias_rare_taxo,!is.na(Class)),"Class",top=10),"compositional")

# By Phylum
filos_bacterias<-microbiome::transform(aggregate_top_taxa2(subset_taxa(bacterias_rare_taxo,!is.na(Phylum)),"Phylum",top=10),"compositional")
filos_bacterias@otu_table
