#Set working directory
setwd("~/Documents/R-Studio/Data/2024")

#Load packages 
install.packages("ggplot2")
install.packages("ggpattern")
install.packages("glmmTMB")
library(ggplot2)
library(ggpattern)
library(glmmTMB)


#Create figures
#Loading in figure data
graph1 <-read.csv("AV_Bur_All_2023-2024.csv", header = TRUE)
graph2 <-read.csv("Burd_Bar_2024_2023.csv", header = TRUE) 
graph3 <-read.csv("BACI_DON.csv", header = TRUE)
graph4 <-read.csv("AV_Bur_DVP.csv", header = TRUE)



#Boxplot: Mean tick burden by treatment type 2023 & 2024
ggplot(graph1, aes(x=Treatment, y=Average_Bur, fill=Treatment)) +
  geom_boxplot() +
  xlab("") + ylab("Mean tick burden") +
  facet_wrap(~Year) +
  theme_minimal() +
  ylim(0,8) +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(color = "black"),  
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1, size = 8),
        legend.position = "none",
        panel.border = element_blank()) 



#Barplot: Mean attached tick burdens between treatment types and year combined
#Use for host species common names
species_labels <- c("NEFU" = "Dusky-footed Woodrat",
                   "PECA" = "California deer mouse",
                   "PESO" = "Western deer mouse",
                   "PETR" = "Pinyon mouse")

#Use for scientifically abbreviated host species names
Species <- graph2$Species

#Creating discrete columns for year and treatment types 
if(!"YearTreatment" %in% colnames(graph2)) {
  graph2$YearTreatment <- c("2024.Acaricide", "2024.Control", "2024.Acaricide", "2024.Control", 
                           "2024.Acaricide", "2024.Control", "2024.Acaricide", "2024.Control", 
                           "2023.Acaricide", "2023.Control", "2023.Acaricide", "2023.Control", 
                           "2023.Acaricide", "2023.Control", "2023.Acaricide", "2023.Control")}

#Creating factors for each year and treatment type
graph2$YearTreatment <- factor(graph2$YearTreatment, levels = c("2023.Control", "2024.Control", "2023.Acaricide", "2024.Acaricide"))

#Setting pattern for the year
graph2$Pattern <- ifelse(graph2$YearTreatment %in% c("2024.Acaricide", "2024.Control"), "stripe", "none")

#Setting custom colors for treatment type
custom_colors <- c("2023.Control" = "#00BFC4", "2024.Control" = "#00BFC4",
                   "2023.Acaricide" = "#F8766D", "2024.Acaricide" = "#F8766D")

#Plotting
ggplot(graph2, aes(y=Mean, x=Species, fill=YearTreatment, pattern=Pattern)) +
  xlab("") + ylab("Mean tick burden") +
  theme_minimal() +
  geom_bar_pattern(position=position_dodge(width=0.95), stat="identity", color="black", 
        pattern_fill="black",
        pattern_angle=45,
        pattern_density=0.1,
        pattern_spacing=0.025,
        pattern_key_scale_factor=0.6) +
  geom_errorbar(aes(ymin=pmax(0, Mean - SE), ymax=Mean+SE), 
        width=0.2, position=position_dodge(width=0.9)) +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(color = "black"), 
        axis.text.x = element_text(angle = 45, vjust = 0.8, hjust = 0.8, size = 8,),
        legend.position = "right",
        panel.border = element_blank()) +
  scale_fill_manual(values = custom_colors,
        labels = c("2023.Control" = "2023 Control", 
                   "2023.Acaricide" = "2023 Acaricide", 
                   "2024.Control" = "2024 Control", 
                   "2024.Acaricide" = "2024 Acaricide")) +
  scale_pattern_manual(values = c("stripe" = "stripe", "none" = "none")) +
  labs(fill="Treatment", pattern = "Pattern") +
  guides(fill = guide_legend(override.aes = list(pattern = c("none", "stripe", "none", "stripe"))),
         pattern = "none")


 

#Boxplot: Density of questing nymphals ticks 2023 and 2024
ggplot(graph3, aes(x = Treatment, y = Density, fill = Treatment)) + 
  geom_boxplot() +
  facet_wrap(~Time) +
  xlab("") + ylab(expression("Questing nymphal ticks per 100m"^2)) +
  theme_minimal() +
  ylim(0, 1.5) +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(color = "black"),  # Adds axis lines
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
        legend.position = "none",
        panel.border = element_blank())


#Boxplot: Deltamethrin vs Permethrin 2023 and 2024
ggplot(graph4, aes(x=Treatment, y=Average_Bur, fill=Treatment)) + 
  geom_boxplot() +
  xlab("") + ylab("Mean tick burdens") +
  facet_wrap(~Year) +
  theme_minimal() +
  ylim(0,6) +
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.line = element_line(color = "black"),  # Adds axis lines
        axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 0.5),
        legend.position = "none",
        panel.border = element_blank()) +
  scale_fill_manual(values = c("Control" = "#00BFC4",
                               "Deltamethrin" = "#ffcc00",
                               "Permethrin" = "#cc3300")) 



#Statistical analysis

#Loading in data
data1 <-read.csv("Burden_BACI_Lab.csv", header = TRUE)
data2 <-read.csv("DVP.csv", header = TRUE)
data3 <-read.csv("BACI_DON.csv", header = TRUE) 
data4 <-read.csv("Mam_Comp.csv", header = TRUE) 

#Attached Larval Ixodes pacificus ticks

#GLMM: Tick burdens by treatment type in 2023 and 2024 (IPAC L.)
BUR<- glmmTMB(Burdens ~ Treatment * Year + (1|Species) + (1|Area), ziformula=~1, family=poisson(), data=data1)
summary(BUR)

#GLMM: Tick burdens at Deltamethrin vs. Permethrin vs. Control in 2023 and 2024 (IPAC L.)
DVP<- glmmTMB(Burdens ~ Treatment + (1|Site.ID) + (1|Species), ziformula=~1, family=nbinom2(), data=data2)
summary(DVP)

#GLMM: Tick burdens at Deltamethrin vs. Permethrin in 2023 and 2024 (IPAC L.)
DVP_A <- data2[data2$Site.ID %in% c("EWA", "FLA", "SPA"), ]
DVP_Acar<- glmmTMB(Burdens ~ Treatment + (1|Site.ID) + (1|Species), ziformula=~1, family=nbinom2(), data=DVP_A)
summary(DVP_Acar)


#Questing nymphal Ixodes pacificus density

#GLMM: Nymphal tick density by treatment type 
Den_N <- data3[data3$Time == "2024", ]
DON<- glmmTMB(Total ~ Treatment + (1|Area), family=nbinom2(), data=Den_N)
summary(DON)


#Host capture rate 

#Welch two sample t-test: Species comparison between acaricide and control plots 2023 and 2024
t_test_results <- data4 %>%
  group_by(Species) %>%
  summarise(
    t_test = list(t.test(Total ~ Treatment, data = .)))

t_test_results$t_test

