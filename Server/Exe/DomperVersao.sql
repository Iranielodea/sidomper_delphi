--VERSAO 1.000.01
-------------------------------------------------------------------------------

USE SIDomper
GO
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(3, 1, 'Status Chamado Quadro 1', '0'),
	(4, 1, 'Status Chamado Quadro 2', '0'),
	(5, 1, 'Status Chamado Quadro 3', '0'),
	(6, 1, 'Status Chamado Quadro 4', '0'),
	(7, 1, 'Status Chamado Quadro 5', '0'),
	(8, 1, 'Status Chamado Quadro 6', '0'),
	(9, 1, 'Status Chamado para abertura do chamado', '0'),
	(10, 1, 'Status Chamado para Atendimento', '0'),
	(11,NULL, 'Versão do Sistema', '1.000.00')
GO

ALTER TABLE Chamado ADD
	Cha_Modulo INT,
	Cha_Produto INT,
	Cha_UsuarioAtendeAtual INT
GO

ALTER TABLE [dbo].[Chamado]  ADD  CONSTRAINT [FK_Chamado_Modulo] FOREIGN KEY([Cha_Modulo])
REFERENCES [dbo].[Modulo] ([Mod_Id])
GO

ALTER TABLE [dbo].[Chamado]  ADD  CONSTRAINT [FK_Chamado_Produto] FOREIGN KEY([Cha_Produto])
REFERENCES [dbo].[Produto] ([Prod_Id])
GO

ALTER TABLE [dbo].[Chamado]  ADD  CONSTRAINT [FK_Chamado_UsuarioAtendeAtual] FOREIGN KEY([Cha_UsuarioAtendeAtual])
REFERENCES [dbo].[Usuario] ([Usu_Id])
GO

-------------------------------------------------------------------------------
--VERSAO 1.000.02
-------------------------------------------------------------------------------
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(12, 3, 'Status Solicitação Quadro 1', '0'),
	(13, 3, 'Status Solicitação Quadro 2', '0'),
	(14, 3, 'Status Solicitação Quadro 3', '0'),
	(15, 3, 'Status Solicitação Quadro 4', '0'),
	(16, 3, 'Status Solicitação Quadro 5', '0'),
	(17, 3, 'Status Solicitação Quadro 6', '0'),
	(18, 3, 'Status para abertura da Solicitação', '0'),
	(19, 3, 'Status Solicitação para Atendimento', '0')
GO

ALTER TABLE Solicitacao ADD Sol_UsuarioAtendeAtual INT
GO

ALTER TABLE [dbo].[Solicitacao]  ADD  CONSTRAINT [FK_Solicitacao_UsuarioAtendeAtual] FOREIGN KEY([Sol_UsuarioAtendeAtual])
REFERENCES [dbo].[Usuario] ([Usu_Id])
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.03
-------------------------------------------------------------------------------
CREATE TABLE Usuario_Permissao(
	UsuP_Id int IDENTITY(1,1) NOT NULL,
	UsuP_Usuario INT NOT NULL,
	UsuP_Sigla VARCHAR(50) NOT NULL)
GO

ALTER TABLE Usuario_Permissao ADD CONSTRAINT Pk_Usuario_Permissao PRIMARY KEY(UsuP_Id)
GO

ALTER TABLE Usuario_Permissao ADD  CONSTRAINT FK_Usuario_Permissao_Usuario FOREIGN KEY(UsuP_Usuario)
REFERENCES Usuario (Usu_Id)
ON DELETE CASCADE
GO

ALTER TABLE Solicitacao ALTER COLUMN Sol_Tipo INT
GO
ALTER TABLE Solicitacao_Ocorrencia ALTER COLUMN SOcor_Tipo INT
GO
DELETE FROM Parametros WHERE Par_Codigo = 19
GO

INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(19, 3, 'Status Solicitação Quadro 7', '0'),
	(20, 3, 'Status Solicitação Quadro 8', '0'),
	(21, 3, 'Status Solicitação Quadro 9', '0'),
	(22, 3, 'Status Solicitação Quadro 10', '0'),
	(23, 3, 'Status Solicitação Quadro 11', '0'),
	(24, 3, 'Status Solicitação Quadro 12', '0')
GO
CREATE TABLE Conta_Email(
	CtaEm_Id INT IDENTITY(1,1) NOT NULL,
	CtaEm_Codigo INT NOT NULL,
	CtaEm_Nome VARCHAR(60) NOT NULL,
	CtaEm_Email VARCHAR(100) NOT NULL,
	CtaEm_Senha VARCHAR(30) NOT NULL,
	CtaEm_SMTP VARCHAR(100) NOT NULL,
	CtaEm_Porta INT NOT NULL,
	CtaEm_Ativo BIT NOT NULL DEFAULT 1,
	CtaEm_Autenticar BIT NOT NULL DEFAULT 1,
	CtaEm_AutenticarSSL BIT NOT NULL DEFAULT 1
)
GO
ALTER TABLE Conta_Email ADD CONSTRAINT PK_Conta_Email PRIMARY KEY(CtaEm_Id)
GO
ALTER TABLE Conta_Email ADD CONSTRAINT UK_Conta_Email_Codigo UNIQUE(CtaEm_Codigo)
GO
ALTER TABLE Usuario ADD Usu_ContaEmail INT
GO
ALTER TABLE Usuario ADD  CONSTRAINT FK_Usuario_ContaEmail FOREIGN KEY(Usu_ContaEmail)
REFERENCES Conta_Email (CtaEm_Id)
GO
ALTER PROCEDURE [dbo].[Usuario_sp_Incluir]
AS
BEGIN
	DECLARE
		@Id INT

	SELECT TOP(1) @Id=Dep_Id FROM Departamento

	IF COALESCE(@Id,0) > 0
		RETURN

	SELECT TOP(1) @Id=Usu_Id FROM Usuario

	IF COALESCE(@Id,0) > 0
		RETURN

	INSERT INTO Departamento(
		Dep_Ativo,
		Dep_Codigo,
		Dep_Nome,
		Dep_SolicitaAbertura,
		Dep_SolicitaAnalise,
		Dep_SolicitaOcorGeral,
		Dep_SolicitaOcorTecnica,
		Dep_SolicitaQuadro,
		Dep_SolicitaStatus)
	VALUES(
		1,
		1,
		'ADMINISTRACAO',
		1,
		1,
		1,
		1,
		1,
		1)

	SELECT @Id=IDENT_CURRENT('Departamento')

	INSERT INTO Departamento_Acesso(DepAc_Acesso, DepAc_Departamento, DepAc_Editar, DepAc_Excluir, DepAc_Incluir, DepAc_Relatorio, DepAc_Programa) 
		VALUES 
		(1, @Id, 1, 1, 1, 1, 1),
		(1, @Id, 1, 1, 1, 1, 2),
		(1, @Id, 1, 1, 1, 1, 3),
		(1, @Id, 1, 1, 1, 1, 4),
		(1, @Id, 1, 1, 1, 1, 6),
		(1, @Id, 1, 1, 1, 1, 100),
		(1, @Id, 1, 1, 1, 1, 101),
		(1, @Id, 1, 1, 1, 1, 102),
		(1, @Id, 1, 1, 1, 1, 103),
		(1, @Id, 1, 1, 1, 1, 104),
		(1, @Id, 1, 1, 1, 1, 105),
		(1, @Id, 1, 1, 1, 1, 106),
		(1, @Id, 1, 1, 1, 1, 107),
		(1, @Id, 1, 1, 1, 1, 108),
		(1, @Id, 1, 1, 1, 1, 109),
		(1, @Id, 1, 1, 1, 1, 110)

	INSERT INTO Usuario(
		Usu_Codigo,
		Usu_UserName,
		Usu_Nome,
		Usu_Password,
		Usu_Email,
		Usu_OnLine,
		Usu_Adm,
		Usu_Ativo,
		Usu_Notificar,
		Usu_Departamento)
	VALUES(
		1,
		'PERF',
		'PERF',
		'12',
		'domper@domper.com.br',
		1,
		1,
		1,
		1,
		@Id)

END
GO
CREATE TABLE Departamento_Email(
	DepEm_Id INT IDENTITY(1,1) NOT NULL,
	DepEm_Departamento INT NOT NULL,
	DepEm_Email VARCHAR(80) NOT NULL
)
GO
ALTER TABLE Departamento_Email ADD CONSTRAINT PK_Departamento_Email PRIMARY KEY(DepEm_Id)

ALTER TABLE Departamento_Email ADD CONSTRAINT FK_Departamento_Departamento_Email FOREIGN KEY(DepEm_Departamento)
 REFERENCES Departamento(Dep_Id) ON DELETE CASCADE
GO
ALTER TABLE Status ADD
	Sta_NotificarCliente BIT NOT NULL DEFAULT 0,
	Sta_NotificarSupervisor BIT NOT NULL DEFAULT 0,
	Sta_NotificarConsultor BIT NOT NULL DEFAULT 0,
	Sta_NotificarRevenda BIT NOT NULL DEFAULT 0;
GO
CREATE PROCEDURE Departamento_Acesso_sp_Incluir(@Programa int)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Departamento_Acesso WHERE DepAc_Programa = @Programa)
		RETURN;

	INSERT INTO Departamento_Acesso
		SELECT 
			Dep_Id,
			@Programa,
			1,
			1,
			1,
			1,
			1
		FROM Departamento;
END
GO

EXEC Departamento_Acesso_sp_Incluir 110
GO

CREATE TABLE Revenda_Email(
	RevEm_Id INT IDENTITY(1,1) NOT NULL,
	RevEm_Revenda INT NOT NULL,
	RevEm_Email VARCHAR(80) NOT NULL
)
GO

ALTER TABLE Revenda_Email ADD CONSTRAINT PK_Revenda_Email PRIMARY KEY(RevEm_Id)

ALTER TABLE Revenda_Email ADD CONSTRAINT FK_Revenda_Revenda_Email FOREIGN KEY(RevEm_Revenda)
 REFERENCES Revenda(Rev_Id) ON DELETE CASCADE
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.04
-------------------------------------------------------------------------------
ALTER PROCEDURE [dbo].[Departamento_Acesso_sp_Incluir](@Programa int)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Departamento_Acesso WHERE DepAc_Programa = @Programa)
		RETURN;

	INSERT INTO Departamento_Acesso
		SELECT 
			Dep_Id,
			@Programa,
			0,
			1,
			1,
			1,
			1
		FROM Departamento;
END;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.05
-------------------------------------------------------------------------------
ALTER TABLE Solicitacao ADD Sol_Contato VARCHAR(100)
ALTER TABLE Status ADD Sta_Conceito VARCHAR(1000)
ALTER TABLE Tipo ADD Tip_Conceito VARCHAR(1000)
ALTER TABLE Chamado_Ocorrencia ADD ChOco_Versao VARCHAR(25)
ALTER TABLE Cliente ADD Cli_Versao VARCHAR(25)
GO

ALTER TRIGGER [dbo].[Trg_Chamado_Ocorrencia_IU] ON [dbo].[Chamado_Ocorrencia] FOR INSERT, UPDATE
AS
BEGIN
	DECLARE
		@HoraInicio time,
		@HoraFim time,
		@IdChamado int,
		@IdCliente int,
		@Versao VARCHAR(25);

	SELECT 
		@HoraInicio=ChOco_HoraInicio,
		@HoraFim=ChOco_HoraFim,
		@IdChamado = ChOco_Chamado,
		@Versao = ChOco_Versao
	FROM inserted

	SELECT @IdCliente=Cha_Cliente FROM Chamado WHERE Cha_Id = @IdChamado;

	IF LTRIM(@Versao) <> ''
		UPDATE Cliente SET Cli_Versao = @Versao WHERE Cli_Id = @IdCliente;

	--BEGIN TRY
	--	IF (@HoraInicio > @HoraFim)
	--		RAISERROR('Hora Inicial maior que Hora Final!', 15, 1)
	--END TRY
	--BEGIN CATCH
	--	THROW
	--END CATCH
END
GO

ALTER TABLE Chamado ADD Cha_HoraAtendeAtual time
GO

CREATE FUNCTION [dbo].[Func_Chamado_BuscarUltimaOcorrencia] 
(
    @IdChamado INT
)
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE 
		@Resultado VARCHAR(20),
		@HoraFim time;

	SELECT TOP(1) @HoraFim = ChOco_HoraFim FROM Chamado_Ocorrencia
		WHERE ChOco_Chamado = @IdChamado
	ORDER BY ChOco_Data desc, ChOco_HoraFim desc;

	SET @Resultado = CAST(@HoraFim AS VARCHAR(20));

	RETURN @Resultado;
END
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.06
-------------------------------------------------------------------------------
ALTER TRIGGER [dbo].[Trg_Chamado_IU] ON [dbo].[Chamado] FOR INSERT, UPDATE
AS
BEGIN
	DECLARE 
		@Descricao VARCHAR(1000),
		@IdUsuario INT,
		@IdStatus INT,
		@IdStatusOld INT,
		@IdChamado INT;

	IF ((SELECT COUNT(Cha_Id) FROM deleted) <> 0) OR ((SELECT COUNT(Cha_Id) FROM inserted) <> 0)
	BEGIN
		SELECT 
			@Descricao=Cha_Descricao,
			@IdUsuario=Cha_UsuarioAtendeAtual,
			@IdStatus=Cha_Status,
			@IdChamado=Cha_Id
		FROM inserted;

		SELECT @IdStatusOld = Cha_Status from deleted;

		IF (@IdStatusOld <> @IdStatus) AND (@IdUsuario IS NOT NULL)
		BEGIN
			INSERT INTO Chamado_Status(
				ChSta_Chamado,
				ChSta_Data,
				ChSta_Status,
				ChSta_Usuario
			) VALUES (
				@IdChamado,
				CAST(GETDATE() AS date),
				@IdStatusOld,
				@IdUsuario
			);
		END

		BEGIN TRY
			IF LTRIM(@Descricao) = ''
				RAISERROR('Informe a Descrição!', 15, 1)
		END TRY
		BEGIN CATCH
			THROW
		END CATCH
	END
