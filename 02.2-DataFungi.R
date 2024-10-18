# Data 

# Upload phyloseq from QIIME2 artifact

fungi<-qza_to_phyloseq(features = "TableDADA2Fungi.qza",
                        tree="RootedTreeFungi.qza",taxonomy = "TaxonomyFungi.qza")
metadata_fungi <- read_excel("metadata_fungi.xlsx")
# Data format

metadata_fungi<-as.data.frame(metadata_fungi)
colnames(metadata_fungi)[1]<-"id"
rownames(metadata_fungi)<-metadata_fungi$id

metadata_fungi$Plot<-as.character(metadata_fungi$Plot)
metadata_fungi$Elevation<-as.character(metadata_fungi$Elevation)
metadata_fungi<-metadata_fungi[,-c(5:7,9,21:25)]

# Missing data replace by predicted data and variables name change
metadata_fungi[3,25]<-10
colnames(metadata_fungi)[25]<-"MO"
metadata_fungi[22,25]<-9
colnames(metadata_fungi)[35]<-"NO3"
colnames(metadata_fungi)[36]<-"NH4"
metadata_fungi<-subset(metadata_fungi,ID_individual!="Control")
metadata_fungi<-subset(metadata_fungi,id!="HR4B")
sample_data(fungi)<-metadata_fungi

# R objects for ASV table and taxonomy

ASV_fungi<-as.data.frame(otu_table(fungi))
taxonomy_fungi<-as.data.frame(tax_table(fungi))

# Filters
unique(taxonomy$Phylum)
unique(taxonomy$Kingdom)


# Subset without control samples

fungi_ok<-subset_samples(fungi,ID_individual!="Control")
sample_names(fungi_ok)
