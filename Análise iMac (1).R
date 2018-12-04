####################BANCO DE DADOS DO FIRJAN E MAPA DAS OSCs#####################



#Tabelas para linhas
FirjanAnos = gather(Firjan_Sau_Educ,Ano,valores,5:28)
#Caso precise apagar uma coluna indesejada
#FirjanAnos$NOME_DA_COLUNA<-NULL

#Separar a tabela do gather
FirjanAnos <- separate(data = FirjanAnos, col = Ano, into = c("Fonte", "Area", "Ano"))

#Apagar "FIRJAN"
FirjanAnos$Fonte <- NULL

#Mergir o banco IBGE com Firjan Anos
FirjanAnos <- merge(FirjanAnos,IBGE_codes,by.x = "Código",by.y = "CODIBGE6")

#Apagar os excessos
FirjanAnos$ANO <- NULL
FirjanAnos$COD_SIAFI <- NULL
FirjanAnos$CODSIAFI <- NULL
FirjanAnos$CODTSE <- NULL
FirjanAnos$Cod_UF <- NULL
FirjanAnos$Município.x <- NULL
FirjanAnos$Município.y <- NULL
FirjanAnos$mun <- NULL
FirjanAnos$UF.y <- NULL

#Mudar a ordem
colnames(FirjanAnos)
FirjanAnos <- FirjanAnos[,c(5,8,1,7,2,3,8,9,10,11,12,13,15,16,14,15,16,4,6)]

#Renomear as variáveis
colnames(FirjanAnos)[4] <- "CODIBGE7"
colnames(Proposta)[4] <- "CODIBGE7"
colnames(Proposta) [11] <- "Ano"

#FIRJANANOS+PROPOSTA
Full <- merge(FirjanAnos,Proposta,by = c("CODIBGE7","Ano"))

#Dados do Mapa das OSCs
#Primeiro, você deve baixar os dados no Mapa das OSCs, ajeitar para UTF-8. 
#Nesse caso, utilizei os dados das áreas e subáreas, os de recursos e dos projetos

#Remover as variáveis de códigos das OSCs repetidas no banco das áreas, e mergir os bancos
area_subarea$id_osc__1 <- NULL
area_subarea$id_osc__2 <- NULL
area_subarea[20:63] <- NULL
area_subarea$dt_fundacao_osc<-format(area_subarea$dt_fundacao_osc,"%Y")
ProjetosAreaOSC<- merge(Projetos,area_subarea,by = c("id_osc"))

#Somente Saúde ou Educação
ProjetosAreaOSCSE <- 

#Gráficos
ggplot
  