program VitaminDatapump;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uProgress in 'uProgress.pas' {frmProgress},
  uSetGetDatapump in 'uSetGetDatapump.pas',
  uSplash in 'uSplash.pas' {frmSplash},
  uLib in 'lib\uLib.pas',
  Log4D in 'lib\log4d\Log4D.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
