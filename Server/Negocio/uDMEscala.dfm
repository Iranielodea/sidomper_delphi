object dmEscala: TdmEscala
  OldCreateOrder = False
  Height = 150
  Width = 215
  object QRellatorio1: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'Esc_Usuario,'
      #9'Esc_Data,'
      #9'Esc_HoraFim,'
      #9'Esc_HoraInicio,'
      #9'Esc_TotalHoras,'
      
        #9'(SELECT ISNULL(SUM(ChOco_TotalHoras ),0) FROM Chamado_Ocorrenci' +
        'a'
      #9#9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      ''
      #9#9'WHERE Esc_Usuario = Cha_UsuarioAbertura'
      #9#9'AND Esc_Data = Cha_DataAbertura'
      '                AND Cha_TipoMovimento = 1'
      ''
      #9#9'AND Cha_HoraAbertura BETWEEN Esc_HoraInicio AND Esc_HoraFim'
      #9#9') AS TotalHoras'
      'FROM Escala'
      #9'INNER JOIN Usuario ON Esc_Usuario = Usu_Id'
      '')
    Left = 24
    Top = 16
  end
end
