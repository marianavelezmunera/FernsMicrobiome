# Environment 

# Cortest variable vs elevation

# I used bacteria metadata but technically is the same because this is only environmental variables and has nothing to do with sequences

cor.test(as.numeric(metadatos_hongos[1:34,]$Altitud),metadatos_hongos[1:34,]$T_prom_jul)
cor.test(as.numeric(metadatos_hongos[1:34,]$Altitud),metadatos_hongos[1:34,]$HR_prom_jul) 
cor.test(as.numeric(metadatos_hongos[1:34,]$Altitud),metadatos_hongos[1:34,]$pH)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Luz_prom_jul)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$MO)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$N)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ptotal)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$CE)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$NO3)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Fe)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$K)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$NH4)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ctotal)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$CIC)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ca)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Mg)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Na)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$P)
cor.test(as.numeric(metadatos_hongos$Altitud),metadatos_hongos$Ctotal)

#ANOVAs per elevation

anova_tem<-aov(T_prom_jul~Altitud,data=metadatos_hongos[1:34,])
anova_HR<-aov(HR_prom_jul~Altitud,data=metadatos_hongos[1:34,])
anova_luz<-aov(Luz_prom_jul~Altitud,data=metadatos_hongos[1:34,])
anova_ph<-aov(pH~Altitud,data=metadatos_hongos[1:34,])
anova_CE<-aov(CE~Altitud,data=metadatos_hongos[1:34,])
anova_MO<-aov(MO~Altitud,data=metadatos_hongos[1:34,])
anova_N<-aov(N~Altitud,data=metadatos_hongos[1:34,])
anova_Ptotal<-aov(Ptotal~Altitud,data=metadatos_hongos[1:34,])
anova_K<-aov(K~Altitud,data=metadatos_hongos[1:34,])
anova_NO3<-aov(NO3~Altitud,data=metadatos_hongos[1:34,])
anova_NH4<-aov(NH4~Altitud,data=metadatos_hongos[1:34,])
anova_Fe<-aov(Fe~Altitud,data=metadatos_hongos[1:34,])
anova_CIC<-aov(CIC~Altitud,data=metadatos_hongos[1:34,])

#Tukey test

tukey_tem<-TukeyHSD(anova_tem)
tukey_HR<-TukeyHSD(anova_HR)
tukey_luz<-TukeyHSD(anova_luz)
tukey_ph<-TukeyHSD(anova_ph)
tukey_CE<-TukeyHSD(anova_CE)
tukey_MO<-TukeyHSD(anova_MO)
tukey_N<-TukeyHSD(anova_N)
tukey_Ptotal<-TukeyHSD(anova_Ptotal)
tukey_K<-TukeyHSD(anova_K)
tukey_NO3<-TukeyHSD(anova_NO3)
tukey_NH4<-TukeyHSD(anova_NH4)
tukey_Fe<-TukeyHSD(anova_Fe)
tukey_CIC<-TukeyHSD(anova_CIC)


#Multicomp
# To assign groups

comp_tem<-multcompLetters4(anova_tem, tukey_tem)
comp_HR<-multcompLetters4(anova_HR, tukey_HR)
comp_luz<-multcompLetters4(anova_luz, tukey_luz)
comp_ph<-multcompLetters4(anova_ph, tukey_ph)
comp_CE<-multcompLetters4(anova_CE, tukey_CE)
comp_MO<-multcompLetters4(anova_MO, tukey_MO)
comp_N<-multcompLetters4(anova_N, tukey_N)
comp_Ptotal<-multcompLetters4(anova_Ptotal, tukey_Ptotal)
comp_K<-multcompLetters4(anova_K, tukey_K)
comp_NO3<-multcompLetters4(anova_NO3, tukey_NO3)
comp_NH4<-multcompLetters4(anova_NH4, tukey_NH4)
comp_Fe<-multcompLetters4(anova_Fe, tukey_Fe)
comp_CIC<-multcompLetters4(anova_CIC, tukey_CIC)

#Data frames 

