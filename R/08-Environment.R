# Cortest variable vs elevation

# I used bacteria metadata but technically is the same because this is only environmental variables and has nothing to do with sequences

cor.test(as.numeric(metadata_bacteria[1:33,]$Elevation),metadata_bacteria[1:33,]$T_jul)

cor.test(as.numeric(metadata_bacteria[1:33,]$Elevation),metadata_bacteria[1:33,]$RH_jul) 
cor.test(as.numeric(metadata_bacteria[1:33,]$Elevation),metadata_bacteria[1:33,]$pH)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Light_jul)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$MO)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$N)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Ptotal)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$EC)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$NO3)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Fe)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$K)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$NH4)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Ctotal)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$CIC)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Ca)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Mg)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Na)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$P)
cor.test(as.numeric(metadata_bacteria$Elevation),metadata_bacteria$Ctotal)

#ANOVAs per elevation

summary(aov(T_jul~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(RH_jul~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(Light_jul~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(pH~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(EC~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(MO~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(N~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(Ptotal~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(K~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(NO3~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(NH4~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(Fe~Elevation,data=metadata_bacteria[1:33,]))
summary(aov(CIC~Elevation,data=metadata_bacteria[1:33,]))

# Plots

# Theme configuration

ggtheme_config<-list(
  theme_biome_utils(),
  xlab("Elevation"),
  scale_fill_manual(name="Elevation",values=colores),
  theme(legend.position = "none"))

# Plots

a<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=T_jul,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("Temperature (C°) *")
a
b<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=RH_jul,fill=Elevation))+
  geom_point(size=5,color="black",shape=21)+
  scale_fill_manual(values=colores)+
  ggtheme_config+
  ylab("Relative humidity (%) *")
b
c<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=Light_jul,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("Light (lux)")
d<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=pH,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("pH *")
e<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=EC,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+ylab("Electrical Conductivity *")+
  ggtheme_config

g<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=N,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
h<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=Ptotal,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+ylab("Total phosphorus *")+
  ggtheme_config
i<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=K,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
j<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=NO3,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+
  ylab("NO3*")
k<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=NH4,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config
l<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=Fe,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+ylab("Fe *")
m<-ggplot(data = metadata_bacteria[1:33,],aes(x=Elevation,y=MO,fill=Elevation))+
  geom_boxplot(color="black",linewidth=0.25,outlier.size = 0.25)+
  ggtheme_config+ylab("MO")

environment_plot<-a+b+c+d+e+g+h+i+j+k+l+m
environment_plot
