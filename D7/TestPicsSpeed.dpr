program TestPicsSpeed;

uses
  Forms,
  MainU in 'MainU.pas' {fMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfMain, fMain);
  Application.Run;
end.
