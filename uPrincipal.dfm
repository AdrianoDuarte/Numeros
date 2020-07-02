object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'N'#250'meros'
  ClientHeight = 658
  ClientWidth = 528
  Color = clBtnFace
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    528
    658)
  PixelsPerInch = 96
  TextHeight = 13
  object imgPlay: TImage
    Left = 8
    Top = 138
    Width = 32
    Height = 32
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000002
      7F4944415478DAED96CB4B555114C69791CD0C8A463DC01E6AD9ACFE8606515E
      4B4B426746543E122B7554DACCAC28C90745342AA2A2878581FF448E7C924658
      D820A274D4F3FA7DAC75E17838E7EC7DEB86062EF8C1BD9CD7B7BFB5D7DA2B4F
      9638F25604FC6F02B68072700014DA7FC60C780B06C100789F6B019BC045500B
      563BEEFD0D9E8016F02E170252E01E2800DFC133F01C0C0756BA19EC31770E83
      35601ED480977F23A011DC00ABC063D0665627C536D0052ACD8D26D0F3270252
      B6DAB4D979DDC3AD609C0397ED1B87E29C8813C09C8F99ED67431FEF0517C067
      4F1157C11CD809667D05DC01C7456DAF0A5D4BDBC72F817EF0C321821BB202DC
      06277D04B0B498E75FA63A9CF374E0F7B8ADF2558280ED6054741F15820F2E01
      0DE02678088E455CCF08E04B4BEDF79009198911F1081C05F5A0CF2580ABD90F
      AAC1830401F9E034E800EBC14FB3B91D7C0A3DC3726429B3511D7409980445C6
      9B04019967D7899667B368FD7F019DA2E5FBCDEE29114DD784685A130570C772
      F7AF156D262E0199D82D5A2DFB020B6936470BECBDF3F6DEE52D8036159B6D93
      9E29E80075A2E744540A68FB98511A7CD9B2DC842C15F6EE7F518674A9DF2580
      271B9B0F0F925D603A4600C3A711ED3061DE8D48CCCA13A26DF44884806C5AF1
      53D123FA163815BE182760A3AD8EBBF73CB816B896CD61C467AF80AFA21BF1A3
      AF004699E8E0C115B78544F8043FDE69DFE0D13E1875936B20E1B9D02D9A3F5A
      D90AA61CCF30E71C48683BF7D119732D327C463296CD7DD106C2916CC09C792D
      8B47B2BDA28307C7B27CB3BD266EE5D908606C10CD7BA6D92405FBC15DD1FE30
      EBB837EBB19C9352CA5CD92A8BC7F2695BED0B09955A2E05E43C56042CB98005
      E80CAA21B8F740720000000049454E44AE426082}
    Visible = False
    OnClick = lblPlayPauseClick
  end
  object imgPause: TImage
    Left = 8
    Top = 138
    Width = 32
    Height = 32
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000002
      354944415478DAED96CB4F534114874F8DBAAAB071859A20080A4BF92B8C5204
      D418D9418C465E89805D695882429028108D7125214A7814827F86AE00697884
      A0D12D8F1541EBEF97394D4AD3DBB9BD1DD398F424DFA2BD8FF9EE9939332724
      058E5051E07F13B8001AC07550AEBF193B600B2C8118F8EE5AE01C78065AC149
      CBBD7FC00CE803DB2E0422E00338030EC11C98075F53BEF43CB8AAD96904A7C1
      3E68018BF908748297E0049806514D75B6A800CF41B366A31BBC0E2210D1AF4D
      683A477C642B357AC0A08E71D32B135E029CF3554DFBE30083A74A0C813D7005
      FCF42BF00EB48949FB9D808327830BB209BC050FFC08B0B438CFBFD53A7DCE13
      1ECF7AFD5F0956C4ACA372F0C326D0015E818FE06E86EBB90A303E81DBA01D8C
      DB043E836BE01E987224C072642973A3BA611388832A65DD91C065F00DAC8999
      D6AC02DC40C2622AE0C0914058DF7BA0EFCD2AB0A737B9142801BBFAEE529B00
      D354AD698B3B1260DA57955A9B40C117214B857BF7BF28C34760C226C0938D9B
      0F0F921AB099A7C025B02C396C440C6E9BF7C56CA3B724BF98157344BF010FD3
      2F7A099489A95B56422F180E38389F7D21A602B8107FF91560D48B693C98DA68
      00090E3EA063F0685FCA7493AD21E1B9302A66FE98CA2760C3F20CE79C0D09D3
      CE75D405C6BC6EF6D392B16C26C56C266CC9629A992F72BC25AB13D378B02D3B
      A5696FF1FAF25C041867C1533165646B4A8FC07BD02F191A90A002C960A714D1
      AC5C94E36DF9A67EED82A4959A4B01E7511428B8C05FE7858821001815A10000
      000049454E44AE426082}
    OnClick = lblPlayPauseClick
  end
  object lblPlayPause: TLabel
    Left = 42
    Top = 148
    Width = 230
    Height = 13
    Caption = 'Pausar monitoramento da '#225'rea de transfer'#234'ncia'
    OnClick = lblPlayPauseClick
  end
  object imgSair: TImage
    Left = 350
    Top = 138
    Width = 32
    Height = 32
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
      00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000001
      F74944415478DAEDD73B485B511CC7F1735B2C2ED245C1EA9225208AE220D2A1
      0404BBE8A69BA2088AA0F82A58E8E022082E3EDA8A82A0200E8EEAA00E2A0876
      28220EE2135C14110AEDA40ED6DAC6EF9F73029790C74D722F49A0073E60CCB9
      E7FFCB7985582ACDCDFA1F20D30304BDAE973501525DAAA8E3645D804497C48A
      324EE60608263B90C3E0AE05F07C06AC38AFD31620D9E6E90CD8DFFB8365ACE2
      0017E6BD525461D1CB0052B41F57894C8D174B50860EBC87CFFCEF125B98C389
      5733F00AE3E8C2CB28E1FE620683787423C00A1A4CF175D4E201B358329F3657
      E93DD08616E4601BF512C2AD2598420FAECDC04711FA1462177EDB337DA9CC80
      ECF646A5D7FC50E913501DA3F80E4A943E193EBC40452A019ACD344F62009FF1
      214EF173D46004EDF2AC1B4B20EB5C6A3EFDBE83E23FF00EDF701C3EF00D8A4C
      07CB749207DEC408708B3CE3DE417169F9F889BBF000A3F8A49CB5D7A6782840
      017E3928AE4CFFDB4801E4380DA3D5CC44AC269BEFD4B604013363F18A4B7B8B
      EF9196209916DA84F31872505C5AE8D84EB81120740CFF297DE5FAE314AFC49E
      D2B765851B01A47D45AFF95BCE792046F13514E38BCC9C5B01E47ADD50FA2A96
      0B49BE76177086DF2847133A95DE677215D7495F377F9AC9C063E856D1BF8C9E
      308D8F26A827BF0D654FC82D17FE75BCA9F4463DB5777E06AF06A01A32D00E03
      0000000049454E44AE426082}
    OnClick = ppmSairClick
  end
  object lblSair: TLabel
    Left = 383
    Top = 148
    Width = 41
    Height = 13
    Caption = 'Encerrar'
    OnClick = ppmSairClick
  end
  object grbOpcoes: TGroupBox
    Left = 8
    Top = 8
    Width = 512
    Height = 121
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Exibir avisos  '
    TabOrder = 0
    DesignSize = (
      512
      121)
    object lblTempo: TLabel
      Left = 301
      Top = 72
      Width = 300
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Tempo (s)'
      Constraints.MinWidth = 300
    end
    object lblCreditos: TLabel
      Left = 398
      Top = 105
      Width = 111
      Height = 13
      Caption = '2020 Adriano Software'
      Enabled = False
    end
    object chbCNPJV: TCheckBox
      Left = 16
      Top = 24
      Width = 160
      Height = 17
      Caption = 'CNPJ v'#225'lido'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chbCNPJINV: TCheckBox
      Left = 16
      Top = 47
      Width = 160
      Height = 17
      Caption = 'CNPJ inv'#225'lido'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chbCPFV: TCheckBox
      Left = 16
      Top = 70
      Width = 160
      Height = 17
      Caption = 'CPF v'#225'lido/Celular v'#225'lido'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chbCPFINV: TCheckBox
      Left = 16
      Top = 93
      Width = 160
      Height = 17
      Caption = 'CPF inv'#225'lido/Celular inv'#225'lido'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object edtTempo: TEdit
      Left = 301
      Top = 91
      Width = 33
      Height = 21
      Anchors = [akTop, akRight]
      NumbersOnly = True
      TabOrder = 6
      Text = '1'
      OnChange = edtTempoChange
    end
    object udTempo: TUpDown
      Left = 334
      Top = 91
      Width = 17
      Height = 21
      Anchors = [akTop, akRight]
      Associate = edtTempo
      Min = 1
      Max = 10
      Position = 1
      TabOrder = 7
    end
    object chbFixoV: TCheckBox
      Left = 256
      Top = 24
      Width = 160
      Height = 17
      Caption = 'Fixo v'#225'lido'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object chbFixoINV: TCheckBox
      Left = 256
      Top = 47
      Width = 160
      Height = 17
      Caption = 'Fixo inv'#225'lido'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
  end
  object stgClipBoard: TStringGrid
    Left = 8
    Top = 176
    Width = 512
    Height = 474
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 3
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowDefAlign]
    PopupMenu = pumClipBoard
    TabOrder = 1
    OnDblClick = stgClipBoardDblClick
    ColWidths = (
      134
      105
      262)
  end
  object tiNumeros: TTrayIcon
    Hint = 'N'#250'meros'
    PopupMenu = pumPrincipal
    Visible = True
    OnClick = tiNumerosClick
    Left = 408
    Top = 560
  end
  object pumPrincipal: TPopupMenu
    Left = 480
    Top = 560
    object ppmAbrir: TMenuItem
      Caption = 'Abrir...'
      OnClick = ppmAbrirClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object ppmPausar: TMenuItem
      Caption = 'Pausar'
      OnClick = ppmPausarClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ppmSair: TMenuItem
      Caption = 'Sair'
      OnClick = ppmSairClick
    end
  end
  object tmrNotificacao: TTimer
    Enabled = False
    OnTimer = tmrNotificacaoTimer
    Left = 368
    Top = 560
  end
  object pumClipBoard: TPopupMenu
    Left = 328
    Top = 560
    object MenuItem1: TMenuItem
      Caption = 'Limpar tudo'
      OnClick = MenuItem1Click
    end
  end
end
