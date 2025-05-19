# Data 

# Upload phylloseq

hongos<-qza_to_phyloseq(features = "TablaDADA2HongosForward.qza",
                        tree="ArbolRootedHongos.qza",taxonomy = "TaxonomiaHongos.qza")
metadatos_hongos <- read_delim("metadatos_hongos.txt", 
                               delim = "\t", escape_double = FALSE, 
                               trim_ws = TRUE)

# Data format
metadatos_hongos<-as.data.frame(metadatos_hongos)
rownames(metadatos_hongos)<-metadatos_hongos$id

metadatos_hongos$Parcela<-as.character(metadatos_hongos$Parcela)
metadatos_hongos$Altitud<-as.character(metadatos_hongos$Altitud)

# Missing data replace by predicted data and variables name change
metadatos_hongos[3,25]<-10
colnames(metadatos_hongos)[25]<-"MO"
metadatos_hongos[22,25]<-9
colnames(metadatos_hongos)[35]<-"NO3"
colnames(metadatos_hongos)[36]<-"NH4"
sample_data(hongos)<-metadatos_hongos

# R objects for ASV table and taxonomy

ASV_hongos<-as.data.frame(otu_table(hongos))
taxonomy_hongos<-as.data.frame(tax_table(hongos))

# Filters
unique(taxonomy$Phylum)
unique(taxonomy$Kingdom)

# Replace "Fungi_phy_Incertae_sedis" for NA

hongos@tax_table[hongos@tax_table=="Fungi_phy_Incertae_sedis"]<-NA


# Subset without control samples

hongos_bien<-subset_samples(hongos,ID_individuo!="Control")
