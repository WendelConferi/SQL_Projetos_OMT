USE [DAX_OMT_PRD]
GO

/****** Object:  View [BiView].[Clientes_OMT]    Script Date: 31/08/2022 07:53:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [BiView].[Clientes_OMT] AS

	SELECT 
		CT.AccountNum AS "Conta",
		DPT.Name AS "Nome",

--<INICIO; Autor: Wendel; Data: 2022/01/04>	
/*
Adicionando as funções CONVERT e NULLIF

Pois assim ele converte os valores para DATETIME e com o NULLIF ele identifica os valores vazios,
tornado eles "NULL"
*/
	
		CONVERT(DATETIME,(NULLIF(CT.LastUpdateCustTable, '')), 103) AS "Data de atualização"

--<FIM;>

	FROM CustTable CT
	JOIN DirPartyTable DPT ON CT.PARTY = DPT.RECID

	WHERE 
	CT.DATAAREAID = 'OMT'




GO
