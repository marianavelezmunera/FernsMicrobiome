# Phyllosphere
# Data
rda_hongos_filo <- tax_fix(hongos_filosfera)
rda_hongos_filo <- phyloseq_validate(rda_hongos_filo, remove_undetected = TRUE)


class(rda_hongos_filo@sam_data$MO)<-"numeric"

#RDA Model with all variables
rda_hongos_filo_data<- rda_hongos_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_filo@sam_data)[c(18,20,22,23,24,28,35,37,38)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()

# Taxa
clases_rda_hongos<-as.data.frame(total_hongos@tax_table)
clases_rda_hongos
rda_hongos@sam_data$Altitud_num<-as.numeric(rda_hongos@sam_data$Altitud)
View(rda_hongos@sam_data)
clases_rda_hongos<-as.data.frame(total_hongos@tax_table)

# Ordistep for variable selection
ordistep(rda_hongos_filo_data,perm.max=200)

# RDA reduced model
rda_hongos_filo_data<- rda_hongos_bodysize_filo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_filo@sam_data)[c(18,20,22,37,38)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
# ANOVA to check significance
anova.cca(rda_hongos_filo_data)

# Rhizosphere 
# Data
rda_hongos_rizo <- tax_fix(hongos_rizosfera)
rda_hongos_rizo <- phyloseq_validate(rda_hongos_rizo, remove_undetected = TRUE)
class(rda_hongos_rizo@sam_data$MO)<-"numeric"

#RDA Model with all variables
rda_hongos_rizo_data<- rda_hongos_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_rizo@sam_data)[c(18,20,22,23,24,28,35,37,38)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()

# Taxa
clases_rda_hongos<-as.data.frame(total_hongos@tax_table)
clases_rda_hongos
rda_hongos@sam_data$Altitud_num<-as.numeric(rda_hongos@sam_data$Altitud)
View(rda_hongos@sam_data)
clases_rda_hongos<-as.data.frame(total_hongos@tax_table)

# Ordistep for variable selection
ordistep(rda_hongos_filo_data,perm.max=200)

# RDA reduced model
rda_hongos_rizo_data<- rda_hongos_rizo %>%
  tax_transform("clr", rank = "Class") %>%
  ord_calc(
    constraints = colnames(rda_hongos_rizo@sam_data)[c(23,22,28)],method = "RDA",
    scale_cc = FALSE) %>% 
  ord_get()
# ANOVA to check significance
anova.cca(rda_hongos_rizo_data)
