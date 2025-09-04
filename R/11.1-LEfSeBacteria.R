#LefSe bacteria

#Phyllosphere

bacterias_filo_lefse<-trans_diff$new(bacterias_meco_filo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
# Only keeping genera with LDA>3
lefse_bacterias_filo_genus<-bacterias_filo_lefse$res_diff %>% as_tibble() %>% separate(Taxa, into = c("k","p","c","o","f","g","s"), sep="\\|",extra="merge") %>% filter(!is.na(g)) %>% filter(is.na(s)) %>% filter(LDA>=3)

# Rhizosphere

bacterias_rizo_lefse<-trans_diff$new(bacterias_meco_rizo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
# Only keeping genera with LDA>3
lefse_bacterias_rizo_genus<-bacterias_rizo_lefse$res_diff %>% as_tibble() %>% separate(Taxa, into = c("k","p","c","o","f","g","s"), sep="\\|",extra="merge") %>% filter(!is.na(g)) %>% filter(is.na(s)) %>% filter(LDA>=3)
