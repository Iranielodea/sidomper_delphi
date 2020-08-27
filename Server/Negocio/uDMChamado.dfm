object DMChamado: TDMChamado
  OldCreateOrder = False
  Height = 358
  Width = 296
  object QRelChamadoModelo01: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cha_Contato,'
      #9'Cha_Nivel,'
      #9'CASE Cha_Nivel'
      #9#9'WHEN 1 THEN '#39'Baixo'#39
      #9#9'WHEN 2 THEN '#39'Normal'#39
      #9#9'WHEN 3 THEN '#39'Alto'#39
      #9#9'WHEN 4 THEN '#39'Critico'#39
      #9'END AS Nivel,'
      #9'Tip_Nome,'
      #9'Sta_Nome,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      
        #9'TotalHorasGeral = (SELECT SUM(ChOco_TotalHoras) FROM Chamado_Oc' +
        'orrencia'
      #9#9#9#9#9'WHERE Cha_Id = ChOco_Chamado)'
      'FROM Chamado'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      '        INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'
      '        INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 56
    Top = 16
  end
  object QRelChamadoModelo02: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(ChOco_TotalHoras) TotalHoras'
      'FROM Chamado_Ocorrencia'
      '        INNER JOIN Chamado ON Cha_Id = ChOco_Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Usuario ON ChOco_Usuario = Usu_Id'#9#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 184
    Top = 16
  end
  object QRelChamadoModelo03: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'COUNT(Cha_Id) AS QtdeChamados,'
      #9'SUM(ChOco_TotalHoras) AS TotalHoras,'
      #9'0 AS TotalHorasDetalhes'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON ChOco_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 56
    Top = 72
  end
  object QRelChamadoModelo04: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(ChOco_TotalHoras) TotalHoras'#9
      'FROM Chamado_Ocorrencia'
      '        INNER JOIN Chamado ON Cha_Id = ChOco_Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Usuario ON ChOco_Usuario = Usu_Id'#9#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 56
    Top = 128
  end
  object QRelChamadoModelo03A: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      ''
      'UNION'
      'SELECT '
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'0 AS QtdeChamados,'
      #9'0 AS TotalHoras,'
      #9'SUM(ChaOCol_TotalHoras) AS TotalHorasDetalhes'
      'FROM Chamado_Ocorr_Colaborador'
      
        #9'INNER JOIN Chamado_Ocorrencia ON ChaOCol_ChamadoOcorrencia = Ch' +
        'Oco_Id'
      #9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON ChaOCol_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 168
    Top = 72
  end
  object QRelChamadoModelo05: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CAST(Cha_DataAbertura AS Date) as Cha_DataAbertura,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(ChOco_TotalHoras) as TotalHoras'
      'FROM Chamado'
      #9'INNER JOIN Chamado_Ocorrencia On Cha_Id = ChOco_Chamado'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      '        INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'
      '        INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 168
    Top = 128
  end
  object QRelChamadoModelo08: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Cli_Perfil,'
      #9'COUNT(Cha_Id) AS QtdeChamados,'
      #9'SUM(ChOco_TotalHoras) AS TotalHoras,'
      #9'0 AS TotalHorasDetalhes'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON ChOco_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 56
    Top = 184
  end
  object QRelChamadoModelo08A: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      ''
      'UNION'
      'SELECT '
      #9'Cli_Perfil,'
      #9'0 AS QtdeChamados,'
      #9'0 AS TotalHoras,'
      #9'SUM(ChaOCol_TotalHoras) AS TotalHorasDetalhes'
      'FROM Chamado_Ocorr_Colaborador'
      
        #9'INNER JOIN Chamado_Ocorrencia ON ChaOCol_ChamadoOcorrencia = Ch' +
        'Oco_Id'
      #9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON ChaOCol_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 168
    Top = 184
  end
  object QRelChamadoModelo09: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      'CASE Cha_Origem'
      #9'WHEN 1 THEN '#39'Telefone'#39
      #9'WHEN 2 THEN '#39'WhatsApp'#39
      #9'WHEN 3 THEN '#39'Chat'#39
      #9'WHEN 4 THEN '#39'Aplicativo'#39
      #9'WHEN 5 THEN '#39'ERP'#39
      'END ORIGEM,'
      'COUNT(Cha_Id) AS Qtde'
      'FROM Chamado'
      'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      'LEFT JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 56
    Top = 240
  end
end
