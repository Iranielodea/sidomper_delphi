object DMVisita: TDMVisita
  OldCreateOrder = False
  Height = 364
  Width = 186
  object QRelVisitaModelo01: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Vis_Id,'
      #9'Vis_Data,'
      #9'Vis_HoraInicio,'
      #9'Vis_Dcto,'
      #9'Vis_HoraFim,'
      #9'Vis_Contato,'
      #9'Vis_Descricao,'
      #9'Vis_TotalHoras,'
      #9'Vis_FormaPagto,'
      #9'Vis_Valor,'
      #9'Tip_Nome,'
      #9'Sta_Nome,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      '  Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Visita'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      '  INNER JOIN Usuario ON Vis_Usuario = Usu_Id'
      '  INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 40
    Top = 24
  end
  object QRelVisitaModelo02: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras) TotalHoras,'
      '        SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'#9#9
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 40
    Top = 80
  end
  object QRelVisitaModelo03: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      '  Usu_Id,'
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras) TotalHoras,'
      '  SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'#9
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'#9
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'#9#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 40
    Top = 136
  end
  object QRelVisitaModelo04: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras) TotalHoras,'
      '        SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 40
    Top = 192
  end
  object QRelVisitaModelo08: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cli_Perfil,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras) TotalHoras,'
      '    SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      '')
    Left = 40
    Top = 248
  end
end