END
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.07
-------------------------------------------------------------------------------
ALTER TABLE dbo.Chamado_Status ADD ChSta_Hora time
ALTER TABLE dbo.Solicitacao_Status ADD SSta_Hora time
GO
CREATE TRIGGER trg_Chamado_Status_I ON dbo.Chamado_Status FOR INSERT
AS
BEGIN
	UPDATE CHA SET	
		CHA.ChSta_Hora = CAST(GETDATE() AS time),
		CHA.ChSta_Data = CAST(GETDATE() AS date)
	FROM dbo.Chamado_Status AS CHA
	INNER JOIN inserted AS i ON CHA.ChSta_Id = i.chSta_Id;
END
GO

CREATE TRIGGER trg_Solicitacao_Status_I ON dbo.Solicitacao_Status FOR INSERT
AS
BEGIN
	UPDATE SOL SET	
		SOL.SSta_Hora = CAST(GETDATE() AS time),
		SOL.SSta_Data = CAST(GETDATE() AS date)
	FROM dbo.Solicitacao_Status AS SOL
	INNER JOIN inserted AS i ON SOL.SSta_Id = i.SSta_Id;
END
GO

ALTER TABLE dbo.Cliente_Especificacao ADD CliEsp_Nome varchar(100);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.08
-------------------------------------------------------------------------------
ALTER TABLE dbo.Chamado ADD Cha_TipoMovimento int;
GO
UPDATE dbo.Chamado
SET dbo.Chamado.Cha_TipoMovimento = 1
WHERE dbo.Chamado.Cha_TipoMovimento IS NULL
GO

ALTER PROCEDURE [dbo].[Usuario_sp_Incluir]
AS
BEGIN
	DECLARE
		@Id INT

	SELECT TOP(1) @Id=Dep_Id FROM Departamento

	IF COALESCE(@Id,0) > 0
		RETURN

	SELECT TOP(1) @Id=Usu_Id FROM Usuario

	IF COALESCE(@Id,0) > 0
		RETURN

	INSERT INTO Departamento(
		Dep_Ativo,
		Dep_Codigo,
		Dep_Nome,
		Dep_SolicitaAbertura,
		Dep_SolicitaAnalise,
		Dep_SolicitaOcorGeral,
		Dep_SolicitaOcorTecnica,
		Dep_SolicitaQuadro,
		Dep_SolicitaStatus)
	VALUES(
		1,
		1,
		'ADMINISTRACAO',
		1,
		1,
		1,
		1,
		1,
		1)

	SELECT @Id=IDENT_CURRENT('Departamento')

	INSERT INTO Departamento_Acesso(DepAc_Acesso, DepAc_Departamento, DepAc_Editar, DepAc_Excluir, DepAc_Incluir, DepAc_Relatorio, DepAc_Programa) 
		VALUES 
		(1, @Id, 1, 1, 1, 1, 1),
		(1, @Id, 1, 1, 1, 1, 2),
		(1, @Id, 1, 1, 1, 1, 3),
		(1, @Id, 1, 1, 1, 1, 4),
		(1, @Id, 1, 1, 1, 1, 6),
		(1, @Id, 1, 1, 1, 1, 100),
		(1, @Id, 1, 1, 1, 1, 101),
		(1, @Id, 1, 1, 1, 1, 102),
		(1, @Id, 1, 1, 1, 1, 103),
		(1, @Id, 1, 1, 1, 1, 104),
		(1, @Id, 1, 1, 1, 1, 105),
		(1, @Id, 1, 1, 1, 1, 106),
		(1, @Id, 1, 1, 1, 1, 107),
		(1, @Id, 1, 1, 1, 1, 108),
		(1, @Id, 1, 1, 1, 1, 109),
		(1, @Id, 1, 1, 1, 1, 110),
		(1, @Id, 1, 1, 1, 1, 111)

	INSERT INTO Usuario(
		Usu_Codigo,
		Usu_UserName,
		Usu_Nome,
		Usu_Password,
		Usu_Email,
		Usu_OnLine,
		Usu_Adm,
		Usu_Ativo,
		Usu_Notificar,
		Usu_Departamento)
	VALUES(
		1,
		'PERF',
		'PERF',
		'12',
		'domper@domper.com.br',
		1,
		1,
		1,
		1,
		@Id)

END
GO

EXEC Departamento_Acesso_sp_Incluir 111;
GO

INSERT INTO dbo.Parametros
(
    Par_Codigo,
    Par_Programa,
    Par_Nome,
    Par_Valor,
    Par_Obs
)
VALUES 
	(25,111,'Status Atividade Quadro 1','0',''),
	(26,111,'Status Atividade Quadro 2','0',''),
	(27,111,'Status Atividade Quadro 3','0',''),
	(28,111,'Status Atividade Quadro 4','0',''),
	(29,111,'Status Atividade Quadro 5','0',''),
	(30,111,'Status Atividade Quadro 6','0',''),
	(31,111,'Status Atividade Abertura ','0',''),
	(32,111,'Status Atividade Atendimento','0','');
GO

ALTER TABLE dbo.Departamento ADD 
	Dep_AtividadeAbertura bit,
	Dep_AtividadeStatus bit,
	Dep_AtividadeQuadro bit,
	Dep_AtividadeOcor bit;
GO

UPDATE dbo.Departamento SET Dep_AtividadeAbertura = 0 WHERE Dep_AtividadeAbertura IS NULL;
UPDATE dbo.Departamento SET Dep_AtividadeStatus = 0 WHERE Dep_AtividadeStatus IS NULL;
UPDATE dbo.Departamento SET Dep_AtividadeQuadro = 0 WHERE Dep_AtividadeQuadro IS NULL;
UPDATE dbo.Departamento SET Dep_AtividadeOcor = 0 WHERE Dep_AtividadeOcor IS NULL;
GO

IF OBJECT_ID('dbo.Func_Chamado_BuscarUltimaOcorrencia') IS NOT NULL
	DROP FUNCTION dbo.Func_Chamado_BuscarUltimaOcorrencia;
GO

CREATE FUNCTION [dbo].[Func_Chamado_BuscarUltimaHoraOcorrencia] 
(
    @IdChamado INT
)
RETURNS time
AS
BEGIN
	DECLARE 
		@Resultado VARCHAR(20),
		@HoraFim time;

	SELECT TOP(1) @HoraFim = ChOco_HoraFim FROM Chamado_Ocorrencia
		WHERE ChOco_Chamado = @IdChamado
	ORDER BY ChOco_Data desc, ChOco_HoraFim desc;

	RETURN @HoraFim;
END
GO

CREATE TABLE Chamado_Ocorr_Colaborador(
	ChaOCol_Id INT IDENTITY(1,1) NOT NULL,
	ChaOCol_ChamadoOcorrencia INT NOT NULL,
	ChaOCol_Usuario INT NOT NULL,
	ChaOcol_HoraInicio date NOT NULL,
	ChaOCol_HoraFim date NOT NULL
);
GO

ALTER TABLE Chamado_Ocorr_Colaborador ADD CONSTRAINT PK_Chamado_Ocorr_Colaborador PRIMARY KEY(ChaOCol_Id);
GO

ALTER TABLE Chamado_Ocorr_Colaborador ADD CONSTRAINT FK_Chamado_Ocorr_Colaborador_ChamadoOcorrencia
	FOREIGN KEY(ChaOCol_ChamadoOcorrencia) REFERENCES dbo.Chamado_Ocorrencia(ChOco_Id) ON DELETE CASCADE;
GO

ALTER TABLE Chamado_Ocorr_Colaborador ADD CONSTRAINT FK_Chamado_Ocorr_Colaborador_Usuario
	FOREIGN KEY(ChaOCol_Usuario) REFERENCES dbo.Usuario(Usu_Id);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.09
-------------------------------------------------------------------------------

ALTER TABLE dbo.Chamado_Ocorr_Colaborador ADD ChaOCol_TotalHoras float;
GO
ALTER TABLE dbo.Chamado_Ocorr_Colaborador DROP COLUMN ChaOCol_HoraInicio
ALTER TABLE dbo.Chamado_Ocorr_Colaborador DROP COLUMN ChaOCol_HoraFim
GO
ALTER TABLE dbo.Chamado_Ocorr_Colaborador ADD ChaOCol_HoraInicio time
ALTER TABLE dbo.Chamado_Ocorr_Colaborador ADD ChaOCol_HoraFim time
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.10
-------------------------------------------------------------------------------
CREATE TABLE Agendamento(
	Age_Id int identity(1,1) NOT NULL,
	Age_Data Date not null,
	Age_Hora time not null,
	Age_Usuario int not null,
	Age_Cliente int not null,
	Age_Contato varchar(100),
	Age_Programa int not null,
	Age_Tipo int not null,
	Age_Status int not null,
	Age_Descricao varchar(500) not null,
	Age_Motivo varchar(500),
	Age_Visita int,
	Age_Atividade int
);
GO
ALTER TABLE Agendamento ADD CONSTRAINT PK_Agendamento PRIMARY KEY(Age_Id);
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_Usuario
	FOREIGN KEY(Age_Usuario) REFERENCES Usuario(Usu_Id);
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_Cliente
	FOREIGN KEY(Age_Cliente) REFERENCES Cliente(Cli_Id);
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_Tipo
	FOREIGN KEY(Age_Tipo) REFERENCES Tipo(Tip_Id);
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_Status
	FOREIGN KEY(Age_Status) REFERENCES Status(Sta_Id);
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_Visita
	FOREIGN KEY(Age_Visita) REFERENCES Visita(Vis_Id);
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_Atividade
	FOREIGN KEY(Age_Atividade) REFERENCES Chamado(Cha_Id);
CREATE INDEX IX_Agendamento_Data ON Agendamento(Age_Data);
ALTER TABLE Agendamento ADD CONSTRAINT 
	CHECK_Agendamento_Programa CHECK(Age_Programa IN (2,7));
GO

