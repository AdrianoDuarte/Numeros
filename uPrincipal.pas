unit uPrincipal;

interface

uses
  System.Classes,
  System.StrUtils,
  System.SysUtils,
  Vcl.Clipbrd,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.Imaging.pngimage,
  Vcl.Menus,
  Vcl.StdCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TfrmPrincipal = class(TForm)
    tiNumeros: TTrayIcon;
    pumPrincipal: TPopupMenu;
    ppmAbrir: TMenuItem;
    N1: TMenuItem;
    ppmSair: TMenuItem;
    tmrNotificacao: TTimer;
    grbOpcoes: TGroupBox;
    chbCNPJV: TCheckBox;
    chbCNPJINV: TCheckBox;
    chbCPFV: TCheckBox;
    chbCPFINV: TCheckBox;
    lblTempo: TLabel;
    edtTempo: TEdit;
    udTempo: TUpDown;
    stgClipBoard: TStringGrid;
    lblCreditos: TLabel;
    ppmPausar: TMenuItem;
    imgPlay: TImage;
    imgPause: TImage;
    lblPlayPause: TLabel;
    N2: TMenuItem;
    imgSair: TImage;
    lblSair: TLabel;
    pumClipBoard: TPopupMenu;
    MenuItem1: TMenuItem;
    chbFixoV: TCheckBox;
    chbFixoINV: TCheckBox;
    procedure ppmSairClick(Sender: TObject);
    procedure ppmAbrirClick(Sender: TObject);
    procedure tiNumerosClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrNotificacaoTimer(Sender: TObject);
    procedure edtTempoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure stgClipBoardDblClick(Sender: TObject);
    procedure lblPlayPauseClick(Sender: TObject);
    procedure ppmPausarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MenuItem1Click(Sender: TObject);
  private
    { Private declarations }
    FPodeFechar: Boolean;
    FPlay: Boolean;
    function CPFValido(const CPF: string): Boolean; { Valida CPF informado }
    function CNPJValido(const CNPJ: string): Boolean; { Valida CNPJ informado }
    function SoNumeros(S: string): string; { Retorna só caracteres numéricos }
    procedure ExibeNotificacao(Mensagem: string; Titulo: string; Cor: TColor);
    { Exibe notificação personalizada na tela do aplicativo }
    procedure RemoveNotificacao; { Remove a notificação, caso ela exista }
    procedure SetClipBoard(Tipo, Digitos: string);
    { Define a nova área de transferência }
    procedure ClipBoardChanged(var message: TMessage); message WM_DRAWCLIPBOARD;
    { Processa as alterações da área de transferência }
  public
    { Public declarations }
    procedure StartClipBoardMonitor;
  end;

const
  CMaximo = 256;

var
  frmPrincipal: TfrmPrincipal;
  DDD: array of string = ['11', '12', '13', '14', '15', '16', '17', '18', '19',
    '21', '22', '24', '27', '28', '31', '32', '33', '34', '35', '37', '38',
    '41', '42', '43', '44', '45', '46', '47', '48', '49', '51', '53', '54',
    '55', '61', '62', '63', '64', '65', '66', '67', '68', '69', '71', '73',
    '74', '75', '77', '79', '81', '82', '83', '84', '85', '86', '87', '88',
    '89', '91', '92', '93', '94', '95', '96', '97', '98', '99'];

implementation

{$R *.dfm}

uses uNotificacao;

procedure TfrmPrincipal.ppmAbrirClick(Sender: TObject);
begin
  tiNumerosClick(nil);
end;

procedure TfrmPrincipal.ppmPausarClick(Sender: TObject);
begin
  lblPlayPauseClick(nil);
end;

procedure TfrmPrincipal.ClipBoardChanged(var message: TMessage);
var
  Digitos: string;

