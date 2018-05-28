unit uSetGetDatapump;

interface

const
   _INIVITAENV  = 'VTEnv.ini';
   _ARRY_DBTYPE : Array[0..1] of String = ('MySQL', 'Oracle');
   _SKINCOLOR : array[0..50] of String = ('Black', 'Blue', 'Blueprint', 'Caramel', 'Coffee',
                                          'Darkroom', 'DarkSide', 'DevExpressDarkStyle', 'DevExpressStyle', 'Foggy',
                                          'GlassOceans', 'HighContrast', 'iMaginary', 'Lilian', 'LiquidSky',
                                          'LondonLiquidSky', 'McSkin', 'Metropolis', 'MetropolisDark', 'MoneyTwins',
                                          'Office2007Black', 'Office2007Blue', 'Office2007Green', 'Office2007Pink',
                                          'Office2007Silver', 'Office2010Black', 'Office2010Blue', 'Office2010Silver', 'Office2013DarkGray',
                                          'Office2013LightGray', 'Office2013White', 'Office2016Colorful', 'Office2016Dark', 'Pumpkin',
                                          'Seven', 'SevenClassic', 'Sharp', 'SharpPlus', 'Silver',
                                          'Springtime', 'Stardust', 'Summer2008', 'TheAsphaltWorld', 'UserSkin',
                                          'Valentine', 'VisualStudio2013Blue', 'VisualStudio2013Dark', 'VisualStudio2013Light', 'VS2010',
                                          'Whiteprint', 'Xmas2008Blue');

procedure setAppPath(pi_Param : String);
function getAppPath : String;

procedure setLogPath(pi_Param : String);
function getLogPath : String;

procedure setConfigPath(pi_Param : String);
function getConfigPath : String;

procedure setLoggerDate(pi_Param : String);
function getLoggerDate : String;

implementation
var
   pb_AppPath, pb_LogPath, pb_ConfigPath : String;
   pb_LoggerDate : String;

//****************************************************************************//
//* User Define Procedure, Function
//****************************************************************************//
procedure setAppPath(pi_Param : String);
begin
   pb_AppPath := pi_Param;
end;

function getAppPath : String;
begin
   Result := pb_AppPath;
end;

procedure setLogPath(pi_Param : String);
begin
   pb_LogPath := pi_Param;
end;

function getLogPath : String;
begin
   Result := pb_LogPath;
end;

procedure setConfigPath(pi_Param : String);
begin
   pb_ConfigPath := pi_Param;
end;

function getConfigPath : String;
begin
   Result := pb_ConfigPath;
end;

procedure setLoggerDate(pi_Param : String);
begin
   pb_LoggerDate := pi_Param;
end;

function getLoggerDate : String;
begin
   Result := pb_LoggerDate;
end;

end.