CREATE PROCEDURE [dbo].[Agendamento_sp_IU](
	@IU char(1),
	@Id int,
	@Data date,
	@Hora time,
	@IdUsuario int,
	@IdCliente int,
	@Contato varchar(100),
	@Programa int,
	@IdTipo int,
	@IdStatus int,
	@Descricao varchar(500),
	@Motivo varchar(500),
	@IdVisita int,
	@IdAtividade int,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I') -- INSERT
	BEGIN
		INSERT INTO Agendamento(
			Age_Data,
			Age_Hora,
			Age_Usuario,
			Age_Cliente,
			Age_Contato,
			Age_Programa,
			Age_Tipo,
			Age_Status,
			Age_Descricao,
			Age_Motivo,
			Age_Visita,
			Age_Atividade)
		VALUES(
			@Data,
			@Hora,
			@IdUsuario,
			@IdCliente,
			@Contato,
			@Programa,
			@IdTipo,
			@IdStatus,
			@Descricao,
			@Motivo,
			@IdVisita,
			@IdAtividade
		);

		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF @IU = 'U'
	BEGIN
		UPDATE Agendamento SET
			Age_Data = @Data,
			Age_Hora = @Hora,
			Age_Usuario = @IdUsuario,
			Age_Cliente = @IdCliente,
			Age_Contato = @Contato,
			Age_Programa = @Programa,
			Age_Tipo = @IdTipo,
			Age_Status = @IdStatus,
			Age_Descricao = @Descricao,
			Age_Motivo = @Motivo,
			Age_Visita = @IdVisita,
			Age_Atividade = @IdAtividade
		WHERE Age_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

EXEC Departamento_Acesso_sp_Incluir 112;
GO

INSERT INTO dbo.Parametros
(
    Par_Codigo,
    Par_Programa,
    Par_Nome,
    Par_Valor,
    Par_Obs
)
VALUES 
	(33,112,'Status Agendamento Abertura','0',''),
	(34,112,'Status Agendamento Cancelamento','0',''),
	(35,112,'Status Agendamento Reagendamento','0','');
GO
ALTER TABLE Departamento ADD Dep_AgendamentoQuadro bit;
GO
UPDATE Departamento SET Dep_AgendamentoQuadro = 0 WHERE Dep_AgendamentoQuadro IS NULL;
GO
CREATE UNIQUE INDEX Agendamento_Data_Hora_Usuario ON Agendamento(Age_Data, Age_Hora, Age_Usuario);
GO
ALTER TRIGGER [dbo].[trg_Solicitacao_IU] ON [dbo].[Solicitacao] FOR INSERT, UPDATE
AS
BEGIN
	DECLARE 
		@Descricao VARCHAR(1000),
		@IdUsuario INT,
		@IdStatus INT,
		@IdStatusOld INT,
		@IdSolicitacao INT;

	IF ((SELECT COUNT(Sol_Id) FROM deleted) <> 0) OR ((SELECT COUNT(Sol_Id) FROM inserted) <> 0)
	BEGIN
		SELECT 
			@Descricao=Sol_Descricao,
			@IdUsuario=Sol_UsuarioAtendeAtual,
			@IdStatus=Sol_Status,
			@IdSolicitacao=Sol_Id
		FROM inserted;

		SELECT @IdStatusOld = Sol_Status from deleted;

		IF (@IdStatusOld <> @IdStatus) AND (@IdUsuario IS NOT NULL)
		BEGIN
			INSERT INTO Solicitacao_Status(
				SSta_Solicitacao,
				SSta_Data,
				SSta_Status,
				SSta_UsuarioOperacional,
				SSta_Hora
			) VALUES (
				@IdSolicitacao,
				CAST(GETDATE() AS date),
				@IdStatusOld,
				@IdUsuario,
				CAST(GETDATE() AS time)
			);
		END
	END
END
GO

CREATE TABLE PlanoBackup(
	Plb_Id INT IDENTITY(1,1) NOT NULL,
	Plb_Destino VARCHAR(200) NOT NULL,
	Plb_Domingo BIT NOT NULL,
	Plb_Segunda BIT NOT NULL,
	Plb_Terca BIT NOT NULL,
	Plb_Quarta BIT NOT NULL,
	Plb_Quinta BIT NOT NULL,
	Plb_Sexta BIT NOT NULL,
	Plb_Sabado BIT NOT NULL,
	Plb_Ativo BIT NOT NULL,
	Plb_DataUltimoBackup date
);
GO

ALTER TABLE PlanoBackup ADD CONSTRAINT PK_PlanoBackup Primary key(Plb_Id);
GO

CREATE TABLE PlanoBackupItens(
	PlbIte_Id INT IDENTITY(1,1) NOT NULL,
	PlbIte_PlanoBackup INT NOT NULL,
	PlbIte_Hora time,
	PlbIte_Status BIT
);
GO

ALTER TABLE PlanoBackupItens ADD CONSTRAINT PK_PlanoBackupItens Primary key(PlbIte_Id);
GO

ALTER TABLE PlanoBackupItens ADD CONSTRAINT FK_PlanoBackupItens_PlanoBackup
	FOREIGN KEY(PlbIte_PlanoBackup) REFERENCES PlanoBackup(Plb_Id) ON DELETE CASCADE;
GO

CREATE PROCEDURE PlanoBackup_sp_IU(
	@IU char(1),
	@Id int,
	@Destino varchar(200),
	@Domingo bit,
	@Segunda bit,
	@Terca bit,
	@Quarta bit,
	@Quinta bit,
	@Sexta bit,
	@Sabado bit,
	@Ativo bit,
	@DataUltimoBackup date,
	@RetornoId int OUTPUT)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO PlanoBackup(
			Plb_Destino,
			Plb_Domingo,
			Plb_Segunda,
			Plb_Terca,
			Plb_Quarta,
			Plb_Quinta,
			Plb_Sexta,
			Plb_Sabado,
			Plb_Ativo,
			Plb_DataUltimoBackup)
		VALUES(
			@Destino,
			@Domingo,
			@Segunda,
			@Terca,
			@Quarta,
			@Quinta,
			@Sexta,
			@Sabado,
			@Ativo,
			@DataUltimoBackup);
		SET @RetornoId = SCOPE_IDENTITY();
	END

	IF (@IU = 'U')
	BEGIN
		UPDATE PlanoBackup SET
			Plb_Destino = @Destino,
			Plb_Domingo = @Domingo,
			Plb_Segunda = @Segunda,
			Plb_Terca = @Terca,
			Plb_Quarta = @Quarta,
			Plb_Quinta = @Quinta,
			Plb_Sexta = @Sexta,
			Plb_Sabado = @Sabado,
			Plb_Ativo = @Ativo,
			Plb_DataUltimoBackup = @DataUltimoBackup
		WHERE Plb_Id = @Id;
		SET @RetornoId = @Id;
	END
END	
GO

CREATE PROCEDURE PlanoBackupItens_sp_IU(
	@IU char(1),
	@Id int,
	@PlanoBackup int,
	@Hora time,
	@Status bit
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO PlanoBackupItens(
			PlbIte_PlanoBackup,
			PlbIte_Hora,
			PlbIte_Status)
		VALUES(
			@PlanoBackup,
			@Hora,
			@Status);
	END

	IF (@IU = 'U')
	BEGIN
		UPDATE PlanoBackupItens SET
			PlbIte_PlanoBackup = @PlanoBackup,
			PlbIte_Hora = @Hora,
			PlbIte_Status = @Status
		WHERE PlbIte_Id = @Id;
	END
END
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.11
-------------------------------------------------------------------------------
INSERT INTO dbo.Parametros
(
    Par_Codigo,
    Par_Programa,
    Par_Nome,
    Par_Valor,
    Par_Obs
)
VALUES 
	(36,112,'Status Agendamento Encerrado','0','');
GO
ALTER TABLE Chamado_Ocorrencia ALTER COLUMN ChOco_DescricaoSolucao VARCHAR(2000);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.12
-------------------------------------------------------------------------------
ALTER TABLE Solicitacao ALTER COLUMN Sol_Descricao VARCHAR(max);
ALTER TABLE Solicitacao ALTER COLUMN Sol_DescricaoLiberacao VARCHAR(max);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.13
-------------------------------------------------------------------------------
ALTER TABLE Solicitacao_Ocorrencia ALTER COLUMN SOcor_Descricao VARCHAR(max);

GO
-------------------------------------------------------------------------------
--VERSAO 1.000.14
-------------------------------------------------------------------------------
CREATE TABLE Prospect(
	Pros_Id int identity(1,1) NOT NULL,
	Pros_Codigo int NOT NULL,
	Pros_Nome varchar(100) NOT NULL,
	Pros_Fantasia varchar(100),
	Pros_Docto varchar(25) NOT NULL,
	Pros_Enquadramento varchar(2),
	Pros_Endereco varchar(200),
	Pros_Telefone varchar(100),
	Pros_Contato varchar(200),
	Pros_Usuario int,
	Pros_Revenda int NOT NULL,
	Pros_Ativo bit);
GO
ALTER TABLE Prospect ADD CONSTRAINT PK_Prospect Primary key(Pros_Id);

ALTER TABLE Prospect ADD CONSTRAINT FK_Prospect_Usuario
	FOREIGN KEY(Pros_Usuario) REFERENCES Usuario(Usu_Id);

ALTER TABLE Prospect ADD CONSTRAINT FK_Prospect_Revenda
	FOREIGN KEY(Pros_Revenda) REFERENCES Revenda(Rev_Id);

CREATE UNIQUE INDEX Prospect_Codigo ON Prospect(Pros_Codigo);
GO

CREATE TABLE Prospect_Email(
	ProsEm_Id int identity(1,1) NOT NULL,
	ProsEm_Prospect int NOT NULL,
	ProsEm_Email varchar(100) NOT NULL,
	ProsEm_Descricao varchar(100) NOT NULL
);
GO
ALTER TABLE Prospect_Email ADD CONSTRAINT PK_ProspectEmail Primary key(ProsEm_Id);
ALTER TABLE Prospect_Email ADD CONSTRAINT FK_ProspectEmail_Prospect
	FOREIGN KEY(ProsEm_Prospect) REFERENCES Prospect(Pros_Id) ON DELETE CASCADE;
GO
CREATE PROCEDURE Prospect_sp_IU(
	@IU char(1),
	@Id int,
	@Codigo int,
	@Nome varchar(100),
	@Fantasia varchar(100),
	@Docto varchar(25),
	@Enquadramento varchar(2),
	@Endereco varchar(200),
	@Telefone varchar(100),
	@Contato varchar(200),
	@IdUsuario int,
	@IdRevenda int,
	@Ativo bit,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Prospect(
			Pros_Nome,
			Pros_Fantasia,
			Pros_Docto,
			Pros_Enquadramento,
			Pros_Endereco,
			Pros_Telefone,
			Pros_Contato,
			Pros_Usuario,
			Pros_Revenda,
			Pros_Ativo,
			Pros_Codigo)
		VALUES(
			@Nome,
			@Fantasia,
			@Docto,
			@Enquadramento,
			@Endereco,
			@Telefone,
			@Contato,
			@IdUsuario,
			@IdRevenda,
			@Ativo,
			@Codigo);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U') 
	BEGIN
		UPDATE Prospect SET
			Pros_Nome = @Nome,
			Pros_Fantasia = @Fantasia,
			Pros_Docto = @Docto,
			Pros_Enquadramento = @Enquadramento,
			Pros_Endereco = @Endereco,
			Pros_Telefone = @Telefone,
			Pros_Contato = @Contato,
			Pros_Usuario = @IdUsuario,
			Pros_Revenda = @IdRevenda,
			Pros_Ativo = @Ativo,
			Pros_Codigo = @Codigo
		WHERE Pros_Id = @Id;
		SET @RetornoId = @Id;
	END
END
GO
EXECUTE Departamento_Acesso_sp_Incluir 113;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.15
-------------------------------------------------------------------------------
CREATE TABLE Orcamento(
	Orc_Id int identity(1,1) NOT NULL,
	Orc_Numero int  NOT NULL,
	Orc_Data date NOT NULL,
	Orc_Usuario int  NOT NULL,
	Orc_Prospect int NOT NULL,
	Orc_Observacao varchar(max),
	Orc_ObservacaoEmail varchar(max)
);
GO
ALTER TABLE Orcamento ADD CONSTRAINT UK_Orcamento_Numero UNIQUE(Orc_Numero);
ALTER TABLE Orcamento ADD CONSTRAINT PK_Orcamento Primary key(Orc_Id);
ALTER TABLE Orcamento ADD CONSTRAINT FK_Orcamento_Usuario
	FOREIGN KEY(Orc_Usuario) REFERENCES Usuario(Usu_Id);
ALTER TABLE Orcamento ADD CONSTRAINT FK_Orcamento_Prospect
	FOREIGN KEY(Orc_Prospect) REFERENCES Prospect(Pros_Id);
GO

CREATE TABLE Orcamento_Item(
	OrcIte_Id int identity(1,1) NOT NULL,
	OrcIte_Orcamento int NOT NULL,
	OrcIte_Produto int NOT NULL,
	OrcIte_Descricao varchar(1000),
	OrcIte_ValorLicencaImpl money,
	OrcIte_ValorDescImpl money,
	OrcIte_ValorLicencaMensal money,
	OrcIte_ValorDescMensal money,
	OrcIte_Tipo int,
	OrcIte_Status int);
GO
ALTER TABLE Orcamento_Item ADD CONSTRAINT PK_Orcamento_Item Primary key(OrcIte_Id);
ALTER TABLE Orcamento_Item ADD CONSTRAINT FK_Orcamento_Item_Orcamento
	FOREIGN KEY(OrcIte_Orcamento) REFERENCES Orcamento(Orc_Id) ON DELETE CASCADE;
ALTER TABLE Orcamento_Item ADD CONSTRAINT FK_Orcamento_Item_Produto
	FOREIGN KEY(OrcIte_Produto) REFERENCES Produto(Prod_Id);
ALTER TABLE Orcamento_Item ADD CONSTRAINT FK_Orcamento_Item_Tipo
	FOREIGN KEY(OrcIte_Tipo) REFERENCES Tipo(Tip_Id);
ALTER TABLE Orcamento_Item ADD CONSTRAINT FK_Orcamento_Item_Status
	FOREIGN KEY(OrcIte_Status) REFERENCES Status(Sta_Id);

CREATE TABLE Orcamento_Item_Modulo(
	OrcIteMod_Id int identity(1,1) NOT NULL,
	OrcIteMod_OrcamentoItem int NOT NULL,
	OrcIteMod_Modulo int NOT NULL,
	OrcIteMod_Descricao varchar(1000)
);
GO
ALTER TABLE Orcamento_Item_Modulo ADD CONSTRAINT PK_Orcamento_Item_Modulo Primary key(OrcIteMod_Id);
ALTER TABLE Orcamento_Item_Modulo ADD CONSTRAINT FK_Orcamento_Item_Modulo_Orcamento
	FOREIGN KEY(OrcIteMod_OrcamentoItem) REFERENCES Orcamento_Item(OrcIte_Id) ON DELETE CASCADE;
ALTER TABLE Orcamento_Item_Modulo ADD CONSTRAINT FK_Orcamento_Item_Modulo_Modulo
	FOREIGN KEY(OrcIteMod_Modulo) REFERENCES Modulo(Mod_Id);
GO

CREATE TABLE Orcamento_Vectos(
	OrcVect_Id int identity(1,1) NOT NULL,
	OrcVect_Orcamento int NOT NULL,
	OrcVect_Parcela int NOT NULL,
	OrcVect_Data date NOT NULL,
	OrcVect_Valor money,
	OrcVect_Descricao varchar(1000)
);
GO
ALTER TABLE Orcamento_Vectos ADD CONSTRAINT PK_Orcamento_Vectos Primary key(OrcVect_Id);
ALTER TABLE Orcamento_Vectos ADD CONSTRAINT FK_Orcamento_Vectos_Orcamento
	FOREIGN KEY(OrcVect_Orcamento) REFERENCES Orcamento(Orc_Id) ON DELETE CASCADE;
ALTER TABLE Orcamento_Vectos ADD CONSTRAINT UK_Orcamento_Vectos UNIQUE(OrcVect_Orcamento, OrcVect_Parcela);
GO

CREATE TABLE Orcamento_Ocorrencia(
	OrcOco_Id int identity(1,1) NOT NULL,
	OrcOco_Orcamento int NOT NULL,
	OrcOco_Data date NOT NULL,
	OrcOco_Usuario int NOT NULL,
	OrcOco_Descricao varchar(1000)
);
GO
ALTER TABLE Orcamento_Ocorrencia ADD CONSTRAINT PK_Orcamento_Ocorrencia Primary key(OrcOco_Id);
ALTER TABLE Orcamento_Ocorrencia ADD CONSTRAINT FK_Orcamento_Ocorrencia_Orcamento
	FOREIGN KEY(OrcOco_Orcamento) REFERENCES Orcamento(Orc_Id) ON DELETE CASCADE;
ALTER TABLE Orcamento_Ocorrencia ADD CONSTRAINT FK_Orcamento_Ocorrencia_Usuario
	FOREIGN KEY(OrcOco_Usuario) REFERENCES Usuario(Usu_Id);
GO
INSERT INTO Parametros(
	Par_Codigo,
	Par_Programa,
	Par_Nome,
	Par_Valor,
	Par_Obs)
VALUES(37,114,'Próximo Número do Orçamento', '1', '');
GO

CREATE PROCEDURE Orcamento_sp_IU(
	@IU char(1),
	@Id int,
	@Numero int,
	@Data date,
	@IdUsuario int,
	@IdProspect int,
	@Obs varchar(max),
	@ObsEmail varchar(max),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento(
			Orc_Numero,
			Orc_Data,
			Orc_Usuario,
			Orc_Prospect,
			Orc_Observacao,
			Orc_ObservacaoEmail)
		VALUES(
			@Numero,
			@Data,
			@IdUsuario,
			@IdProspect,
			@Obs,
			@ObsEmail);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento SET
			Orc_Numero = @Numero,
			Orc_Data = @Data,
			Orc_Usuario = @IdUsuario,
			Orc_prospect = @IdProspect,
			Orc_Observacao = @Obs,
			Orc_ObservacaoEmail = @ObsEmail
		WHERE Orc_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

CREATE PROCEDURE Orcamento_Item_sp_IU(
	@IU char(1),
	@Id int,
	@IdOrcamento int,
	@IdProduto int,
	@Descricao varchar(1000),
	@ValorLicencaImpl money,
	@ValorDescImpl money,
	@ValorLicencaMensal money,
	@ValorDescMensal money,
	@IdTipo int,
	@IdStatus int,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento_Item(
			OrcIte_Orcamento,
			OrcIte_Produto,
			OrcIte_Descricao,
			OrcIte_ValorLicencaImpl,
			OrcIte_ValorDescImpl,
			OrcIte_ValorLicencaMensal,
			OrcIte_ValorDescmensal,
			OrcIte_Tipo,
			OrcIte_Status)
		VALUES(
			@IdOrcamento,
			@IdProduto,
			@Descricao,
			@ValorLicencaImpl,
			@ValorDescImpl,
			@ValorLicencaMensal,
			@ValorDescMensal,
			@IdTipo,
			@IdStatus);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento_Item SET
			OrcIte_Orcamento = @IdOrcamento,
			OrcIte_Produto = @IdProduto,
			OrcIte_Descricao = @Descricao,
			OrcIte_ValorLicencaImpl = @ValorLicencaImpl,
			OrcIte_ValorDescImpl = @ValorDescImpl,
			OrcIte_ValorLicencaMensal = @ValorLicencaMensal,
			OrcIte_ValorDescmensal = @ValorDescMensal,
			OrcIte_Tipo = @IdTipo,
			OrcIte_Status = @IdStatus
		WHERE OrcIte_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

CREATE PROCEDURE Orcamento_Item_Modulo_sp_IU(
	@IU char(1),
	@Id int,
	@IdOrcamentoItem int,
	@IdModulo int,
	@Descricao varchar(1000),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento_Item_Modulo(
			OrcIteMod_OrcamentoItem,
			OrcIteMod_Modulo,
			OrcIteMod_Descricao)
		VALUES(
			@IdOrcamentoItem,
			@IdModulo,
			@Descricao);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento_Item_Modulo SET
			OrcIteMod_OrcamentoItem = @IdOrcamentoItem,
			OrcIteMod_Modulo = @IdModulo,
			OrcIteMod_Descricao = @Descricao
		WHERE OrcIteMod_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

CREATE PROCEDURE Orcamento_Ocorrencia_sp_IU(
	@IU char(1),
	@Id int,
	@IdOrcamento int,
	@Data date,
	@IdUsuario int,
	@Descricao varchar(1000),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento_Ocorrencia(
			OrcOco_Orcamento,
			OrcOco_Data,
			OrcOco_Usuario,
			OrcOco_Descricao)
		VALUES(
			@IdOrcamento,
			@Data,
			@IdUsuario,
			@Descricao);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento_Ocorrencia SET
			OrcOco_Orcamento = @IdOrcamento,
			OrcOco_Data = @Data,
			OrcOco_Usuario = @IdUsuario,
			OrcOco_Descricao = @Descricao
		WHERE OrcOco_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

CREATE PROCEDURE Orcamento_Vectos_sp_IU(
	@IU char(1),
	@Id int,
	@IdOrcamento int,
	@Parcela int,
	@Data date,
	@Valor money,
	@Descricao varchar(1000),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento_Vectos(
			OrcVect_Orcamento,
			OrcVect_Parcela,
			OrcVect_Data,
			OrcVect_Valor,
			OrcVect_Descricao)
		VALUES(
			@IdOrcamento,
			@Parcela,
			@Data,
			@Valor,
			@Descricao);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento_Vectos SET
			OrcVect_Orcamento = @IdOrcamento,
			OrcVect_Parcela = @Parcela,
			OrcVect_Data = @Data,
			OrcVect_Valor = @Valor,
			OrcVect_Descricao = @Descricao		
		WHERE OrcVect_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

EXECUTE Departamento_Acesso_sp_Incluir 114;
GO
ALTER TABLE Orcamento_Vectos ADD CONSTRAINT UK_Orcamento_Vectos_OrcamentoParcela UNIQUE(OrcVect_Orcamento, OrcVect_Parcela);
ALTER TABLE Orcamento_Vectos ADD CONSTRAINT UK_Orcamento_Vectos_OrcamentoData UNIQUE(OrcVect_Orcamento, OrcVect_Data);
GO
CREATE PROCEDURE Chamado_sp_IU(
	@IU char(1),
	@Id int,
	@DataAbertura date,
	@HoraAbertura time,
	@IdCliente int,
	@IdUsuarioAbertura int,
	@Contato varchar(100),
	@Nivel int,
	@IdTipo int,
	@IdStatus int,
	@Descricao varchar(1000),
	@IdModulo int,
	@IdProduto int,
	@IdUsuarioAtendeAtual int,
	@HoraAtendeAtual time,
	@TipoMovimento int,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Chamado(
			Cha_DataAbertura,
			Cha_HoraAbertura,
			Cha_Cliente,
			Cha_UsuarioAbertura,
			Cha_Contato,
			Cha_Nivel,
			Cha_Tipo,
			Cha_Status,
			Cha_Descricao,
			Cha_Modulo,
			Cha_Produto,
			Cha_UsuarioAtendeAtual,
			Cha_HoraAtendeAtual,
			Cha_TipoMovimento)
		VALUES(
			@DataAbertura,
			@HoraAbertura,
			@IdCliente,
			@IdUsuarioAbertura,
			@Contato,
			@Nivel,
			@IdTipo,
			@IdStatus,
			@Descricao,
			@IdModulo,
			@IdProduto,
			@IdUsuarioAtendeAtual,
			@HoraAtendeAtual,
			@TipoMovimento);
		SET @RetornoId = SCOPE_IDENTITY();
	END

	IF (@IU = 'U')
	BEGIN
		UPDATE Chamado SET
			Cha_DataAbertura = @DataAbertura,
			Cha_HoraAbertura = @HoraAbertura,
			Cha_Cliente = @IdCliente,
			Cha_UsuarioAbertura = @IdUsuarioAbertura,
			Cha_Contato = @Contato,
			Cha_Nivel = @Nivel,
			Cha_Tipo = @IdTipo,
			Cha_Status = @IdStatus,
			Cha_Descricao = @Descricao,
			Cha_Modulo = @IdModulo,
			Cha_Produto = @IdProduto,
			Cha_UsuarioAtendeAtual = @IdUsuarioAtendeAtual,
			Cha_HoraAtendeAtual = @HoraAtendeAtual,
			Cha_TipoMovimento = @TipoMovimento
		WHERE Cha_Id = @Id;
		
		SET @RetornoId = @Id;
	END
END
GO
CREATE PROCEDURE ChamadoOcorrencia_sp_IU(
	@IU char(1),
	@Id int,
	@IdChamado int,
	@Docto varchar(25),
	@Data date,
	@HoraInicio time,
	@HoraFim time,
	@idUsuario int,
	@IdUsuarioColab1 int,
	@IdUsuarioColab2 int,
	@IdUsuarioColab3 int,
	@DescricaoTecnica varchar(1000),
	@DescricaoSolucao varchar(2000),
	@Anexo varchar(1000),
	@TotalHoras float,
	@Versao varchar(25),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Chamado_Ocorrencia(
			ChOco_Chamado,
			ChOco_Docto,
			ChOco_Data,
			ChOco_HoraInicio,
			ChOco_HoraFim,
			ChOco_Usuario,
			ChOco_UsuarioColab1,
			ChOco_UsuarioColab2,
			ChOco_UsuarioColab3,
			ChOco_DescricaoTecnica,
			ChOco_DescricaoSolucao,
			ChOco_Anexo,
			ChOco_TotalHoras,
			ChOco_Versao)
		VALUES(
			@IdChamado,
			@Docto,
			@Data,
			@HoraInicio,
			@HoraFim,
			@idUsuario,
			@IdUsuarioColab1,
			@IdUsuarioColab2,
			@IdUsuarioColab3,
			@DescricaoTecnica,
			@DescricaoSolucao,
			@Anexo,
			@TotalHoras,
			@Versao);
		SET @RetornoId = SCOPE_IDENTITY();
	END

	IF (@IU = 'U')
	BEGIN
		UPDATE Chamado_Ocorrencia SET
			ChOco_Chamado = @IdChamado,
			ChOco_Docto = @Docto,
			ChOco_Data = @Data,
			ChOco_HoraInicio = @HoraInicio,
			ChOco_HoraFim = @HoraFim,
			ChOco_Usuario = @idUsuario,
			ChOco_UsuarioColab1 = @IdUsuarioColab1,
			ChOco_UsuarioColab2 = @IdUsuarioColab2,
			ChOco_UsuarioColab3 = @IdUsuarioColab3,
			ChOco_DescricaoTecnica = @DescricaoTecnica,
			ChOco_DescricaoSolucao = @DescricaoSolucao,
			ChOco_Anexo = @Anexo,
			ChOco_TotalHoras = @TotalHoras,
			ChOco_Versao = @Versao
		WHERE ChOco_Id = @Id;
		SET @RetornoId = @Id;
	END
END
GO

ALTER TABLE Solicitacao DROP CONSTRAINT FK_Solicitacao_Solicitacao;
ALTER TABLE Versao DROP CONSTRAINT FK_Versao_Solicitacao
GO
ALTER TABLE Solicitacao DROP COLUMN Sol_Solicitacao;
ALTER TABLE Versao DROP COLUMN Ver_Solicitacao;
GO
ALTER TABLE Versao ADD Ver_Versao varchar(25);
ALTER TABLE Solicitacao ADD Sol_VersaoId int;
GO
ALTER TABLE Solicitacao ADD CONSTRAINT FK_Solicitacao_Versao
	FOREIGN KEY(Sol_VersaoId) REFERENCES Versao(Ver_Id);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.16
-------------------------------------------------------------------------------
ALTER TABLE Orcamento ADD 
	Orc_Cliente int,
	Orc_Situacao int;
GO
ALTER TABLE Orcamento ADD CONSTRAINT FK_Orcamento_Cliente
	FOREIGN KEY(Orc_Cliente) REFERENCES Cliente(Cli_Id);
GO
CREATE TABLE FormaPagto(
	Fpg_Id int identity(1,1) not null,
	Fpg_Codigo int not null,
	Fpg_Nome varchar(100) not null,
	Fpg_Ativo bit not null
);
GO
ALTER TABLE FormaPagto ADD CONSTRAINT Pk_FormaPagto PRIMARY KEY(Fpg_Id);
GO
ALTER TABLE FormaPagto ADD CONSTRAINT UK_FormaPagto_Codigo UNIQUE(Fpg_Codigo);
GO
ALTER TABLE FormaPagto ADD CONSTRAINT UK_FormaPagto_Nome UNIQUE(Fpg_Nome);
GO
CREATE TABLE FormaPagto_Item(
	FpgIte_Id int identity(1,1) not null,
	FpgIte_FormaPagto int not null,
	FpgIte_Dias int not null,
	FpgIte_Obs varchar(100)
);
GO
ALTER TABLE FormaPagto_Item ADD CONSTRAINT Pk_FormaPagto_Item PRIMARY KEY(FpgIte_Id);
GO
ALTER TABLE FormaPagto_Item ADD  CONSTRAINT FK_FormaPagto_Item_FormaPagto FOREIGN KEY(FpgIte_FormaPagto)
REFERENCES FormaPagto (Fpg_Id) ON DELETE CASCADE;
GO
CREATE TABLE Observacao(
	Obs_Id int identity(1,1) not null,
	Obs_Codigo int not null,
	Obs_Descricao varchar(max),
	Obs_Ativo bit not null
);
GO
ALTER TABLE Observacao ADD CONSTRAINT Pk_Observacao PRIMARY KEY(Obs_Id);
GO
ALTER TABLE Observacao ADD CONSTRAINT UK_Observacao_Codigo UNIQUE(Obs_Codigo);
GO
EXECUTE Departamento_Acesso_sp_Incluir 115;
EXECUTE Departamento_Acesso_sp_Incluir 116;
GO
CREATE PROCEDURE Observacao_sp_IU(
	@IU char(1),
	@Id int,
	@Codigo int,
	@Descricao varchar(max),
	@Ativo bit,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Observacao(
			Obs_Ativo,
			Obs_Codigo,
			Obs_Descricao)
		VALUES(
			@Ativo,
			@Codigo,
			@Descricao);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Observacao SET
			Obs_Ativo = @Ativo,
			Obs_Codigo = @Codigo,
			Obs_Descricao = @Descricao
		WHERE Obs_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

ALTER PROCEDURE Orcamento_sp_IU(
	@IU char(1),
	@Id int,
	@Numero int,
	@Data date,
	@IdUsuario int,
	@IdProspect int,
	@Obs varchar(max),
	@ObsEmail varchar(max),
	@IdCliente int,
	@Situacao int,
	@IdFormaPagto int,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento(
			Orc_Numero,
			Orc_Data,
			Orc_Usuario,
			Orc_Prospect,
			Orc_Observacao,
			Orc_ObservacaoEmail,
			Orc_Cliente,
			Orc_Situacao,
			Orc_FormaPagto)
		VALUES(
			@Numero,
			@Data,
			@IdUsuario,
			@IdProspect,
			@Obs,
			@ObsEmail,
			@IdCliente,
			@Situacao,
			@IdFormaPagto);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento SET
			Orc_Numero = @Numero,
			Orc_Data = @Data,
			Orc_Usuario = @IdUsuario,
			Orc_prospect = @IdProspect,
			Orc_Observacao = @Obs,
			Orc_ObservacaoEmail = @ObsEmail,
			Orc_Cliente = @IdCliente,
			Orc_FormaPagto = @IdFormaPagto,
			Orc_Situacao = @Situacao
		WHERE Orc_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

ALTER TABLE Orcamento ADD Orc_FormaPagto int;
GO
ALTER TABLE Orcamento ADD CONSTRAINT FK_Orcamento_FormaPagto
	FOREIGN KEY(Orc_FormaPagto) REFERENCES FormaPagto(Fpg_Id);
GO

ALTER TABLE Orcamento ALTER COLUMN Orc_Prospect int null;
GO
CREATE TABLE Modelo_Relatorio(
	ModR_Id int identity(1,1) NOT NULL,
	ModR_Codigo int NOT NULL,
	ModR_Descricao varchar(200) NOT NULL,
	ModR_Arquivo varchar(200) NOT NULL
);
GO
ALTER TABLE Modelo_Relatorio ADD CONSTRAINT PK_Modelo_Relatorio Primary key(ModR_Id);
ALTER TABLE Modelo_Relatorio ADD CONSTRAINT UK_Modelo_Relatorio_Codigo UNIQUE(ModR_Codigo);
GO
EXECUTE Departamento_Acesso_sp_Incluir 117;
GO

ALTER TABLE Observacao 
	ADD Obs_Nome varchar(100),
	Obs_Programa int,
	Obs_Padrao bit;
GO

ALTER PROCEDURE [dbo].[Observacao_sp_IU](
	@IU char(1),
	@Id int,
	@Codigo int,
	@Descricao varchar(max),
	@Ativo bit,
	@Nome varchar(100),
	@Padrao bit,
	@Programa int,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Observacao(
			Obs_Ativo,
			Obs_Codigo,
			Obs_Descricao,
			Obs_Nome,
			Obs_Programa,
			Obs_Padrao)
		VALUES(
			@Ativo,
			@Codigo,
			@Descricao,
			@Nome,
			@Programa,
			@Padrao);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Observacao SET
			Obs_Ativo = @Ativo,
			Obs_Codigo = @Codigo,
			Obs_Descricao = @Descricao,
			Obs_Nome = @Nome,
			Obs_Programa = @Programa,
			Obs_Padrao = @Padrao
		WHERE Obs_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

CREATE PROCEDURE AjustarID
AS
BEGIN
	DECLARE
		@Tabela nvarchar(50),
		@Campo nvarchar(30),
		@Maximo INT,
		@MaximoSaida INT,
		@Atual INT,
		@Param nvarchar(50),
		@Comando nvarchar(200);

	-- Cursor para percorrer os nomes dos objetos 
	DECLARE cursor_objects CURSOR FOR

		SELECT 
			COLUMN_NAME, 
			name		
		FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
		INNER JOIN sys.Tables ON table_name = name
		WHERE OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + '.' + CONSTRAINT_NAME), 'IsPrimaryKey') = 1
	-- Abrindo Cursor para leitura
	OPEN cursor_objects

	-- Lendo a próxima linha
	FETCH NEXT FROM cursor_objects INTO @Campo, @Tabela

	-- Percorrendo linhas do cursor (enquanto houverem)
	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @Comando= 'SELECT @Maximo=max(' + @Campo + ') FROM ' + @Tabela;
		set @Param = '@Maximo int OUTPUT';
		set @Atual = IDENT_CURRENT(@Tabela);
	
		EXEC sp_executesql @Comando, @Param, @Maximo=@MaximoSaida OUTPUT

		IF (@MaximoSaida <> @Atual)
			DBCC CHECKIDENT(@Tabela, RESEED, @MaximoSaida);

		-- Lendo a próxima linha
		FETCH NEXT FROM cursor_objects INTO @Campo, @Tabela
	END

	-- Fechando Cursor para leitura
	CLOSE cursor_objects

	-- Desalocando o cursor
	DEALLOCATE cursor_objects 
END
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.17
-------------------------------------------------------------------------------
ALTER TABLE Orcamento ADD
	Orc_RazaoSocial varchar(100),
	Orc_Fantasia varchar(100),
	Orc_Endereco varchar(200),
	Orc_Telefone varchar(100),
	Orc_Contato varchar(200),
	Orc_Dcto varchar(25);
GO

ALTER PROCEDURE Orcamento_sp_IU(
	@IU char(1),
	@Id int,
	@Numero int,
	@Data date,
	@IdUsuario int,
	@IdProspect int,
	@Obs varchar(max),
	@ObsEmail varchar(max),
	@IdCliente int,
	@Situacao int,
	@IdFormaPagto int,
	@RazaoSocial varchar(100),
	@Fantasia varchar(100),
	@Endereco varchar(200),
	@Telefone varchar(100),
	@Contato varchar(200),
	@Dcto varchar(25),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento(
			Orc_Numero,
			Orc_Data,
			Orc_Usuario,
			Orc_Prospect,
			Orc_Observacao,
			Orc_ObservacaoEmail,
			Orc_Cliente,
			Orc_Situacao,
			Orc_FormaPagto,
			Orc_RazaoSocial,
			Orc_Fantasia,
			Orc_Endereco,
			Orc_Telefone,
			Orc_Contato,
			Orc_Dcto)
		VALUES(
			@Numero,
			@Data,
			@IdUsuario,
			@IdProspect,
			@Obs,
			@ObsEmail,
			@IdCliente,
			@Situacao,
			@IdFormaPagto,
			@RazaoSocial,
			@Fantasia,
			@Endereco,
			@Telefone,
			@Contato,
			@Dcto);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento SET
			Orc_Numero = @Numero,
			Orc_Data = @Data,
			Orc_Usuario = @IdUsuario,
			Orc_prospect = @IdProspect,
			Orc_Observacao = @Obs,
			Orc_ObservacaoEmail = @ObsEmail,
			Orc_Cliente = @IdCliente,
			Orc_FormaPagto = @IdFormaPagto,
			Orc_Situacao = @Situacao,
			Orc_RazaoSocial = @RazaoSocial,
			Orc_Fantasia = @Fantasia,
			Orc_Endereco = @Endereco,
			Orc_Telefone = @Telefone,
			Orc_Contato = @Contato,
			Orc_Dcto = @Dcto
		WHERE Orc_Id = @Id;

		SET @RetornoId = @Id;
	END
END
GO

CREATE TABLE Orcamento_Email(
	OrcEm_Id int identity(1,1) NOT NULL,
	OrcEm_Orcamento int NOT NULL,
	OrcEm_Email varchar(100) NOT NULL);
GO

ALTER TABLE Orcamento_Email ADD CONSTRAINT PK_Orcamento_Email Primary key(OrcEm_Id);
ALTER TABLE Orcamento_Email ADD  CONSTRAINT FK_Orcamento_Email_Orcamento FOREIGN KEY(OrcEm_Orcamento)
REFERENCES Orcamento (Orc_Id)
ON DELETE CASCADE
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.18
-------------------------------------------------------------------------------
ALTER TABLE Observacao ADD 
	Obs_ObsEmail varchar(2000),
	Obs_EmailPadrao bit;
GO
UPDATE Observacao SET Obs_EmailPadrao = 0;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.19
-------------------------------------------------------------------------------
INSERT INTO dbo.Parametros
(
    Par_Codigo,
    Par_Programa,
    Par_Nome,
    Par_Valor,
    Par_Obs
)
VALUES 
	(38,114,'Data em que foi Enviado o Último Email de Orçamento Aberto','01/01/2016',''),
	(39,114,'Email para Enviar Orçamento Aprovado','eduardo@domper.com.br ','');
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.20
-------------------------------------------------------------------------------
CREATE TABLE Ramal(
	Ram_Id int IDENTITY(1,1) NOT NULL,
	Ram_Departamento VARCHAR(60))
GO

ALTER TABLE Ramal ADD CONSTRAINT Pk_Ramal PRIMARY KEY(Ram_Id)
GO

CREATE TABLE Ramal_Itens(
	RamIt_Id int IDENTITY(1,1) NOT NULL,
	RamIt_Ramal int,
	RamIt_Nome varchar(60),
	RamIt_Numero int)
GO

ALTER TABLE Ramal_Itens ADD CONSTRAINT Pk_Ramal_Itens PRIMARY KEY(RamIt_Id)

ALTER TABLE Ramal_Itens ADD  CONSTRAINT FK_Ramal_Itens_Ramal FOREIGN KEY(RamIt_Ramal)
REFERENCES Ramal (Ram_Id)
ON DELETE CASCADE
GO

INSERT INTO dbo.Parametros
(
    Par_Codigo,
    Par_Programa,
    Par_Nome,
    Par_Valor,
    Par_Obs
)
VALUES 
	(40,114,'Código da Conta do E-mail para enviar Orçamentos em Análise a cada 7 dias','0','');
GO

EXECUTE Departamento_Acesso_sp_Incluir 118;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.21
-------------------------------------------------------------------------------
ALTER TABLE Orcamento ADD Orc_Tipo int;
GO
ALTER TABLE Orcamento ADD  CONSTRAINT FK_Orcamento_Tipo FOREIGN KEY(Orc_Tipo)
REFERENCES Tipo (Tip_Id)
GO
ALTER PROCEDURE [dbo].[Orcamento_sp_IU](
	@IU char(1),
	@Id int,
	@Numero int,
	@Data date,
	@IdUsuario int,
	@IdProspect int,
	@Obs varchar(max),
	@ObsEmail varchar(max),
	@IdCliente int,
	@Situacao int,
	@IdFormaPagto int,
	@RazaoSocial varchar(100),
	@Fantasia varchar(100),
	@Endereco varchar(200),
	@Telefone varchar(100),
	@Contato varchar(200),
	@Dcto varchar(25),
	@IdTipo int,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento(
			Orc_Numero,
			Orc_Data,
			Orc_Usuario,
			Orc_Prospect,
			Orc_Observacao,
			Orc_ObservacaoEmail,
			Orc_Cliente,
			Orc_Situacao,
			Orc_FormaPagto,
			Orc_RazaoSocial,
			Orc_Fantasia,
			Orc_Endereco,
			Orc_Telefone,
			Orc_Contato,
			Orc_Dcto,
			Orc_Tipo)
		VALUES(
			@Numero,
			@Data,
			@IdUsuario,
			@IdProspect,
			@Obs,
			@ObsEmail,
			@IdCliente,
			@Situacao,
			@IdFormaPagto,
			@RazaoSocial,
			@Fantasia,
			@Endereco,
			@Telefone,
			@Contato,
			@Dcto,
			@IdTipo);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento SET
			Orc_Numero = @Numero,
			Orc_Data = @Data,
			Orc_Usuario = @IdUsuario,
			Orc_prospect = @IdProspect,
			Orc_Observacao = @Obs,
			Orc_ObservacaoEmail = @ObsEmail,
			Orc_Cliente = @IdCliente,
			Orc_FormaPagto = @IdFormaPagto,
			Orc_Situacao = @Situacao,
			Orc_RazaoSocial = @RazaoSocial,
			Orc_Fantasia = @Fantasia,
			Orc_Endereco = @Endereco,
			Orc_Telefone = @Telefone,
			Orc_Contato = @Contato,
			Orc_Dcto = @Dcto,
			Orc_Tipo = @IdTipo
		WHERE Orc_Id = @Id;
		SET @RetornoId = @Id;
	END
END
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.22
-------------------------------------------------------------------------------
ALTER TABLE Orcamento ADD Orc_SubTipo int, Orc_EmailEnviado bit;
GO
UPDATE Orcamento SET Orc_SubTipo = 1, Orc_EmailEnviado = 0
GO
ALTER PROCEDURE [dbo].[Orcamento_sp_IU](
	@IU char(1),
	@Id int,
	@Numero int,
	@Data date,
	@IdUsuario int,
	@IdProspect int,
	@Obs varchar(max),
	@ObsEmail varchar(max),
	@IdCliente int,
	@Situacao int,
	@IdFormaPagto int,
	@RazaoSocial varchar(100),
	@Fantasia varchar(100),
	@Endereco varchar(200),
	@Telefone varchar(100),
	@Contato varchar(200),
	@Dcto varchar(25),
	@IdTipo int,
	@SubTipo int,
	@EmailEnviado bit,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento(
			Orc_Numero,
			Orc_Data,
			Orc_Usuario,
			Orc_Prospect,
			Orc_Observacao,
			Orc_ObservacaoEmail,
			Orc_Cliente,
			Orc_Situacao,
			Orc_FormaPagto,
			Orc_RazaoSocial,
			Orc_Fantasia,
			Orc_Endereco,
			Orc_Telefone,
			Orc_Contato,
			Orc_Dcto,
			Orc_Tipo,
			Orc_SubTipo,
			Orc_EmailEnviado)
		VALUES(
			@Numero,
			@Data,
			@IdUsuario,
			@IdProspect,
			@Obs,
			@ObsEmail,
			@IdCliente,
			@Situacao,
			@IdFormaPagto,
			@RazaoSocial,
			@Fantasia,
			@Endereco,
			@Telefone,
			@Contato,
			@Dcto,
			@IdTipo,
			@SubTipo,
			@EmailEnviado);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento SET
			Orc_Numero = @Numero,
			Orc_Data = @Data,
			Orc_Usuario = @IdUsuario,
			Orc_prospect = @IdProspect,
			Orc_Observacao = @Obs,
			Orc_ObservacaoEmail = @ObsEmail,
			Orc_Cliente = @IdCliente,
			Orc_FormaPagto = @IdFormaPagto,
			Orc_Situacao = @Situacao,
			Orc_RazaoSocial = @RazaoSocial,
			Orc_Fantasia = @Fantasia,
			Orc_Endereco = @Endereco,
			Orc_Telefone = @Telefone,
			Orc_Contato = @Contato,
			Orc_Dcto = @Dcto,
			Orc_Tipo = @IdTipo,
			Orc_SubTipo = @SubTipo,
			Orc_EmailEnviado = @EmailEnviado
		WHERE Orc_Id = @Id;
		SET @RetornoId = @Id;
	END
END
GO
DELETE FROM Departamento_Acesso WHERE DepAc_Programa = 113
GO

-------------------------------------------------------------------------------
--VERSAO 1.000.23
-------------------------------------------------------------------------------
ALTER TABLE Orcamento ADD Orc_DataSituacao date;
GO
UPDATE Orcamento SET Orc_DataSituacao = Orc_Data
GO
ALTER PROCEDURE [dbo].[Orcamento_sp_IU](
	@IU char(1),
	@Id int,
	@Numero int,
	@Data date,
	@IdUsuario int,
	@IdProspect int,
	@Obs varchar(max),
	@ObsEmail varchar(max),
	@IdCliente int,
	@Situacao int,
	@IdFormaPagto int,
	@RazaoSocial varchar(100),
	@Fantasia varchar(100),
	@Endereco varchar(200),
	@Telefone varchar(100),
	@Contato varchar(200),
	@Dcto varchar(25),
	@IdTipo int,
	@SubTipo int,
	@EmailEnviado bit,
	@DataSituacao date,
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento(
			Orc_Numero,
			Orc_Data,
			Orc_Usuario,
			Orc_Prospect,
			Orc_Observacao,
			Orc_ObservacaoEmail,
			Orc_Cliente,
			Orc_Situacao,
			Orc_FormaPagto,
			Orc_RazaoSocial,
			Orc_Fantasia,
			Orc_Endereco,
			Orc_Telefone,
			Orc_Contato,
			Orc_Dcto,
			Orc_Tipo,
			Orc_SubTipo,
			Orc_EmailEnviado,
			Orc_DataSituacao)
		VALUES(
			@Numero,
			@Data,
			@IdUsuario,
			@IdProspect,
			@Obs,
			@ObsEmail,
			@IdCliente,
			@Situacao,
			@IdFormaPagto,
			@RazaoSocial,
			@Fantasia,
			@Endereco,
			@Telefone,
			@Contato,
			@Dcto,
			@IdTipo,
			@SubTipo,
			@EmailEnviado,
			@DataSituacao);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento SET
			Orc_Numero = @Numero,
			Orc_Data = @Data,
			Orc_Usuario = @IdUsuario,
			Orc_prospect = @IdProspect,
			Orc_Observacao = @Obs,
			Orc_ObservacaoEmail = @ObsEmail,
			Orc_Cliente = @IdCliente,
			Orc_FormaPagto = @IdFormaPagto,
			Orc_Situacao = @Situacao,
			Orc_RazaoSocial = @RazaoSocial,
			Orc_Fantasia = @Fantasia,
			Orc_Endereco = @Endereco,
			Orc_Telefone = @Telefone,
			Orc_Contato = @Contato,
			Orc_Dcto = @Dcto,
			Orc_Tipo = @IdTipo,
			Orc_SubTipo = @SubTipo,
			Orc_EmailEnviado = @EmailEnviado,
			Orc_DataSituacao = @DataSituacao
		WHERE Orc_Id = @Id;
		SET @RetornoId = @Id;
	END
END
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.24
-------------------------------------------------------------------------------
CREATE TABLE Orcamento_NaoAprovado(
	OrcNAp_Id int IDENTITY(1,1) NOT NULL,
	OrcNAp_Tipo INT NOT NULL,
	OrcNap_Orcamento INT NOT NULL,
	OrcNAp_Descricao VARCHAR(1000)NOT NULL)
GO

ALTER TABLE Orcamento_NaoAprovado ADD CONSTRAINT Pk_Orcamento_NaoAprovado PRIMARY KEY(OrcNAp_Id)
GO

ALTER TABLE Orcamento_NaoAprovado ADD  CONSTRAINT FK_Orcamento_NaoAprovado_Orcamento FOREIGN KEY(OrcNAp_Orcamento)
REFERENCES Orcamento (Orc_Id)
ON DELETE CASCADE
GO

ALTER TABLE Orcamento_NaoAprovado ADD  CONSTRAINT FK_Orcamento_NaoAprovado_Tipo FOREIGN KEY(OrcNAp_Tipo)
REFERENCES Tipo (Tip_Id)
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.25
-------------------------------------------------------------------------------
CREATE TABLE [Recado](
	[Rec_Id] [int] IDENTITY(1,1) NOT NULL,
	[Rec_Data] [date] NOT NULL,
	[Rec_Hora] [time] NOT NULL,
	[Rec_UsuarioLcto] [int] NOT NULL,
	[Rec_Nivel] [int],
	[Rec_Cliente] [int],
	[Rec_RazaoSocial] [varchar](100) NULL,
	[Rec_Fantasia] [varchar](100) NULL,
	[Rec_Endereco] [varchar](200) NULL,
	[Rec_Telefone] [varchar](100) NULL,
	[Rec_Contato] [varchar](200) NULL,
	[Rec_UsuarioDestino] [int] NOT NULL,
	[Rec_Tipo] [int],
	[Rec_Status] [int],
	[Rec_DescricaoInicial] [varchar](1000) NULL,
	[Rec_DataFinal] [date] NULL,
	[Rec_HoraFinal] [time], 
	[Rec_DescricaoFinal] [varchar](1000) NULL);

GO
ALTER TABLE Recado ADD CONSTRAINT Pk_Recados PRIMARY KEY(Rec_Id);

ALTER TABLE Recado ADD  CONSTRAINT FK_Recado_Cliente FOREIGN KEY(Rec_Cliente)
REFERENCES Cliente (Cli_Id);

ALTER TABLE Recado ADD  CONSTRAINT FK_Tipo_Cliente FOREIGN KEY(Rec_Tipo)
REFERENCES Tipo (Tip_Id);

ALTER TABLE Recado ADD  CONSTRAINT FK_Recado_Status FOREIGN KEY(Rec_Status)
REFERENCES Status (Sta_Id);
GO
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(43, 119, 'Status Recados Abertura', '0'),
	(44, 119, 'Status Recados Encerrado', '0');
GO
EXECUTE Departamento_Acesso_sp_Incluir 119;
GO
DELETE FROM Departamento_Acesso WHERE DepAc_Programa = 113
GO
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor, Par_Obs) VALUES 
	(45, 3, 'Status Solicitação para Executar Controle de Tempo', '0', 'Códigos de Status separados por barra (/)');
ALTER TABLE Solicitacao_Tempo ADD STemp_TotalHoras float;
ALTER TABLE Solicitacao_Tempo drop column STemp_HoraFim;
GO
ALTER TABLE Solicitacao_Tempo ADD STemp_HoraFim time;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.26
-------------------------------------------------------------------------------
INSERT INTO Usuario_Permissao(UsuP_Usuario, UsuP_Sigla) SELECT Usu_Id, 'Lib_Solicitacao_Tempo' FROM Usuario
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.27
-------------------------------------------------------------------------------
ALTER TABLE Solicitacao_Tempo ADD STemp_Status int;
GO
ALTER TABLE Solicitacao_Tempo ADD CONSTRAINT FK_SolicitacaoTempo_Status FOREIGN KEY(STemp_Status)
REFERENCES Status (Sta_Id);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.28
-------------------------------------------------------------------------------
CREATE TABLE Rel_Chamado_Temp(
	RelCha_Usuario int,
	RelCha_Revenda int,
	RelCha_Tipo int,
	Mes1 varchar(7),
	Mes2 varchar(7),
	Mes3 varchar(7),
	Mes4 varchar(7),
	Mes5 varchar(7),
	Mes6 varchar(7),
	Mes7 varchar(7),
	Mes8 varchar(7),
	Mes9 varchar(7),
	Mes10 varchar(7),
	Mes11 varchar(7),
	Mes12 varchar(7),
	Valor1 money,
	Valor2 money,
	Valor3 money,
	Valor4 money,
	Valor5 money,
	Valor6 money,
	Valor7 money,
	Valor8 money,
	Valor9 money,
	Valor10 money,
	Valor11 money,
	Valor12 money,
	Qtde1 int,
	Qtde2 int,
	Qtde3 int,
	Qtde4 int,
	Qtde5 int,
	Qtde6 int,
	Qtde7 int,
	Qtde8 int,
	Qtde9 int,
	Qtde10 int,
	Qtde11 int,
	Qtde12 int,
	Horas1 float,
	Horas2 float,
	Horas3 float,
	Horas4 float,
	Horas5 float,
	Horas6 float,
	Horas7 float,
	Horas8 float,
	Horas9 float,
	Horas10 float,
	Horas11 float,
	Horas12 float,
	HorasB1 float,
	HorasB2 float,
	HorasB3 float,
	HorasB4 float,
	HorasB5 float,
	HorasB6 float,
	HorasB7 float,
	HorasB8 float,
	HorasB9 float,
	HorasB10 float,
	HorasB11 float,
	HorasB12 float
)
GO

-------------------------------------------------------------------------------
--VERSAO 1.000.29
-------------------------------------------------------------------------------
ALTER TABLE Agendamento ADD Age_NomeCliente VARCHAR(100)
GO
UPDATE Agendamento 
	SET Age_NomeCliente = (SELECT Cli_Nome FROM Cliente WHERE Age_Cliente = Cli_Id)
GO
ALTER PROCEDURE [dbo].[Agendamento_sp_IU](
	@IU char(1),
	@Id int,
	@Data date,
	@Hora time,
	@IdUsuario int,
	@IdCliente int,
	@Contato varchar(100),
	@Programa int,
	@IdTipo int,
	@IdStatus int,
	@Descricao varchar(500),
	@Motivo varchar(500),
	@IdVisita int,
	@IdAtividade int,
	@NomeCliente varchar(100),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I') -- INSERT
	BEGIN
		INSERT INTO Agendamento(
			Age_Data,
			Age_Hora,
			Age_Usuario,
			Age_Cliente,
			Age_Contato,
			Age_Programa,
			Age_Tipo,
			Age_Status,
			Age_Descricao,
			Age_Motivo,
			Age_Visita,
			Age_NomeCliente,
			Age_Atividade)
		VALUES(
			@Data,
			@Hora,
			@IdUsuario,
			@IdCliente,
			@Contato,
			@Programa,
			@IdTipo,
			@IdStatus,
			@Descricao,
			@Motivo,
			@IdVisita,
			@NomeCliente,
			@IdAtividade
		);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF @IU = 'U'
	BEGIN
		UPDATE Agendamento SET
			Age_Data = @Data,
			Age_Hora = @Hora,
			Age_Usuario = @IdUsuario,
			Age_Cliente = @IdCliente,
			Age_Contato = @Contato,
			Age_Programa = @Programa,
			Age_Tipo = @IdTipo,
			Age_Status = @IdStatus,
			Age_Descricao = @Descricao,
			Age_Motivo = @Motivo,
			Age_Visita = @IdVisita,
			Age_NomeCliente = @NomeCliente,
			Age_Atividade = @IdAtividade
		WHERE Age_Id = @Id;
		SET @RetornoId = @Id;
	END
END
GO

-------------------------------------------------------------------------------
--VERSAO 1.000.30
-------------------------------------------------------------------------------
CREATE TABLE Escala(
	Esc_Id int IDENTITY(1,1) NOT NULL,
	Esc_Data date NOT NULL,
	Esc_Usuario INT NOT NULL,
	Esc_HoraInicio time NOT NULL,
	Esc_HoraFim time NOT NULL,
	Esc_TotalHoras float NOT NULL
	)
GO

ALTER TABLE Escala ADD CONSTRAINT Pk_Escala PRIMARY KEY(Esc_Id);

ALTER TABLE Escala ADD  CONSTRAINT FK_Escala_Usuario FOREIGN KEY(Esc_Usuario)
REFERENCES Usuario (Usu_Id);
GO
EXECUTE Departamento_Acesso_sp_Incluir 120;
GO
CREATE INDEX IX_Chamado_Data ON Chamado(Cha_DataAbertura);
CREATE INDEX IX_Escala_Data ON Escala(Esc_Data);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.31
-------------------------------------------------------------------------------
CREATE INDEX IX_Chamado_Ocorrencia_Data ON Chamado_Ocorrencia(ChOco_Data);
CREATE INDEX IX_Visita_Data ON Visita(Vis_Data);
CREATE INDEX IX_Solicitacao_Tempo_Data ON Solicitacao_Tempo(STemp_Data);
CREATE INDEX IX_Chamado_Cha_HoraAbertura ON Chamado(Cha_HoraAbertura);
CREATE INDEX IX_Escala_Esc_HoraInicio ON Escala(Esc_HoraInicio);
CREATE INDEX IX_Escala_Esc_HoraFim ON Escala(Esc_HoraFim);
-------------------------------------------------------------------------------
--VERSAO 1.000.32
-------------------------------------------------------------------------------
CREATE FUNCTION UsuarioRendimentoDias (@IdUsuario int, @DataInicial Date, @DataFinal Date) 

RETURNS int
BEGIN
	DECLARE 
		@QtdeChamado int,
		@QtdeAtividade int,
		@QtdeVisitas int,
		@QtdeSolicitacao int,
		@QtdeEscalas int,
		@Qtde int,
		@QtdeEscala int,
		@Total int;
	
	--SET @IdUsuario = 12;
	--SET @DataInicial = '2017-01-01';
	--SET @DataFinal = '2017-01-31';
		
	SELECT
		@Qtde = COUNT(IdUsuario)		
	FROM 
	(
	-------------------------------------------------------------------------------
	-- Chamado
	-------------------------------------------------------------------------------
	SELECT
		DISTINCT 
		ChOco_Usuario As IdUsuario,
		ChOco_Data AS Data
	FROM Chamado
	INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
		WHERE ChOco_Data BETWEEN @DataInicial AND @DataFinal
		AND Cha_TipoMovimento = 1
		AND ChOco_Usuario = @IdUsuario		
	-------------------------------------------------------------------------------
	-- Atividades
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT
		ChOco_Usuario AS IdUsuario,
		 ChOco_Data AS Data
	FROM Chamado
		INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
		WHERE ChOco_Data BETWEEN @DataInicial AND @DataFinal
		AND Cha_TipoMovimento = 2
		AND ChOco_Usuario = @IdUsuario	
	-------------------------------------------------------------------------------
	-- Visitas
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT 
		Vis_Usuario AS IdUsuario,
		Vis_Data AS Data
	FROM Visita
		WHERE Vis_Data  BETWEEN @DataInicial AND @DataFinal
		AND Vis_Usuario = @IdUsuario

	-------------------------------------------------------------------------------
	-- Solicitacoes
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT 
		STemp_UsuarioOperacional AS IdUsuario,
		STemp_Data AS Data
	FROM Solicitacao
	INNER JOIN Solicitacao_Tempo ON Sol_Id = STemp_Solicitacao
		WHERE STemp_Data  BETWEEN @DataInicial AND @DataFinal
		AND STemp_UsuarioOperacional = @IdUsuario

	) AS Resultado

	-------------------------------------------------------------------------------
	-- Escalas
	-------------------------------------------------------------------------------
	SELECT
		@QtdeEscala = COUNT(distinct Esc_Data)
	FROM Escala
	INNER JOIN Usuario ON Esc_Usuario = Usu_Id
	INNER JOIN Chamado ON Esc_Usuario = Cha_UsuarioAbertura
	INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
	WHERE Cha_TipoMovimento = 1
	AND Cha_UsuarioAbertura = @IdUsuario
	AND Esc_Data BETWEEN @DataInicial AND @DataFinal
	--AND Cha_HoraAbertura BETWEEN Esc_HoraInicio AND Esc_HoraFim	
	AND ((Cha_HoraAbertura >= Esc_HoraInicio) AND (Cha_HoraAbertura <= Esc_HoraInicio))

	SET @Total = @Qtde - @QtdeEscala;

	IF (@Total < 0)
		SET @Total = 0;

	RETURN @Total;
END;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.33
-------------------------------------------------------------------------------
CREATE TABLE Cidade(
	Cid_Id int IDENTITY(1,1) NOT NULL,
	Cid_Codigo int NOT NULL,
	Cid_Nome varchar(60) NOT NULL,
	Cid_UF char(2),
	Cid_Ativo bit
	)
GO
ALTER TABLE Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY(Cid_Id);
ALTER TABLE Cidade ADD CONSTRAINT UK_Cidade_Codigo UNIQUE(Cid_Codigo);
CREATE INDEX IX_Cidade_Nome ON Cidade(Cid_Nome);
GO

ALTER TABLE Cliente ADD 
	Cli_Logradouro varchar(80),
	Cli_Bairro varchar(50),
	Cli_CEP varchar(15),
	Cli_Cidade int;

ALTER TABLE Orcamento ADD
	Orc_Logradouro varchar(80),
	Orc_Bairro varchar(50),
	Orc_CEP varchar(15),
	Orc_Cidade int,
	Orc_Enquadramento char(2);
GO
ALTER TABLE Cliente ADD CONSTRAINT FK_Cliente_Cidade FOREIGN KEY(Cli_Cidade)
	REFERENCES Cidade(Cid_Id);

ALTER TABLE Orcamento ADD CONSTRAINT FK_Orcamento_Cidade FOREIGN KEY(Orc_Cidade)
	REFERENCES Cidade(Cid_Id);
GO
EXECUTE Departamento_Acesso_sp_Incluir 121;
GO
ALTER TABLE Cliente ADD
	Cli_Fone1 varchar(20),
	Cli_Fone2 varchar(20),
	Cli_Celular varchar(20),
	Cli_FoneOutro varchar(60),
	Cli_ContatoFinanceiro varchar(60),
	Cli_ContatoFinanceiroFone varchar(20),
	Cli_ContatoCompraVenda varchar(60),
	Cli_ContatoCompraVendaFone varchar(60),
	Cli_IE varchar(25),
	Cli_RepreLegal varchar(60),
	Cli_RepreLegalCPF varchar(20);
GO

ALTER TABLE Orcamento ADD
	Orc_Fone1 varchar(20),
	Orc_Fone2 varchar(20),
	Orc_Celular varchar(20),
	Orc_FoneOutro varchar(20),
	Orc_ContatoFinanceiro varchar(60),
	Orc_ContatoFinanceiroFone varchar(20),
	Orc_ContatoCompraVenda varchar(60),
	Orc_ContatoCompraVendaFone varchar(20),
	Orc_IE varchar(25),
	Orc_RepreLegal varchar(60),
	Orc_RepreLegalCPF varchar(20);
GO
ALTER PROCEDURE Orcamento_sp_IU(
	@IU char(1),
	@Id int,
	@Numero int,
	@Data date,
	@IdUsuario int,
	@IdProspect int,
	@Obs varchar(max),
	@ObsEmail varchar(max),
	@IdCliente int,
	@Situacao int,
	@IdFormaPagto int,
	@RazaoSocial varchar(100),
	@Fantasia varchar(100),
	@Endereco varchar(200),
	@Telefone varchar(100),
	@Contato varchar(200),
	@Dcto varchar(25),
	@IdTipo int,
	@SubTipo int,
	@EmailEnviado bit,
	@DataSituacao date,
	@Logradouro varchar(80),
	@Bairro varchar(50),
	@CEP varchar(15),
	@IdCidade int,
	@Fone1 varchar(20),
	@Fone2 varchar(20),
	@Celular varchar(20),
	@FoneOutro varchar(20),
	@ContatoFinanceiro varchar(60),
	@ContatoFinanceiroFone varchar(20),
	@ContatoCompraVenda varchar(60),
	@ContatoCompraVendaFone varchar(20),
	@IE varchar(25),
	@RepreLegal varchar(60),
	@RepreLegalCPF varchar(20),
	@Enquadramento char(2),
	@RetornoId int OUTPUT
)
AS
BEGIN
	IF (@IU = 'I')
	BEGIN
		INSERT INTO Orcamento(
			Orc_Numero,
			Orc_Data,
			Orc_Usuario,
			Orc_Prospect,
			Orc_Observacao,
			Orc_ObservacaoEmail,
			Orc_Cliente,
			Orc_Situacao,
			Orc_FormaPagto,
			Orc_RazaoSocial,
			Orc_Fantasia,
			Orc_Endereco,
			Orc_Telefone,
			Orc_Contato,
			Orc_Dcto,
			Orc_Tipo,
			Orc_SubTipo,
			Orc_EmailEnviado,
			Orc_DataSituacao,
			Orc_Logradouro,
			Orc_Bairro,
			Orc_CEP,
			Orc_Cidade,
			Orc_Fone1,
			Orc_Fone2,
			Orc_Celular,
			Orc_FoneOutro,
			Orc_ContatoFinanceiro,
			Orc_ContatoFinanceiroFone,
			Orc_ContatoCompraVenda,
			Orc_ContatoCompraVendaFone,
			Orc_IE,
			Orc_RepreLegal,
			Orc_RepreLegalCPF,
			Orc_Enquadramento)
		VALUES(
			@Numero,
			@Data,
			@IdUsuario,
			@IdProspect,
			@Obs,
			@ObsEmail,
			@IdCliente,
			@Situacao,
			@IdFormaPagto,
			@RazaoSocial,
			@Fantasia,
			@Endereco,
			@Telefone,
			@Contato,
			@Dcto,
			@IdTipo,
			@SubTipo,
			@EmailEnviado,
			@DataSituacao,
			@Logradouro,
			@Bairro,
			@CEP,
			@IdCidade,
			@Fone1,
			@Fone2,
			@Celular,
			@FoneOutro,
			@ContatoFinanceiro,
			@ContatoFinanceiroFone,
			@ContatoCompraVenda,
			@ContatoCompraVendaFone,
			@IE,
			@RepreLegal,
			@RepreLegalCPF,
			@Enquadramento);
		SET @RetornoId = SCOPE_IDENTITY();
	END
	IF (@IU = 'U')
	BEGIN
		UPDATE Orcamento SET
			Orc_Numero = @Numero,
			Orc_Data = @Data,
			Orc_Usuario = @IdUsuario,
			Orc_prospect = @IdProspect,
			Orc_Observacao = @Obs,
			Orc_ObservacaoEmail = @ObsEmail,
			Orc_Cliente = @IdCliente,
			Orc_FormaPagto = @IdFormaPagto,
			Orc_Situacao = @Situacao,
			Orc_RazaoSocial = @RazaoSocial,
			Orc_Fantasia = @Fantasia,
			Orc_Endereco = @Endereco,
			Orc_Telefone = @Telefone,
			Orc_Contato = @Contato,
			Orc_Dcto = @Dcto,
			Orc_Tipo = @IdTipo,
			Orc_SubTipo = @SubTipo,
			Orc_EmailEnviado = @EmailEnviado,
			Orc_DataSituacao = @DataSituacao,
			Orc_Logradouro = @Logradouro,
			Orc_Bairro = @Bairro,
			Orc_CEP = @CEP,
			Orc_Cidade = @IdCidade,
			Orc_Fone1 = @Fone1,
			Orc_Fone2 = @Fone2,
			Orc_Celular = @Celular,
			Orc_FoneOutro = @FoneOutro,
			Orc_ContatoFinanceiro = @ContatoFinanceiro,
			Orc_ContatoFinanceiroFone = @ContatoFinanceiroFone,
			Orc_ContatoCompraVenda = @ContatoCompraVenda,
			Orc_ContatoCompraVendaFone = @ContatoCompraVendaFone,
			Orc_IE = @IE,
			Orc_RepreLegal = @RepreLegal,
			Orc_RepreLegalCPF = @RepreLegalCPF,
			Orc_Enquadramento = @Enquadramento
		WHERE Orc_Id = @Id;
		SET @RetornoId = @Id;
	END
END
GO

CREATE TABLE Contato(
	Cont_Id int IDENTITY(1,1) NOT NULL,
	Cont_Cliente INT,
	Cont_Orcamento INT,
	Cont_Nome VARCHAR(100),
	Cont_Fone1 VARCHAR(25),
	Cont_Fone2 VARCHAR(25),
	Cont_Depto VARCHAR(60),
	Cont_Email VARCHAR(100)
	)
GO

ALTER TABLE Contato ADD CONSTRAINT PK_Cliente_Contato PRIMARY KEY(Cont_Id);
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_Cliente FOREIGN KEY(Cont_Cliente)
	REFERENCES Cliente(Cli_Id) ON DELETE CASCADE;
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_Orcamento FOREIGN KEY(Cont_Orcamento)
	REFERENCES Orcamento(Orc_Id) ON DELETE CASCADE;
GO

-------------------------------------------------------------------------------
--VERSAO 1.000.34
-------------------------------------------------------------------------------
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(46, 3, 'Status Solicitação para Encerrar', '0');
GO

UPDATE Parametros SET Par_Valor = '18' WHERE Par_Codigo = 46;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.35
-------------------------------------------------------------------------------
CREATE TABLE Licenca(
	Lic_Id int IDENTITY(1,1) NOT NULL,
	Lic_Codigo int,
	Lic_CNPJCPF varchar(25),
	Lic_Empresa varchar(250),
	Lic_QtdeEstacao integer,
	Lic_QtdeUsuario integer,
	Lic_IPExterno varchar(25),
	Lic_DataAtualizacao date,
	Lic_Build varchar(25),
	Lic_IPLocal varchar(25),
	Lic_Cliente int
);
GO
CREATE TABLE Licenca_Itens(
	LicIte_Id int IDENTITY(1,1) NOT NULL,
	LicIte_Codigo int NOT NULL,
	LicIte_CNPJCPF varchar(25),
	LicIte_DataLcto date,
	LicIte_Licenca varchar(50),
	LicIte_DataUtilizacao date,
	LicIte_Situacao char(1),
	LicIte_Utilizada CHAR(1),
	LicIte_Cliente int
)
GO
ALTER TABLE Licenca ADD CONSTRAINT PK_Licenca PRIMARY KEY(Lic_Id);
ALTER TABLE Licenca_Itens ADD CONSTRAINT PK_Licenca_Itens PRIMARY KEY(LicIte_Id);
CREATE INDEX IDX_Licenca_Lic_CPFCNPJ ON Licenca (Lic_CNPJCPF);
CREATE INDEX IDX_Licenca_Itens_LicIte_CPFCNPJ ON Licenca_Itens (LicIte_CNPJCPF);
GO

ALTER TABLE Licenca ADD CONSTRAINT FK_Licenca_Cliente FOREIGN KEY(Lic_Cliente)
	REFERENCES Cliente(Cli_Id);
ALTER TABLE Licenca_Itens ADD CONSTRAINT FK_Licenca_Itens_Cliente FOREIGN KEY(LicIte_Cliente)
	REFERENCES Cliente(Cli_Id);
GO

INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(47, 122, 'Caminho do aplicativo para importar licenças', 'C:\');
GO
EXECUTE Departamento_Acesso_sp_Incluir 122;
GO
-------------------------------------------------------------------------------
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(49, NULL, 'Caminho para direcionar os anexos do sistema', 'P:\SIDomper\Anexos');

INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(48, 4, 'Status de Desenvolvimento ao abrir Versões', '32');

ALTER TABLE Departamento ADD Dep_MostrarAnexos BIT;
GO

UPDATE Departamento SET Dep_MostrarAnexos = 1 WHERE Dep_MostrarAnexos IS NULL;
UPDATE Parametros SET Par_Obs = 'NÃO MAIS USADO' WHERE Par_Codigo = 2;
GO
ALTER TABLE Modelo_Relatorio ADD ModR_Revenda int;
GO
ALTER TABLE Modelo_Relatorio ADD CONSTRAINT FK_ModeloRelatorio_Revenda FOREIGN KEY(ModR_Revenda)
	REFERENCES Revenda(Rev_Id);
GO
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(50, NULL, 'Revenda padrão para o quadro', '1');
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.36
-------------------------------------------------------------------------------
INSERT INTO Parametros(Par_Codigo, Par_Programa, Par_Nome, Par_Valor) VALUES 
	(51, 2, 'Tipo Visita Atualização de Versão', '0');
GO
ALTER TABLE Visita ADD Vis_Versao VARCHAR(25);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.37
-------------------------------------------------------------------------------
ALTER TABLE Cliente ADD Cli_EmpresaVinculada int;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.38
-------------------------------------------------------------------------------
CREATE FUNCTION Visita_Ultima 
(
	@IdCliente INT
)
RETURNS INT
AS
BEGIN
	DECLARE 
		@Resultado INT,
		@UltimaData Date;

	SELECT TOP(1) @UltimaData= MAX(Vis_Data) FROM Visita 
		WHERE Vis_Cliente = @IdCliente;

	SET @Resultado = DATEDIFF(DAY, @UltimaData, CAST(GETDATE() AS date));

	RETURN @Resultado;
END
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.39
-------------------------------------------------------------------------------
ALTER TABLE Cliente ADD Cli_Latitude VARCHAR(100), Cli_Longitude VARCHAR(100);
ALTER TABLE Visita ADD Vis_Latitude VARCHAR(100), Vis_Longitude VARCHAR(100);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.40
-------------------------------------------------------------------------------
CREATE TABLE Feriado(
	Fer_Id int IDENTITY(1,1) NOT NULL,
	Fer_Data date NOT NULL,
	Fer_Descricao varchar(100)
)
GO
ALTER TABLE Feriado ADD CONSTRAINT PK_Feriado PRIMARY KEY(Fer_Id);
ALTER TABLE Feriado ADD CONSTRAINT UK_Feriado_Data UNIQUE(Fer_Data);
GO

EXEC Departamento_Acesso_sp_Incluir 123;
GO
ALTER FUNCTION [dbo].[UsuarioRendimentoDias] (@IdUsuario int, @DataInicial Date, @DataFinal Date) 
RETURNS int
BEGIN
	DECLARE 
		@QtdeChamado int,
		@QtdeAtividade int,
		@QtdeVisitas int,
		@QtdeSolicitacao int,
		@QtdeEscalas int,
		@Qtde int,
		@QtdeEscala int,
		@Total int,
		@Feriado int;
	--SET @IdUsuario = 12;
	--SET @DataInicial = '2017-01-01';
	--SET @DataFinal = '2017-01-31';
	SELECT
		@Qtde = COUNT(IdUsuario)		
	FROM 
	(
	-------------------------------------------------------------------------------
	-- Chamado
	-------------------------------------------------------------------------------
	SELECT
		DISTINCT 
		ChOco_Usuario As IdUsuario,
		ChOco_Data AS Data
	FROM Chamado
	INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
		WHERE ChOco_Data BETWEEN @DataInicial AND @DataFinal
		AND Cha_TipoMovimento = 1
		AND ChOco_Usuario = @IdUsuario		
	-------------------------------------------------------------------------------
	-- Atividades
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT
		ChOco_Usuario AS IdUsuario,
		 ChOco_Data AS Data
	FROM Chamado
		INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
		WHERE ChOco_Data BETWEEN @DataInicial AND @DataFinal
		AND Cha_TipoMovimento = 2
		AND ChOco_Usuario = @IdUsuario	
	-------------------------------------------------------------------------------
	-- Visitas
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT 
		Vis_Usuario AS IdUsuario,
		Vis_Data AS Data
	FROM Visita
		WHERE Vis_Data  BETWEEN @DataInicial AND @DataFinal
		AND Vis_Usuario = @IdUsuario
	-------------------------------------------------------------------------------
	-- Solicitacoes
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT 
		STemp_UsuarioOperacional AS IdUsuario,
		STemp_Data AS Data
	FROM Solicitacao
	INNER JOIN Solicitacao_Tempo ON Sol_Id = STemp_Solicitacao
		WHERE STemp_Data  BETWEEN @DataInicial AND @DataFinal
		AND STemp_UsuarioOperacional = @IdUsuario
	) AS Resultado
	-------------------------------------------------------------------------------
	-- Escalas
	-------------------------------------------------------------------------------
	SELECT
		@QtdeEscala = COUNT(distinct Esc_Data)
	FROM Escala
	INNER JOIN Usuario ON Esc_Usuario = Usu_Id
	INNER JOIN Chamado ON Esc_Usuario = Cha_UsuarioAbertura
	INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
	WHERE Cha_TipoMovimento = 1
	AND Cha_UsuarioAbertura = @IdUsuario
	AND Esc_Data BETWEEN @DataInicial AND @DataFinal
	AND ((Cha_HoraAbertura >= Esc_HoraInicio) AND (Cha_HoraAbertura <= Esc_HoraInicio))
	AND ((DATEPART(dw, Esc_Data) = 1) OR (DATEPART(dw, Esc_Data) = 7));

	SELECT 
		@Feriado = COUNT(DISTINCT Fer_Data) 
	FROM Feriado
	WHERE Fer_Data BETWEEN @DataInicial AND @DataFinal;

	SET @Total = @Qtde - @QtdeEscala - @Feriado;
	IF (@Total < 0)
		SET @Total = 0;
	RETURN @Total;
END;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.41
-------------------------------------------------------------------------------
ALTER FUNCTION UsuarioRendimentoDias (@IdUsuario int, @DataInicial Date, @DataFinal Date) 
RETURNS int
BEGIN
	DECLARE 
		@QtdeChamado int,
		@QtdeAtividade int,
		@QtdeVisitas int,
		@QtdeSolicitacao int,
		@QtdeEscalas int,
		@Qtde int,
		@QtdeEscala int,
		@Total int;
		--@Feriado int;
	--SET @IdUsuario = 12;
	--SET @DataInicial = '2017-01-01';
	--SET @DataFinal = '2017-01-31';
	SELECT
		@Qtde = COUNT(IdUsuario)		
	FROM 
	(
	-------------------------------------------------------------------------------
	-- Chamado
	-------------------------------------------------------------------------------
	SELECT
		DISTINCT 
		ChOco_Usuario As IdUsuario,
		ChOco_Data AS Data
	FROM Chamado
	INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
		WHERE ChOco_Data BETWEEN @DataInicial AND @DataFinal
		AND Cha_TipoMovimento = 1
		AND ChOco_Usuario = @IdUsuario
		AND NOT EXISTS(
			SELECT 
				1 
			FROM Feriado
				WHERE Fer_Data = ChOco_Data
		)		
	-------------------------------------------------------------------------------
	-- Atividades
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT
		ChOco_Usuario AS IdUsuario,
		 ChOco_Data AS Data
	FROM Chamado
		INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
		WHERE ChOco_Data BETWEEN @DataInicial AND @DataFinal
		AND Cha_TipoMovimento = 2
		AND ChOco_Usuario = @IdUsuario
		AND NOT EXISTS(
			SELECT 
				1 
			FROM Feriado
				WHERE Fer_Data = ChOco_Data
		)	
	-------------------------------------------------------------------------------
	-- Visitas
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT 
		Vis_Usuario AS IdUsuario,
		Vis_Data AS Data
	FROM Visita
		WHERE Vis_Data  BETWEEN @DataInicial AND @DataFinal
		AND Vis_Usuario = @IdUsuario
		AND NOT EXISTS(
			SELECT 
				1 
			FROM Feriado
				WHERE Fer_Data = Vis_Data
		)
	-------------------------------------------------------------------------------
	-- Solicitacoes
	-------------------------------------------------------------------------------
	UNION
	SELECT
		DISTINCT 
		STemp_UsuarioOperacional AS IdUsuario,
		STemp_Data AS Data
	FROM Solicitacao
	INNER JOIN Solicitacao_Tempo ON Sol_Id = STemp_Solicitacao
		WHERE STemp_Data  BETWEEN @DataInicial AND @DataFinal
		AND STemp_UsuarioOperacional = @IdUsuario
		AND NOT EXISTS(
			SELECT 
				1 
			FROM Feriado
				WHERE Fer_Data = STemp_Data
		)
	) AS Resultado
	-------------------------------------------------------------------------------
	-- Escalas
	-------------------------------------------------------------------------------
	SELECT
		@QtdeEscala = COUNT(distinct Esc_Data)
	FROM Escala
	INNER JOIN Usuario ON Esc_Usuario = Usu_Id
	INNER JOIN Chamado ON Esc_Usuario = Cha_UsuarioAbertura
	INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado
	WHERE Cha_TipoMovimento = 1
	AND Cha_UsuarioAbertura = @IdUsuario
	AND Esc_Data BETWEEN @DataInicial AND @DataFinal
	AND ((Cha_HoraAbertura >= Esc_HoraInicio) AND (Cha_HoraAbertura <= Esc_HoraInicio))
	AND ((DATEPART(dw, Esc_Data) = 1) OR (DATEPART(dw, Esc_Data) = 7))
	AND NOT EXISTS(
			SELECT 
				1 
			FROM Feriado
				WHERE Fer_Data = Esc_Data
		)

	SET @Total = @Qtde - @QtdeEscala;
	IF (@Total < 0)
		SET @Total = 0;
	RETURN @Total;
END;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.42
-------------------------------------------------------------------------------
ALTER TABLE Cliente ADD Cli_Perfil VARCHAR(20);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.43
-------------------------------------------------------------------------------
ALTER TABLE VERSAO ADD Ver_Produto INT
GO

ALTER TABLE [dbo].[Versao]  ADD  CONSTRAINT [FK_Versao_Produto] FOREIGN KEY([Ver_Produto])
REFERENCES [dbo].[Produto] ([Prod_Id])
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.44
-------------------------------------------------------------------------------
INSERT INTO Usuario_Permissao(UsuP_Usuario, UsuP_Sigla) SELECT Usu_Id, 'Lib_Solicitacao_Ocorr_Regra_Alt' FROM Usuario
INSERT INTO Usuario_Permissao(UsuP_Usuario, UsuP_Sigla) SELECT Usu_Id, 'Lib_Solicitacao_Ocorr_Regra_Exc' FROM Usuario
GO
ALTER TABLE Departamento ADD Dep_SolicitaOcorRegra BIT;
GO
UPDATE Departamento SET Dep_SolicitaOcorRegra = 0 WHERE Dep_SolicitaOcorRegra IS NULL;
GO
ALTER TABLE Departamento ADD Dep_HoraAtendeInicial time, Dep_HoraAtendeFinal time;
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.45
-------------------------------------------------------------------------------
CREATE TABLE Categoria(
	Cat_Id int IDENTITY(1,1) NOT NULL,
	Cat_Codigo int NOT NULL,
	Cat_Nome VARCHAR(100) NOT NULL,
	Cat_Ativo bit not null);
GO
ALTER TABLE Categoria ADD CONSTRAINT Pk_Categoria PRIMARY KEY(Cat_Id);
GO
ALTER TABLE Categoria ADD CONSTRAINT UK_Categoria_Codigo UNIQUE(Cat_Codigo);
ALTER TABLE Categoria ADD CONSTRAINT UK_Categoria_Nome UNIQUE(Cat_Nome);
GO
ALTER TABLE Solicitacao ADD Sol_Categoria int;
GO
ALTER TABLE [dbo].[Solicitacao]  ADD  CONSTRAINT [FK_Solicitacao_Categoria] FOREIGN KEY([Sol_Categoria])
REFERENCES [dbo].[Categoria] ([Cat_Id]);
GO
EXEC Departamento_Acesso_sp_Incluir 124;
GO
CREATE INDEX IDX_Solicitacao_Data ON Solicitacao(Sol_Data);
GO
-------------------------------------------------------------------------------
--VERSAO 1.000.46
-------------------------------------------------------------------------------
CREATE TABLE TabPreco(
	Tab_Id int IDENTITY(1,1) NOT NULL,
	Tab_Data DATE NOT NULL,
	Tab_Referencia varchar(30),
	Tab_Nome varchar(100) NOT NULL,
	Tab_Produto int,
	Tab_Status int,
	Tab_Tipo int,
	Tab_Ativo bit,
	Tab_ValorImplSimples Numeric(15,2),
	Tab_ValorMensalSimples Numeric(15,2),
	Tab_Observacao varchar(2000),
	Tab_ValorImplRegNormal Numeric(15,2),
	Tab_ValorMensalRegNormal Numeric(15,2)
)
GO
ALTER TABLE TabPreco ADD CONSTRAINT PK_TabPreco PRIMARY KEY(Tab_Id);
GO
ALTER TABLE TabPreco ADD CONSTRAINT FK_TabPreco_Produto
	FOREIGN KEY(Tab_Produto) REFERENCES Produto(Prod_Id);

ALTER TABLE TabPreco ADD CONSTRAINT FK_TabPreco_Status
	FOREIGN KEY(Tab_Status) REFERENCES Status(Sta_Id);

ALTER TABLE TabPreco ADD CONSTRAINT FK_TabPreco_Tipo
	FOREIGN KEY(Tab_Tipo) REFERENCES Tipo(Tip_Id);
GO

CREATE TABLE TabPreco_Modulo(
	TabM_Id int IDENTITY(1,1) NOT NULL,
	TabM_TabPreco int NOT NULL,
	TabM_Modulo int NOT NULL
)
GO
ALTER TABLE TabPreco_Modulo ADD CONSTRAINT PK_TabPreco_Modulo PRIMARY KEY(TabM_Id);
GO
ALTER TABLE TabPreco_Modulo ADD CONSTRAINT FK_TabPrecoModulo_TabPreco
	FOREIGN KEY(TabM_TabPreco) REFERENCES TabPreco(Tab_Id)
	ON DELETE CASCADE;
ALTER TABLE TabPreco_Modulo ADD CONSTRAINT FK_TabPrecoModulo_Modulo
	FOREIGN KEY(TabM_Modulo) REFERENCES Modulo(Mod_Id)
GO

EXEC Departamento_Acesso_sp_Incluir 125;
GO

INSERT INTO dbo.Parametros
(
    Par_Codigo,
    Par_Programa,
    Par_Nome,
    Par_Valor,
    Par_Obs
)
VALUES 
	(52,125,'Tabela de Preço Vigente','0','ID da Tabela de Preços Padrão!');
GO

-------------------------------------------------------------------------------
--VERSAO 1.000.47
-------------------------------------------------------------------------------
INSERT INTO dbo.Parametros
(
    Par_Codigo,
    Par_Programa,
    Par_Nome,
    Par_Valor,
    Par_Obs
)
VALUES 
	(53,0,'Data e Hora do SIDomper Cliente','0','');
GO
