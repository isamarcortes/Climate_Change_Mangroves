library("readxl")
library("ggplot2")
library("writexl")
library("hyfo")


########Hydraulic Conductivity Stuff
HydroCond <- read_excel("/Users/isamarcortes/Dropbox/Isamar/Data/Hydraulic Conductivity.xlsx",sheet=1)
Literature_Hydro <- read_excel("/Users/isamarcortes/Dropbox/Isamar/Data/Hydraulic Conductivity.xlsx",sheet=2)


ggplot(HydroCond)+
  geom_boxplot(aes(x=Place,y=(HydroCond/365)))+
  geom_line(aes(x=Place,y=(HydroCond/365)))+
  geom_boxplot(data = Literature_Hydro,aes(x=Place,y=DispersionCoefficient))+
  geom_line(data = Literature_Hydro,aes(x=Place,y=DispersionCoefficient))+
  scale_y_continuous(trans='log10')+
  ylab('Log of Dispersion Coefficient m^2/ day')+
  xlab('Region')+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        axis.text.x = element_text(angle = 90))


ggsave("/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/Figures/Dispersion_Updated.svg",plot = last_plot(),device = "svg", units="in", width=5, height=4, dpi=600)