comp_tem_frame<-as.data.frame.list(comp_tem$Altitud)
comp_tem_frame$Altitud<-rownames(comp_tem_frame)
comp_HR_frame<-as.data.frame.list(comp_HR$Altitud)
comp_HR_frame$Altitud<-rownames(comp_HR_frame)
comp_luz_frame<-as.data.frame.list(comp_luz$Altitud)
comp_luz_frame$Altitud<-rownames(comp_luz_frame)
comp_ph_frame<-as.data.frame.list(comp_ph$Altitud)
comp_ph_frame$Altitud<-rownames(comp_ph_frame)
comp_CE_frame<-as.data.frame.list(comp_CE$Altitud)
comp_CE_frame$Altitud<-rownames(comp_CE_frame)
comp_MO_frame<-as.data.frame.list(comp_MO$Altitud)
comp_N_frame<-as.data.frame.list(comp_N$Altitud)
comp_N_frame$Altitud<-rownames(comp_N_frame)
comp_Ptotal_frame<-as.data.frame.list(comp_Ptotal$Altitud)
comp_Ptotal_frame$Altitud<-rownames(comp_Ptotal_frame)
comp_K_frame<-as.data.frame.list(comp_K$Altitud)
comp_K_frame$Altitud<-rownames(comp_K_frame)
comp_NO3_frame<-as.data.frame.list(comp_NO3$Altitud)
comp_NO3_frame$Altitud<-rownames(comp_NO3_frame)
comp_NH4_frame<-as.data.frame.list(comp_NH4$Altitud)
comp_NH4_frame$Altitud<-rownames(comp_NH4_frame)
comp_Fe_frame<-as.data.frame.list(comp_Fe$Altitud)
comp_Fe_frame$Altitud<-rownames(comp_Fe_frame)
comp_CIC_frame<-as.data.frame.list(comp_CIC$Altitud)

# Plots
# Theme
ggtheme_config<-list(
  theme_biome_utils(),
  xlab("Elevation"),
  scale_fill_manual(name="Elevation",values=colores),
  theme(legend.position = "none"))

# Temperature
a<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=T_prom_jul,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("Temperature (C°) *")+
  geom_text(data= comp_tem_frame,aes(x=Altitud,y=c(14.6,14.6,14.5,14.25,13.9),label=Letters))
a

# Relative humidity
b<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=HR_prom_jul,fill=Altitud))+
  geom_point(size=5,color="black",shape=21)+
  scale_fill_manual(values=colores)+
  ggtheme_config+
  ylab("Relative humidity (%) *")+
  geom_text(data= comp_HR_frame,aes(x=Altitud,y=c(99.4,99.30,99.20,99,98.4),label=Letters))

b
# Light
c<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=Luz_prom_jul,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("Light (lux)")+
  geom_text(data= comp_luz_frame,aes(x=Altitud,y=c(2400,2000,1500,1000,500),label=Letters))

c
# pH
d<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=pH,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("pH *")+
  geom_text(data= comp_ph_frame,aes(x=Altitud,y=c(4.5,4,3.9,3.7,3.85),label=Letters))
d

# Electrical conductivity
e<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=CE,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+ylab("Electrical Conductivity (dS/m)*")+
  ggtheme_config+
  geom_text(data= comp_CE_frame,aes(x=Altitud,y=c(0.16,0.08,0.12,0.1,0.075),label=Letters))
e

# N
g<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=N,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("N (%)")+
  geom_text(data= comp_N_frame,aes(x=Altitud,y=c(0.95,0.85,0.65,0.45,0.45),label=Letters))
g  

# Ptotal  
h<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=Ptotal,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+ylab("Total phosphorus (ppm) *")+
  ggtheme_config+
  geom_text(data= comp_Ptotal_frame,aes(x=Altitud,y=c(0.13,0.11,0.09,0.07,0.08),label=Letters))
  
h
# K
i<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=K,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("K (Meq/100gr)")+
  geom_text(data= comp_K_frame,aes(x=Altitud,y=c(1.6,0.85,0.65,0.7,0.45),label=Letters))
  
i
# NO3
j<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=NO3,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("NO3 (ppm)*")+
  geom_text(data= comp_NO3_frame,aes(x=Altitud,y=c(110,110,115,100,50),label=Letters))
j

# NH4
k<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=NH4,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("NH4 (ppm)")+
  geom_text(data= comp_NH4_frame,aes(x=Altitud,y=c(310,70,100,80,50),label=Letters))
k

#Fe
l<-ggplot(data = metadatos_hongos[1:34,],aes(x=Altitud,y=Fe,fill=Altitud))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+ylab("Fe (ppm) *")+
  geom_text(data= comp_Fe_frame,aes(x=Altitud,y=c(580,550,480,400,150),label=Letters))
l

# Complete plot
ambiente<-a+b+c+d+e+g+h+i+j+k+l
ambiente
