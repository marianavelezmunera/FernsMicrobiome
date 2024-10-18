# Data 

# Upload phylloseq

bacteria<-qza_to_phyloseq(features = "TableDADA2Bacteria.qza",tree="RootedTreeBacteria.qza",taxonomy = "TaxonomyBacteria.qza")
metadata_bacteria <- read_excel("metadata_bacteria.xlsx")
View(metadata_bacteria)


# Data format
metadata_bacteria<-as.data.frame(metadata_bacteria)
colnames(metadata_bacteria)[1]<-"id"
rownames(metadata_bacteria)<-metadata_bacteria$id

metadata_bacteria$Plot<-as.character(metadata_bacteria$Plot)
metadata_bacteria$Elevation<-as.character(metadata_bacteria$Elevation)

metadata_bacteria<-metadata_bacteria[,-c(5:7,9,21:25)]
metadata_bacteria<-subset(metadata_bacteria,ID_individual!="Control")
# Missing data replace by predicted data

metadata_bacteria[3,25]<-10
metadata_bacteria[22,25]<-9
mode(metadata_bacteria$MO)<-"numeric"

# Deleting data for missing sequences (Bacterial phyllosphere for 2018 plot)

metadata_bacteria<-subset(metadata_bacteria,id!="BF5A")
metadata_bacteria<-subset(metadata_bacteria,id!="BF5C")
sample_data(bacteria)<-metadata_bacteria


# R objects for ASV table and taxonomy

ASV_bacteria<-as.data.frame(otu_table(bacteria))
taxonomy_bacteria<-as.data.frame(tax_table(bacteria))


# Subset without control samples and missing sequences

bacteria_ok<-subset_samples(bacteria,ID_individual!="Control")

sample_names(bacteria_ok)
