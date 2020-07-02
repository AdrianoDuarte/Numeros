program Numeros;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal} ,
  uNotificacao in 'uNotificacao.pas' {frmNotificacao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmNotificacao, frmNotificacao);
  Application.ShowMainForm := False;
  frmPrincipal.StartClipBoardMonitor;
  Application.Run;
end.