begin
  if not FPlay then
    Exit;

  if not Clipboard.HasFormat(CF_TEXT) then
    Exit;

  if Length(Clipboard.AsText) > CMaximo then
    Exit;

  Digitos := SoNumeros(Clipboard.AsText);

  if Length(Digitos) = 14 then
  begin
    if CNPJValido(Digitos) then
    begin { CNPJ válido }
      SetClipBoard('CNPJ', Digitos);
      if chbCNPJV.Checked then
        ExibeNotificacao('CNPJ "' + Digitos +
          '" copiado para a área de transferência', 'CNPJ válido', clPurple);
    end
    else
    begin
      if chbCNPJINV.Checked then
        ExibeNotificacao('Embora "' + Digitos + '" tenha 14 dígitos',
          'Não é CNPJ', clRed);
    end;
  end
  else if Length(Digitos) = 11 then { CPF ou celular }
  begin
    if CPFValido(Digitos) then
    begin { CPF válido }
      SetClipBoard('CPF', Digitos);
      if chbCPFV.Checked then
        ExibeNotificacao('CPF "' + Digitos +
          '" copiado para a área de transferência', 'CPF válido', clBlue);
    end
    else
    begin
      if (MatchStr(Copy(Digitos, 1, 2), DDD)) and (Digitos[3] = '9') then
      begin
        SetClipBoard('Celular', Digitos);
        if chbCPFV.Checked then
          ExibeNotificacao('"' + Digitos + '" parece ser um celular',
            'Celular', clGreen);
      end
      else
      begin
        if chbCPFINV.Checked then
          ExibeNotificacao('Verifique "' + Digitos + '"',
            'Não é CPF nem celular', clRed);
      end;
    end;
  end
  else if Length(Digitos) = 10 then { Telefone fixo }
  begin
    if (MatchStr(Copy(Digitos, 1, 2), DDD)) and
      (MatchStr(Digitos[3], ['2', '3', '4', '5'])) then
    begin
      SetClipBoard('Telefone fixo', Digitos);
      if chbFixoV.Checked then
        ExibeNotificacao('"' + Digitos + '" parece ser um telefone fixo',
          'Telefone fixo', clBlack);
    end
    else
    begin
      if chbFixoINV.Checked then
        ExibeNotificacao('Verifique "' + Digitos + '"',
          'Não é um telefone fixo', clRed);
    end;
  end;
end;

function TfrmPrincipal.CNPJValido(const CNPJ: string): Boolean;
var
  N1, N2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: Byte;
  d1, d2, I: Integer;
  Digitado, Calculado, NCNPJ: TStringBuilder;

begin
  Result := False;
  Digitado := TStringBuilder.Create;
  Calculado := TStringBuilder.Create;
  NCNPJ := TStringBuilder.Create;
  try
    for I := 1 to Length(CNPJ) do
      if CharInSet(CNPJ[I], ['0' .. '9']) then
        NCNPJ.Append(CNPJ[I]);

    if Length(NCNPJ.ToString) = 14 then
    begin
      if MatchStr(NCNPJ.ToString, ['00000000000000', '11111111111111',
        '22222222222222', '33333333333333', '44444444444444', '55555555555555',
        '66666666666666', '77777777777777', '88888888888888', '99999999999999'])
      then
        Exit;

      N1 := StrToInt(NCNPJ.ToString[1]);
      N2 := StrToInt(NCNPJ.ToString[2]);
      n3 := StrToInt(NCNPJ.ToString[3]);
      n4 := StrToInt(NCNPJ.ToString[4]);
      n5 := StrToInt(NCNPJ.ToString[5]);
      n6 := StrToInt(NCNPJ.ToString[6]);
      n7 := StrToInt(NCNPJ.ToString[7]);
      n8 := StrToInt(NCNPJ.ToString[8]);
      n9 := StrToInt(NCNPJ.ToString[9]);
      n10 := StrToInt(NCNPJ.ToString[10]);
      n11 := StrToInt(NCNPJ.ToString[11]);
      n12 := StrToInt(NCNPJ.ToString[12]);
      d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5
        * 9 + n4 * 2 + n3 * 3 + N2 * 4 + N1 * 5;
      d1 := 11 - (d1 mod 11);
      if d1 >= 10 then
        d1 := 0;
      d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6
        * 9 + n5 * 2 + n4 * 3 + n3 * 4 + N2 * 5 + N1 * 6;
      d2 := 11 - (d2 mod 11);
      if d2 >= 10 then
        d2 := 0;
      Calculado.Append(d1).Append(d2);
      Digitado.Append(NCNPJ.ToString[13]).Append(NCNPJ.ToString[14]);
      Result := (Calculado.ToString = Digitado.ToString);
    end;
  finally
    FreeAndNil(Digitado);
    FreeAndNil(Calculado);
    FreeAndNil(NCNPJ);
  end;
end;

function TfrmPrincipal.CPFValido(const CPF: string): Boolean;
var
  N1, N2, n3, n4, n5, n6, n7, n8, n9: Byte;
  d1, d2, I: Byte;
  Digitado, Calculado, NCPF: TStringBuilder;

begin
  Result := False;
  Digitado := TStringBuilder.Create;
  Calculado := TStringBuilder.Create;
  NCPF := TStringBuilder.Create;
  try
    for I := 1 to Length(CPF) do
      if CharInSet(CPF[I], ['0' .. '9']) then
        NCPF.Append(CPF[I]);

    if Length(NCPF.ToString) = 11 then
    begin
      if MatchStr(NCPF.ToString, ['00000000000', '11111111111', '22222222222',
        '33333333333', '44444444444', '55555555555', '66666666666',
        '77777777777', '88888888888', '99999999999']) then
        Exit;

      N1 := StrToInt(NCPF.ToString[1]);
      N2 := StrToInt(NCPF.ToString[2]);
      n3 := StrToInt(NCPF.ToString[3]);
      n4 := StrToInt(NCPF.ToString[4]);
      n5 := StrToInt(NCPF.ToString[5]);
      n6 := StrToInt(NCPF.ToString[6]);
      n7 := StrToInt(NCPF.ToString[7]);
      n8 := StrToInt(NCPF.ToString[8]);
      n9 := StrToInt(NCPF.ToString[9]);
      d1 := 11 - ((n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8
        + N2 * 9 + N1 * 10) mod 11);
      if d1 >= 10 then
        d1 := 0;
      d2 := 11 - ((d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8
        + n3 * 9 + N2 * 10 + N1 * 11) mod 11);
      if d2 >= 10 then
        d2 := 0;
      Calculado.Append(d1).Append(d2);
      Digitado.Append(NCPF.ToString[10]).Append(NCPF.ToString[11]);
      Result := (Calculado.ToString = Digitado.ToString);
    end;
  finally
    FreeAndNil(Digitado);
    FreeAndNil(Calculado);
    FreeAndNil(NCPF);
  end;
