object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 472
  Width = 343
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\Users\elias\Desktop\curso\Win32\Debug\DB\educ.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    Left = 192
    Top = 120
  end
  object qry_geral: TFDQuery
    Connection = conn
    Left = 168
    Top = 320
  end
  object qry_prof: TFDQuery
    Connection = conn
    Left = 256
    Top = 224
  end
  object qry_t: TFDQuery
    Connection = conn
    Left = 280
    Top = 128
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 280
    Top = 360
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 48
  end
end
