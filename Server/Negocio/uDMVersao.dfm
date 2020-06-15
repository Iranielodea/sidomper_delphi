object DMVersao: TDMVersao
  OldCreateOrder = False
  Height = 180
  Width = 263
  object QVersaoVersao: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Ver_Id,'
      #9'Ver_Versao,'
      #9'Sol_Tipo,'
      #9'Tip_Nome,'
      #9'COUNT(Sol_Id) AS Quantidade'
      'FROM Versao'
      #9'LEFT JOIN Solicitacao On Ver_Id = Sol_VersaoId'
      #9'LEFT JOIN Tipo ON Sol_Tipo = Tip_Id'
      'WHERE Ver_Id = :IdVersao'
      'GROUP BY'
      #9'Ver_Id,'
      #9'Ver_Versao,'
      #9'Sol_Tipo,'
      #9'Tip_Nome')
    Left = 40
    Top = 20
    ParamData = <
      item
        Name = 'IDVERSAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QVersaoQtde: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'COUNT(Sol_Id)'
      'FROM Versao'
      #9'LEFT JOIN Solicitacao On Ver_Id = Sol_VersaoId'
      #9'LEFT JOIN Tipo ON Sol_Tipo = Tip_Id'
      'WHERE Ver_Id = :IdVersao')
    Left = 112
    Top = 16
    ParamData = <
      item
        Name = 'IDVERSAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QVersaoModelo3: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Ver_Id,'
      #9'Ver_Versao,'
      #9'Sol_Tipo,'
      #9'Prod_Nome,'
      #9'Mod_Nome,'
      #9'Sol_DescricaoLiberacao'
      'FROM Versao'
      #9'LEFT JOIN Solicitacao On Ver_Id = Sol_VersaoId'
      #9'LEFT JOIN Produto On Sol_Produto = Prod_Id'
      #9'LEFT JOIN Modulo On Sol_Modulo = Mod_Id')
    Left = 184
    Top = 16
  end
end
