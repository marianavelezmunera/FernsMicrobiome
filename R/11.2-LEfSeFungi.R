#LefSe fungi

#phyllo


fungi_phyllo_lefse<-trans_diff$new(fungi_meco_phyllo,method = "lefse",group = "Elevation",alpha = 0.05,p_adjust_method = "none")


lefse_plot_fungi_phyllo <-fungi_phyllo_lefse$plot_diff_bar(group_order = c("1978", "2007", "2018","2178","2210"),color_values = colores,threshold = 3)

lefse_plot_fungi_phyllo<-lefse_plot_fungi_phyllo+
  geom_bar(color="black",stat = "identity")+
  ggtitle("c. Fungal phyllosphere")+
  theme(legend.position = "none")


# rhizo

fungi_rhizo_lefse<-trans_diff$new(fungi_meco_rhizo,method = "lefse",group = "Elevation",alpha = 0.05,p_adjust_method = "none")

lefse_plot_fungi_rhizo<-fungi_rhizo_lefse$plot_diff_bar(group_order = c("1978", "2007", "2018","2178","2210"),color_values = c(colores[1],colores[2],colores[4],colores[3],colores[5]),threshold = 3)

lefse_plot_fungi_rhizo
lefse_plot_fungi_rhizo<-lefse_plot_fungi_rhizo+
  ggtitle("d. Fungal rhizosphere")+
  theme(legend.position = "none")+
  geom_bar(color="black",stat = "identity")





