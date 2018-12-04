####################BANCO DE DADOS DO FIRJAN#####################



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

#FIRJANANOS+PROPOSTA
Full <- merge(FirjanAnos,Proposta,by.x = "CODIGBE7",by.y = "COD_MUNIC_IBGE")
