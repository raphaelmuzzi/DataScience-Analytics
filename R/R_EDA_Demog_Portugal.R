
# ----------------------------------------------------------------------------
# EDA (Exploratory Data Analysis) - População em Portugal (2024)
# ----------------------------------------------------------------------------

# https://www.mortality.org/File/GetDocument/hmd.v6/PRT/STATS/Population.txt
# https://www.mortality.org/Country/Country?cntr=PRT > Population Size > 1-year


# Pacotes necessários
library(tidyverse)
library(ggplot2)
library(lubridate)
library(dplyr)
library(scales)

# 1. Carregar dados
# Download do txt: https://www.mortality.org/Country/Country?cntr=PRT (Population Size - 1 year)

DataPath <- "C:/Users/rmuzz/OneDrive/Desktop/Portifolio/R/EDA_Demografia_Portugal"

setwd(DataPath)

PrtPop <- read.csv("PopPortugal_1940_2024.txt",
                      skip = 2,
                      sep = "",
                      dec = ".")


# 2. Limpeza básica

PrtPop[PrtPop=="110+"] <- 110
PrtPop$Age <- as.numeric(PrtPop$Age)
PrtPop$Year <- as.numeric(PrtPop$Year)

# População Masculina em 20240101
PrtPop2024m <- PrtPop %>%
                filter(Year == 2024) %>%
                  select(Year, Age, Male)%>%
                    data.frame()

PrtPop2024m <- cbind(PrtPop2024m,"m")
PrtPop2024m <- rename(PrtPop2024m, c("Pop"="Male","Sex"=4))

# População Feminina em 20240101
PrtPop2024f <- PrtPop %>%
                filter(Year == 2024) %>%
                  select(Year, Age, Female)%>%
                    data.frame()
PrtPop2024f <- cbind(PrtPop2024f,"f")
PrtPop2024f <- rename(PrtPop2024f, c("Pop"="Female","Sex"=4))

# Concatenando a base Feminina com a Masculina
PrtPop2024 <- rbind(PrtPop2024f,PrtPop2024m)


# 3. Análise Exploratória (EDA)
    
    # a) População por sexo

    PrtPop2024 %>%
      group_by(Sex) %>%
      summarise(Pop_Sex=sum(Pop)) # Exibe no Console a população Feminina 5.556.158 
                                  # e a masculina 5.083.568 em 20240101
    
    ggplot(PrtPop2024, aes(x = Sex, y = Pop, fill = Sex)) +
      geom_bar(stat = "identity") +
      labs(title = "População por Sexo (Portugal, 2024)",
           x = "Sexo",
           y = "População") +
      scale_y_continuous(labels = label_number(scale = 1, big.mark = ".")) +
      theme_minimal()
    
    # !Pto de Melhora! = Não exibir os valores no eixo Y e sim no topo de cada barra
    
    
    # b) Distribuição por idade
    
    ggplot(PrtPop2024, aes(x = Age, y = Pop, fill = Sex)) +
      geom_bar(stat = "identity", position = "dodge") +
      labs(title = "Distribuição Populacional por Idade e Sexo (Portugal, 2024)",
           x = "Idade",
           y = "População") +
      scale_x_continuous(
          breaks = seq(0, max(PrtPop2024$Age), by = 10),  # Intervalos de 10 em 10
          labels = function(x) floor(x)) +  # Garante números inteiros
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
    
    
    # c) Pirâmide etária
    
    dados_piramide <- PrtPop2024 %>%
      mutate(Pop = ifelse(Sex == "m", -Pop, Pop))
    
    ggplot(dados_piramide, aes(x = Age, y = Pop, fill = Sex)) +
      geom_bar(stat = "identity") +
      coord_flip() +
      labs(title = "Pirâmide Etária de Portugal (2024)",
           x = "Idade",
           y = "População") +
      scale_y_continuous(labels = abs) +
      theme_minimal()
    
    
# 4. Estatísticas resumidas
    
    library(data.table)
    setDT(PrtPop2024)
    
    # Define "age breaks" e respectivos "labels"
    
    age_breaks <- c(0,1,seq(5, 105, by = 5),110,Inf)
    age_labels <- c("0-1","1-4",paste0(seq(5, 105, by = 5), "-",seq(9, 109, by = 5)),"110+") 
        #df <- cbind(age_breaks,age_labels) #checking
    
    
    # Cria Faixas Etárias
    
    faixas <- cut(PrtPop2024$Age,
                  breaks = age_breaks, 
                  labels = age_labels,
                  right = FALSE)
    
    PrtPop2024$Fx_Et <- faixas
    
    
    # Agrupar e contar
    
    Pop_Fx_Et <- PrtPop2024 %>%
                  group_by(Fx_Et) %>%
                    summarise(Pop_Fx_Et=sum(Pop))
