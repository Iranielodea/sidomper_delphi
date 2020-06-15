unit uTeste;

interface

uses
  System.SysUtils, Datasnap.DSTCPServerTransport,
  Datasnap.DSServer, Datasnap.DSCommonServer,
  Datasnap.DSAuth, IPPeerServer, System.Classes;

type
  {$METHODINFO ON}
  TTeste = class(TPersistent)
  private

  public
    procedure MostrarMensagem(Texto: string);
  end;

implementation

{ TTeste }

procedure TTeste.MostrarMensagem(Texto: string);
begin
  raise Exception.Create(Texto);
end;

end.
