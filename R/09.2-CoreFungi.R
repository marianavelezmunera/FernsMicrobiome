# Core microbiome

# Phyllosphere per elevation

#Petal diagram
fungi_meco_phyllo<-phyloseq2meco(fungi_phyllosphere)
fungi_meco_phyllo$tidy_dataset()
venn_fungi_phyllo_data<-fungi_meco_phyllo$merge_taxa(taxa="Genus")
venn_fungi_phyllo_data<-venn_fungi_phyllo_data$merge_samples(use_group = "Elevation")

mode(venn_fungi_phyllo_data$sample_table$SampleID)<-"numeric"

venn_fungi_phyllo_data$sample_table <- arrange(venn_fungi_phyllo_data$sample_table, SampleID)

venn_fungi_phyllo_core<-trans_venn$new(venn_fungi_phyllo_data,ratio = NULL)
venn_fungi_phyllo_plot<-venn_fungi_phyllo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)

# Shared ASV table

shared_fungi_phyllo<-venn_fungi_phyllo_core$data_details$`1978&2007&2018&2178&2210` 

venn_fungi_phyllo_core$tax_table$asv<-rownames(venn_fungi_phyllo_core$tax_table)
identidad_fungi_phyllo<-subset(venn_fungi_phyllo_core$tax_table,asv%in%shared_fungi_phyllo)

otus_fungi_phyllo_core<-venn_fungi_phyllo_core$otu_table
otus_fungi_phyllo_core$asv<-rownames(otus_fungi_phyllo_core)

otus_fungi_phyllo_core<-subset(otus_fungi_phyllo_core,asv%in%shared_fungi_phyllo)

abundances_fungi_phyllo_core<-merge(otus_fungi_phyllo_core,venn_fungi_phyllo_core$tax_table,by='row.names')

View(abundances_fungi_phyllo_core)

abundances_fungi_phyllo_core<-abundances_fungi_phyllo_core[,c(1:6,13)]
abundances_fungi_phyllo_core$total<-rowSums(abundances_fungi_phyllo_core[2:6])
abundances_fungi_phyllo_core<-arrange(abundances_fungi_phyllo_core,total)
abundances_fungi_phyllo_core<-subset(abundances_fungi_phyllo_core,Genus!="g__")


View(abundances_fungi_phyllo_core)

#Rhizosphere per elevation

fungi_meco_rhizo<-phyloseq2meco(fungi_rhizosphere)
fungi_meco_rhizo$tidy_dataset()
venn_fungi_rhizo_data<-fungi_meco_rhizo$merge_taxa(taxa="Genus")
venn_fungi_rhizo_data<-venn_fungi_rhizo_data$merge_samples(use_group = "Elevation")
mode(venn_fungi_rhizo_data$sample_table$SampleID)<-"numeric"
venn_fungi_rhizo_data$sample_table <- arrange(venn_fungi_rhizo_data$sample_table, SampleID)
venn_fungi_rhizo_data
venn_fungi_rhizo_core<-trans_venn$new(venn_fungi_rhizo_data,ratio = NULL)

#Petal plot

venn_fungi_rhizo_plot<-venn_fungi_rhizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)

shared_fungi_rhizo<-venn_fungi_rhizo_core$data_details$`1978&2007&2018&2178&2210` 

venn_fungi_rhizo_core$tax_table$asv<-rownames(venn_fungi_rhizo_core$tax_table)
identidad_fungi_rhizo<-subset(venn_fungi_rhizo_core$tax_table,asv%in%shared_fungi_rhizo)

otus_fungi_rhizo_core<-venn_fungi_rhizo_core$otu_table
otus_fungi_rhizo_core$asv<-rownames(otus_fungi_rhizo_core)

otus_fungi_rhizo_core<-subset(otus_fungi_rhizo_core,asv%in%shared_fungi_rhizo)

abundances_fungi_rhizo_core<-merge(otus_fungi_rhizo_core,venn_fungi_rhizo_core$tax_table,by='row.names')

View(abundances_fungi_rhizo_core)

abundances_fungi_rhizo_core<-abundances_fungi_rhizo_core[,c(1:6,13)]
abundances_fungi_rhizo_core$total<-rowSums(abundances_fungi_rhizo_core[2:6])
abundances_fungi_rhizo_core<-arrange(abundances_fungi_rhizo_core,total)
abundances_fungi_rhizo_core1<-subset(abundances_fungi_rhizo_core,Genus!="g__")


View(abundances_fungi_rhizo_core1)

#Core by sample type

fungi_meco<-phyloseq2meco(fungi_rare) 

venn_fungi_genus_data<-fungi_meco$merge_taxa(taxa="Genus")
venn_fungi_genus_data<-venn_fungi_genus_data$merge_samples(use_group = "Sample_type")
venn_fungi_genus<-trans_venn$new(venn_fungi_genus_data,ratio = NULL)
venn_fungi_genus_plot<-venn_fungi_genus$plot_venn(color_circle = c(colores[1],colores[3],colores[5]), linesize = 2)
venn_fungi_genus_plot

# Table ASV shared by sample type

otus_fungi_core<-venn_fungi_genus$otu_table
otus_fungi_core$asv<-rownames(otus_fungi_core)

otus_fungi_core<-subset(otus_fungi_core,asv%in%shared_elevation_fungi)

abundances_fungi_core<-merge(otus_fungi_core,venn_fungi_genus$tax_table,by='row.names')

unique(abundances_fungi_core$Genus)

abundances_fungi_core<-abundances_fungi_core[,c(1:4,11)]
abundances_fungi_core$total<-rowSums(abundances_fungi_core[2:4])
abundances_fungi_core<-arrange(abundances_fungi_core,total)
abundances_fungi_core<-subset(abundances_fungi_core,Genus!="g__")
abundances_fungi_core