end;

procedure TfrmPrincipal.edtTempoChange(Sender: TObject);
begin
  tmrNotificacao.Interval := StrToInt(edtTempo.Text) * 1000;
end;

procedure TfrmPrincipal.ExibeNotificacao(Mensagem: string; Titulo: string;
  Cor: TColor);
begin
  with frmNotificacao do
  begin
    AlphaBlendValue := 255;
    tmrDesaparecer.Enabled := False;
    Color := Cor;
    lblTitulo.Caption := Titulo;
    lblMensagem.Caption := Mensagem;
    Show;
  end;

  tmrNotificacao.Enabled := True;
  Application.ProcessMessages;
end;

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not FPodeFechar then
  begin
    WindowState := wsMinimized;
    CanClose := False;
  end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  frmNotificacao := TfrmNotificacao.Create(Application);
  FPodeFechar := False;
  FPlay := True;
  stgClipBoard.Cells[0, 0] := 'Data/Hora';
  stgClipBoard.Cells[1, 0] := 'Tipo';
  stgClipBoard.Cells[2, 0] := 'Valores copiados';
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  if frmPrincipal.WindowState = wsMinimized then
    Hide;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Top := Screen.Height - Height - 40;
  Left := Screen.Width - Width;
end;

procedure TfrmPrincipal.lblPlayPauseClick(Sender: TObject);
begin
  if FPlay then
  begin
    FPlay := False;
    imgPlay.Visible := True;
    imgPause.Visible := False;
    lblPlayPause.Caption := 'Retomar monitoramento da área de transferência';
    ppmPausar.Caption := 'Retomar';
  end
  else
  begin
    FPlay := True;
    imgPlay.Visible := False;
    imgPause.Visible := True;
    lblPlayPause.Caption := 'Pausar monitoramento da área de transferência';
    ppmPausar.Caption := 'Pausar';
  end;
end;

procedure TfrmPrincipal.MenuItem1Click(Sender: TObject);
begin
  Clipboard.Clear;
  stgClipBoard.RowCount := 1;
end;

procedure TfrmPrincipal.ppmSairClick(Sender: TObject);
begin
  FPodeFechar := True;
  Close;
end;

procedure TfrmPrincipal.RemoveNotificacao;
begin
  frmNotificacao.tmrDesaparecer.Enabled := True
end;

procedure TfrmPrincipal.SetClipBoard(Tipo, Digitos: string);
var
  DataHora: String;

begin
  DataHora := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);

  if (stgClipBoard.Cells[0, stgClipBoard.RowCount - 1] <> DataHora) then
  begin
    stgClipBoard.RowCount := stgClipBoard.RowCount + 1;
    stgClipBoard.Cells[0, stgClipBoard.RowCount - 1] := DataHora;
    stgClipBoard.Cells[1, stgClipBoard.RowCount - 1] := Tipo;
    stgClipBoard.Cells[2, stgClipBoard.RowCount - 1] := Digitos;
  end;

  Clipboard.AsText := Digitos;
end;

function TfrmPrincipal.SoNumeros(S: string): string;
var
  I: LongWord;
  Numeros: TStringBuilder;

begin
  Numeros := TStringBuilder.Create;
  try
    for I := 1 to Length(S) do
      if CharInSet(S[I], ['0' .. '9']) then
        Numeros.Append(S[I]);
    Result := Numeros.ToString;
  finally
    FreeAndNil(Numeros);
  end;
end;

procedure TfrmPrincipal.StartClipBoardMonitor;
begin
  SetClipboardViewer(Handle);
end;

procedure TfrmPrincipal.stgClipBoardDblClick(Sender: TObject);
var
  Valor: string;

begin
  Valor := stgClipBoard.Cells[2, stgClipBoard.Row];
  Clipboard.AsText := Valor;
end;

procedure TfrmPrincipal.tmrNotificacaoTimer(Sender: TObject);
begin
  tmrNotificacao.Enabled := False;
  RemoveNotificacao;
end;

procedure TfrmPrincipal.tiNumerosClick(Sender: TObject);
begin
  Self.WindowState := wsNormal;
  Self.Show;
end;

end.
