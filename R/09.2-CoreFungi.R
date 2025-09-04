# Core microbiome

# Phyllosphere per elevation

#Petal diagram
hongos_meco_filo<-phyloseq2meco(hongos_filosfera)
hongos_meco_filo$tidy_dataset()
venn_hongos_filo_datos<-hongos_meco_filo$merge_taxa(taxa="Genus")
venn_hongos_filo_datos<-venn_hongos_filo_datos$merge_samples("Altitud")
mode(venn_hongos_filo_datos$sample_table$SampleID)<-"numeric"
venn_hongos_filo_datos$sample_table <- arrange(venn_hongos_filo_datos$sample_table, SampleID)
venn_hongos_filo_datos
venn_hongos_filo_core<-trans_venn$new(venn_hongos_filo_datos,ratio = NULL)
venn_hongos_filo_plot<-venn_hongos_filo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)
venn_hongos_filo_plot


# Shared ASV table

compartido_hongos_filo<-venn_hongos_filo_core$data_details$`1978&2007&2018&2178&2210` 

venn_hongos_filo_core$tax_table$asv<-rownames(venn_hongos_filo_core$tax_table)
identidad_hongos_filo<-subset(venn_hongos_filo_core$tax_table,asv%in%compartido_hongos_filo)

otus_hongos_filo_core<-venn_hongos_filo_core$otu_table
otus_hongos_filo_core$asv<-rownames(otus_hongos_filo_core)

otus_hongos_filo_core<-subset(otus_hongos_filo_core,asv%in%compartido_hongos_filo)

abundancias_hongos_filo_core<-merge(otus_hongos_filo_core,venn_hongos_filo_core$tax_table,by='row.names')

View(abundancias_hongos_filo_core)

abundancias_hongos_filo_core<-abundancias_hongos_filo_core[,c(1:6,13)]
abundancias_hongos_filo_core$total<-rowSums(abundancias_hongos_filo_core[2:6])
abundancias_hongos_filo_core<-arrange(abundancias_hongos_filo_core,total)
abundancias_hongos_filo_core1<-subset(abundancias_hongos_filo_core,Genus!="g__")


View(abundancias_hongos_filo_core1)

#Rhizosphere per elevation

hongos_meco_rizo<-phyloseq2meco(hongos_rizosfera)
hongos_meco_rizo$tidy_dataset()
venn_hongos_rizo_datos<-hongos_meco_rizo$merge_taxa(taxa="Genus")
venn_hongos_rizo_datos<-venn_hongos_rizo_datos$merge_samples("Altitud")
mode(venn_hongos_rizo_datos$sample_table$SampleID)<-"numeric"
venn_hongos_rizo_datos$sample_table <- arrange(venn_hongos_rizo_datos$sample_table, SampleID)
venn_hongos_rizo_datos
venn_hongos_rizo_core<-trans_venn$new(venn_hongos_rizo_datos,ratio = NULL)

#Petal plot

venn_hongos_rizo_plot<-venn_hongos_rizo_core$plot_venn(petal_plot = TRUE, petal_center_size = 50, petal_r = 1.5, petal_a = 3, petal_move_xy = 5, petal_color_center = moma.colors("Warhol",15)[4],petal_color = colores)
ggsave("core_rizo_hongos.svg",venn_hongos_rizo_plot,device = "svg")
venn_hongos_rizo_core$data_summary %>% .[.[, 1] > 20, ]

# Shared by elevations

compartido_hongos_rizo<-venn_hongos_rizo_core$data_details$`1978&2007&2018&2178&2210` 

venn_hongos_rizo_core$tax_table$asv<-rownames(venn_hongos_rizo_core$tax_table)
identidad_hongos_rizo<-subset(venn_hongos_rizo_core$tax_table,asv%in%compartido_hongos_rizo)

otus_hongos_rizo_core<-venn_hongos_rizo_core$otu_table
otus_hongos_rizo_core$asv<-rownames(otus_hongos_rizo_core)

otus_hongos_rizo_core<-subset(otus_hongos_rizo_core,asv%in%compartido_hongos_rizo)

abundancias_hongos_rizo_core<-merge(otus_hongos_rizo_core,venn_hongos_rizo_core$tax_table,by='row.names')

View(abundancias_hongos_rizo_core)

abundancias_hongos_rizo_core<-abundancias_hongos_rizo_core[,c(1:6,13)]
abundancias_hongos_rizo_core$total<-rowSums(abundancias_hongos_rizo_core[2:6])
abundancias_hongos_rizo_core<-arrange(abundancias_hongos_rizo_core,total)
abundancias_hongos_rizo_core1<-subset(abundancias_hongos_rizo_core,Genus!="g__")

abundacias_hongos_rizo_core
View(identidad_hongos_rizo)

#Core by sample type

hongos_meco<-phyloseq2meco(hongos_rare) 

venn_hongos_genus_datos<-hongos_meco$merge_taxa(taxa="Genus")
venn_hongos_genus_datos<-venn_hongos_genus_datos$merge_samples("Tipo_muestra")
venn_hongos_genus<-trans_venn$new(venn_hongos_genus_datos,ratio = NULL)
venn_hongos_genus_plot<-venn_hongos_genus$plot_venn(color_circle = c(colores[1],colores[3],colores[5]), linesize = 2)
venn_hongos_genus_plot

# Table ASV shared by sample type

otus_hongos_core<-venn_hongos_genus$otu_table
otus_hongos_core$asv<-rownames(otus_hongos_core)

otus_hongos_core<-subset(otus_hongos_core,asv%in%compartido_elevation_hongos)

abundancias_hongos_core<-merge(otus_hongos_core,venn_hongos_genus$tax_table,by='row.names')

unique(abundancias_hongos_core$Genus)

abundancias_hongos_core<-abundancias_hongos_core[,c(1:6,13)]
abundancias_hongos_core$total<-rowSums(abundancias_hongos_core[2:6])
abundancias_hongos_core<-arrange(abundancias_hongos_core,total)
abundancias_hongos_core1<-subset(abundancias_hongos_core,Genus!="g__")
abundancias_hongos_core1
