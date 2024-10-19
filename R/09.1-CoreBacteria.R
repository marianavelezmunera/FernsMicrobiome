# Core microbiome

# Phyllosphere per elevation

#Petal diagram
bacteria_meco_phyllo<-phyloseq2meco(bacteria_phyllosphere)
bacteria_meco_phyllo$tidy_dataset()
venn_bacteria_phyllo_data<-bacteria_meco_phyllo$merge_taxa(taxa="Genus")
venn_bacteria_phyllo_data<-venn_bacteria_phyllo_data$merge_samples(use_group = "Elevation")

mode(venn_bacteria_phyllo_data$sample_table$SampleID)<-"numeric"

venn_bacteria_phyllo_data$sample_table <- arrange(venn_bacteria_phyllo_data$sample_table, SampleID)

venn_bacteria_phyllo_core<-trans_venn$new(venn_bacteria_phyllo_data,ratio = NULL)
venn_bacteria_phyllo_plot<-venn_bacteria_phyllo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)

# Shared ASV table

shared_bacteria_phyllo<-venn_bacteria_phyllo_core$data_details$`1978&2007&2018&2178&2210` 

venn_bacteria_phyllo_core$tax_table$asv<-rownames(venn_bacteria_phyllo_core$tax_table)
identidad_bacteria_phyllo<-subset(venn_bacteria_phyllo_core$tax_table,asv%in%shared_bacteria_phyllo)

otus_bacteria_phyllo_core<-venn_bacteria_phyllo_core$otu_table
otus_bacteria_phyllo_core$asv<-rownames(otus_bacteria_phyllo_core)

otus_bacteria_phyllo_core<-subset(otus_bacteria_phyllo_core,asv%in%shared_bacteria_phyllo)

abundances_bacteria_phyllo_core<-merge(otus_bacteria_phyllo_core,venn_bacteria_phyllo_core$tax_table,by='row.names')

View(abundances_bacteria_phyllo_core)

abundances_bacteria_phyllo_core<-abundances_bacteria_phyllo_core[,c(1:6,13)]
abundances_bacteria_phyllo_core$total<-rowSums(abundances_bacteria_phyllo_core[2:6])
abundances_bacteria_phyllo_core<-arrange(abundances_bacteria_phyllo_core,total)
abundances_bacteria_phyllo_core<-subset(abundances_bacteria_phyllo_core,Genus!="g__")


View(abundances_bacteria_phyllo_core)

#Rhizosphere per elevation

bacteria_meco_rhizo<-phyloseq2meco(bacteria_rhizosphere)
bacteria_meco_rhizo$tidy_dataset()
venn_bacteria_rhizo_data<-bacteria_meco_rhizo$merge_taxa(taxa="Genus")
venn_bacteria_rhizo_data<-venn_bacteria_rhizo_data$merge_samples(use_group = "Elevation")
mode(venn_bacteria_rhizo_data$sample_table$SampleID)<-"numeric"
venn_bacteria_rhizo_data$sample_table <- arrange(venn_bacteria_rhizo_data$sample_table, SampleID)
venn_bacteria_rhizo_data
venn_bacteria_rhizo_core<-trans_venn$new(venn_bacteria_rhizo_data,ratio = NULL)

#Petal plot

venn_bacteria_rhizo_plot<-venn_bacteria_rhizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)


shared_bacteria_rhizo<-venn_bacteria_rhizo_core$data_details$`1978&2007&2018&2178&2210` 

venn_bacteria_rhizo_core$tax_table$asv<-rownames(venn_bacteria_rhizo_core$tax_table)
identidad_bacteria_rhizo<-subset(venn_bacteria_rhizo_core$tax_table,asv%in%shared_bacteria_rhizo)

otus_bacteria_rhizo_core<-venn_bacteria_rhizo_core$otu_table
otus_bacteria_rhizo_core$asv<-rownames(otus_bacteria_rhizo_core)

otus_bacteria_rhizo_core<-subset(otus_bacteria_rhizo_core,asv%in%shared_bacteria_rhizo)

abundances_bacteria_rhizo_core<-merge(otus_bacteria_rhizo_core,venn_bacteria_rhizo_core$tax_table,by='row.names')


abundances_bacteria_rhizo_core<-abundances_bacteria_rhizo_core[,c(1:6,13)]
abundances_bacteria_rhizo_core$total<-rowSums(abundances_bacteria_rhizo_core[2:6])
abundances_bacteria_rhizo_core<-arrange(abundances_bacteria_rhizo_core,total)
abundances_bacteria_rhizo_core<-subset(abundances_bacteria_rhizo_core,Genus!="g__")


#Core by sample type

bacteria_meco<-phyloseq2meco(bacteria_rare) 

venn_bacteria_genus_data<-bacteria_meco$merge_taxa(taxa="Genus")
venn_bacteria_genus_data<-venn_bacteria_genus_data$merge_samples(use_group = "Sample_type")
venn_bacteria_genus<-trans_venn$new(venn_bacteria_genus_data,ratio = NULL)
venn_bacteria_genus_plot<-venn_bacteria_genus$plot_venn(color_circle = c(colores[1],colores[3],colores[5]), linesize = 2)
venn_bacteria_genus_plot

# Table ASV shared by sample type

otus_bacteria_core<-venn_bacteria_genus$otu_table
otus_bacteria_core$asv<-rownames(otus_bacteria_core)

otus_bacteria_core<-subset(otus_bacteria_core,asv%in%shared_elevation_bacteria)

abundances_bacteria_core<-merge(otus_bacteria_core,venn_bacteria_genus$tax_table,by='row.names')

unique(abundances_bacteria_core$Genus)

abundances_bacteria_core<-abundances_bacteria_core[,c(1:4,11)]
abundances_bacteria_core$total<-rowSums(abundances_bacteria_core[2:4])
abundances_bacteria_core<-arrange(abundances_bacteria_core,total)
abundances_bacteria_core<-subset(abundances_bacteria_core,Genus!="g__")
View(abundances_bacteria_core)
