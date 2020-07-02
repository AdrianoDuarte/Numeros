unit uNotificacao;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TfrmNotificacao = class(TForm)
    lblTitulo: TLabel;
    lblMensagem: TLabel;
    imgNotificacao: TImage;
    tmrDesaparecer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure tmrDesaparecerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNotificacao: TfrmNotificacao;

implementation

{$R *.dfm}

procedure TfrmNotificacao.FormCreate(Sender: TObject);
begin
  Left := Screen.Width - Width;
  Top := 200;
end;

procedure TfrmNotificacao.tmrDesaparecerTimer(Sender: TObject);
begin
  AlphaBlendValue := AlphaBlendValue - 5;
  Application.ProcessMessages;
  if AlphaBlendValue < 5 then
  begin
    tmrDesaparecer.Enabled := False;
    Hide;
  end;
end;

end.
