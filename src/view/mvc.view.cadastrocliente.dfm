object FormCliente: TFormCliente
  Left = 0
  Top = 0
  Caption = 'FormCliente'
  ClientHeight = 193
  ClientWidth = 526
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
    Width = 526
    Height = 193
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      526
      193)
    object edtCodigo: TLabeledEdit
      Left = 24
      Top = 40
      Width = 81
      Height = 23
      EditLabel.Width = 39
      EditLabel.Height = 15
      EditLabel.Caption = 'C'#243'digo'
      TabOrder = 0
      Text = ''
    end
    object edtNome: TLabeledEdit
      Left = 111
      Top = 40
      Width = 392
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 33
      EditLabel.Height = 15
      EditLabel.Caption = 'Nome'
      TabOrder = 1
      Text = ''
    end
    object edtCidade: TLabeledEdit
      Left = 24
      Top = 96
      Width = 392
      Height = 23
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 37
      EditLabel.Height = 15
      EditLabel.Caption = 'Cidade'
      TabOrder = 2
      Text = ''
    end
    object edtEstado: TLabeledEdit
      Left = 422
      Top = 96
      Width = 81
      Height = 23
      Anchors = [akTop, akRight]
      EditLabel.Width = 35
      EditLabel.Height = 15
      EditLabel.Caption = 'Estado'
      TabOrder = 3
      Text = ''
    end
    object btnSalvar: TButton
      Left = 428
      Top = 156
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Salvar'
      TabOrder = 4
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 347
      Top = 156
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancelar'
      TabOrder = 5
    end
  end
end
