#LefSe fungi

# Phyllosphere
hongos_filo_lefse<-trans_diff$new(hongos_meco_filo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
# Keeping only genera with LDA>3
lefse_hongos_filo_genus<-hongos_filo_lefse$res_diff %>% as_tibble() %>% separate(Taxa, into = c("k","p","c","o","f","g","s"), sep="\\|",extra="merge") %>% filter(!is.na(g)) %>% filter(is.na(s)) %>% filter(LDA>=3)

# Rhizosphere
hongos_rizo_lefse<-trans_diff$new(hongos_meco_rizo,method = "lefse",group = "Altitud",alpha = 0.05,p_adjust_method = "none")
# Keeping only genera with LDA>3
lefse_hongos_rizo_genus<-hongos_rizo_lefse$res_diff %>% as_tibble() %>% separate(Taxa, into = c("k","p","c","o","f","g","s"), sep="\\|",extra="merge") %>% filter(!is.na(g)) %>% filter(is.na(s)) %>% filter(LDA>=3)


