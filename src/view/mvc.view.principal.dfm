object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 489
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 731
    Height = 489
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 771
    ExplicitHeight = 488
    DesignSize = (
      731
      489)
    object edtCodigoCliente: TLabeledEdit
      Left = 24
      Top = 40
      Width = 97
      Height = 23
      EditLabel.Width = 94
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo do cliente'
      TabOrder = 0
      Text = ''
    end
    object edtNomeCliente: TLabeledEdit
      Left = 127
      Top = 40
      Width = 433
      Height = 23
      EditLabel.Width = 88
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome do cliente'
      TabOrder = 1
      Text = ''
    end
    object edtCodigoProduto: TLabeledEdit
      Left = 24
      Top = 96
      Width = 105
      Height = 23
      EditLabel.Width = 102
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo do produto'
      TabOrder = 2
      Text = ''
    end
    object edtQuantidade: TLabeledEdit
      Left = 135
      Top = 96
      Width = 81
      Height = 23
      EditLabel.Width = 62
      EditLabel.Height = 15
      EditLabel.Caption = 'Quantidade'
      TabOrder = 3
      Text = ''
    end
    object edtValorUnitario: TLabeledEdit
      Left = 222
      Top = 96
      Width = 81
      Height = 22
      EditLabel.Width = 70
      EditLabel.Height = 15
      EditLabel.Caption = 'Valor unit'#225'rio'
      TabOrder = 4
      Text = ''
    end
    object btnNovoCliente: TButton
      Left = 566
      Top = 40
      Width = 65
      Height = 23
      Caption = 'Novo'
      TabOrder = 5
      OnClick = btnNovoClienteClick
    end
    object btnPesquisarCliente: TButton
      Left = 637
      Top = 40
      Width = 65
      Height = 23
      Caption = 'Pesquisar'
      TabOrder = 6
    end
    object edtPesquisarProduto: TButton
      Left = 380
      Top = 96
      Width = 65
      Height = 23
      Caption = 'Pesquisar'
      TabOrder = 7
    end
    object edtNovoProduto: TButton
      Left = 309
      Top = 96
      Width = 65
      Height = 23
      Caption = 'Novo'
      TabOrder = 8
    end
    object edtConfirmar: TButton
      Left = 630
      Top = 95
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Confirmar'
      TabOrder = 9
      ExplicitLeft = 627
    end
    object grdProdutos: TDBGrid
      Left = 24
      Top = 144
      Width = 681
      Height = 297
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataSource1
      TabOrder = 10
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object btnFinalizarPedido: TButton
      Left = 24
      Top = 456
      Width = 105
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Finalizar pedido'
      TabOrder = 11
      ExplicitTop = 472
    end
    object btnCancelarPedido: TButton
      Left = 135
      Top = 456
      Width = 105
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Cancelar pedido'
      TabOrder = 12
      ExplicitTop = 472
    end
  end
  object DataSource1: TDataSource
    Left = 360
    Top = 248
  end
end
