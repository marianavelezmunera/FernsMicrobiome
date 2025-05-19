# Data 

# Upload phylloseq

bacterias<-qza_to_phyloseq(features = "TablaDADA2Bacterias.qza",tree="ArbolRootedBacterias.qza",taxonomy = "TaxonomiaBacterias.qza")
metadatos_bacterias <- read_excel("metadatos_bacterias_completos.xlsx")
View(metadatos_bacterias)


# Data format
metadatos_bacterias<-as.data.frame(metadatos_bacterias)
colnames(metadatos_bacterias)[1]<-"id"
rownames(metadatos_bacterias)<-metadatos_bacterias$id

metadatos_bacterias$Parcela<-as.character(metadatos_bacterias$Parcela)
metadatos_bacterias$Altitud<-as.character(metadatos_bacterias$Altitud)

metadatos_bacterias<-metadatos_bacterias[,-c(5:7,9,21:25)]

# Missing data replace by predicted data and variables name change
metadatos_bacterias[3,25]<-10
colnames(metadatos_bacterias)[25]<-"MO"
metadatos_bacterias[22,25]<-9
colnames(metadatos_bacterias)[35]<-"NO3"
colnames(metadatos_bacterias)[36]<-"NH4"

metadatos_bacterias<-subset(metadatos_bacterias,id!="BF5A")
metadatos_bacterias<-subset(metadatos_bacterias,id!="BF5C")
sample_data(bacterias)<-metadatos_bacterias


# R objects for ASV table and taxonomy

ASV_bacterias<-as.data.frame(otu_table(bacterias))
taxonomy_bacterias<-as.data.frame(tax_table(bacterias))

# Subset without control samples

bacterias_bien<-subset_samples(bacterias,ID_individuo!="Control")

bacterias_bien<-subset_samples(bacterias,id!="BF5A")
bacterias_bien<-subset_samples(bacterias,id!="BF5C")
