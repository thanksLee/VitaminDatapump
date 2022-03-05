unit uMain;

interface

uses
  Windows, Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, cxGraphics, cxClasses, cxLookAndFeels, dxSkinsForm, Vcl.ExtCtrls,
  cxControls, cxLookAndFeelPainters, cxSplitter, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, Vcl.StdCtrls, dxBevel, cxGroupBox,
  Vcl.Menus, cxButtons, SynEdit, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, MySQLUniProvider, DBAccess, Uni, MemDS, UniProvider, OracleUniProvider
  ,cxImage, cxMemo, cxBlobEdit, Clipbrd, FileCtrl, SynEditHighlighter,
  SynHighlighterSQL, cxSpinEdit, dxSkinTheBezier,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxImageList,
  SQLServerUniProvider, dxDateRanges, PostgreSQLUniProvider;

type
   TDBSQL = record
      rSQLId       : String;
      rSQLDesc     : String;
      rSQLParamCnt : String;
      rSQLText     : String;
   end;

type
  TfrmMain = class(TForm)
    dxSkinController: TdxSkinController;
    cxImageList_16: TcxImageList;
    ActionList_16: TActionList;
    act_SourceDBConn: TAction;
    act_SourceSQLRun: TAction;
    act_SourceColResize: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel4: TPanel;
    cxSplitter2: TcxSplitter;
    cxGrpBox_SourceDB: TcxGroupBox;
    pnl_Source: TPanel;
    dxBevel1: TdxBevel;
    Label1: TLabel;
    cxCmb_SourceDBType: TcxComboBox;
    cxCmb_SourceSaveDBType: TcxComboBox;
    cxTextEd_SourceCurrentDBType: TcxTextEdit;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    cxTextEd_SourceDBHost: TcxTextEdit;
    cxTextEd_SourcePWD: TcxTextEdit;
    cxTextEd_SourceDBID: TcxTextEdit;
    cxTexted_SourceDBPort: TcxTextEdit;
    cxCmb_SourceDB: TcxComboBox;
    cxCmb_SourceTable: TcxComboBox;
    cxBtn_SourceDBRefresh: TcxButton;
    cxBtn_SourceSQLRun: TcxButton;
    cxCmb_SourceConnString: TcxComboBox;
    SynEdit_Source: TSynEdit;
    cxSplitter3: TcxSplitter;
    cxGrid_Source: TcxGrid;
    cxGrid_SourceDBTableView1: TcxGridDBTableView;
    cxGrid_SourceLevel1: TcxGridLevel;
    SynEd_DBSQL: TSynEdit;
    cxGrd_format: TcxGrid;
    cxGrd_formatDBTableView1: TcxGridDBTableView;
    cxGrd_formatDBTableView1Column1: TcxGridDBColumn;
    cxGrd_formatDBTableView1Column2: TcxGridDBColumn;
    cxGrd_formatDBTableView1Column3: TcxGridDBColumn;
    cxGrd_formatDBTableView1Column4: TcxGridDBColumn;
    cxGrd_formatLevel1: TcxGridLevel;
    cxStyleRepository_Main: TcxStyleRepository;
    cxStyle1: TcxStyle;
    OracleUniProvider1: TOracleUniProvider;
    UniQry_Source: TUniQuery;
    UniDts_Source: TUniDataSource;
    MySQLUniProvider1: TMySQLUniProvider;
    cxBtn_SourceDBConn: TcxButton;
    UniConn_Source: TUniConnection;
    SynEdit_Log: TSynEdit;
    SynED_Main: TSynEdit;
    act_SourceDBReload: TAction;
    SynSQL_HH1: TSynSQLSyn;
    cxBtn_SourceColResize: TcxButton;
    cxTextEd_SourceServiceNm: TcxTextEdit;
    cxGrpBox_TargetDB: TcxGroupBox;
    dxBevel2: TdxBevel;
    Label5: TLabel;
    pnl_Target: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cxTextEd_TargetDBHost: TcxTextEdit;
    cxTextEd_TargetPWD: TcxTextEdit;
    cxTextEd_TargetDBID: TcxTextEdit;
    cxTexted_TargetDBPort: TcxTextEdit;
    cxCmb_TargetDB: TcxComboBox;
    cxCmb_TargetTable: TcxComboBox;
    cxBtn_TargetDBRefresh: TcxButton;
    cxBtn_TargetSQLRun: TcxButton;
    cxCmb_TargetConnString: TcxComboBox;
    cxBtn_TargetColResize: TcxButton;
    cxTextEd_TargetServiceNm: TcxTextEdit;
    cxCmb_TargetDBType: TcxComboBox;
    cxCmb_TargetSaveDBType: TcxComboBox;
    cxTextEd_TargetCurrentDBType: TcxTextEdit;
    cxBtn_TargetDBConn: TcxButton;
    Panel6: TPanel;
    SynEdit_Target: TSynEdit;
    cxSplitter4: TcxSplitter;
    cxGrid_Target: TcxGrid;
    cxGrid_TargetDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    UniQry_Target: TUniQuery;
    UniDts_Target: TUniDataSource;
    act_TargetDBConn: TAction;
    act_TargetSQLRun: TAction;
    act_TargetColResize: TAction;
    act_TargetDBReload: TAction;
    cxBtn_SourceTrans: TcxButton;
    act_SourceTrans: TAction;
    act_TargetTrans: TAction;
    dxBevel3: TdxBevel;
    Label9: TLabel;
    Label10: TLabel;
    cxSpinEdt_SFetch: TcxSpinEdit;
    cxSpinEdt_EFetch: TcxSpinEdit;
    SQLServerUniProvider1: TSQLServerUniProvider;
    chkTotCnt_Without: TCheckBox;
    UniConn_Target: TUniConnection;
    PostgreSQLUniProvider1: TPostgreSQLUniProvider;
    procedure FormCreate(Sender: TObject);
    procedure cxGrd_formatDBTableView1Column1GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxGrd_formatDBTableView1Column2GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxGrd_formatDBTableView1Column3GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure cxGrd_formatDBTableView1Column4GetDataText(
      Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
    procedure act_SourceDBConnExecute(Sender: TObject);
    procedure act_SourceSQLRunExecute(Sender: TObject);
    procedure act_SourceDBReloadExecute(Sender: TObject);
    procedure SynEdit_SourceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure act_SourceColResizeExecute(Sender: TObject);
    procedure cxCmb_SourceDBTypePropertiesEditValueChanged(Sender: TObject);
    procedure cxCmb_SourceSaveDBTypePropertiesEditValueChanged(Sender: TObject);
    procedure cxCmb_TargetDBTypePropertiesEditValueChanged(Sender: TObject);
    procedure cxCmb_TargetSaveDBTypePropertiesEditValueChanged(Sender: TObject);
    procedure act_TargetDBConnExecute(Sender: TObject);
    procedure act_TargetDBReloadExecute(Sender: TObject);
    procedure act_TargetColResizeExecute(Sender: TObject);
    procedure act_TargetSQLRunExecute(Sender: TObject);
    procedure SynEdit_TargetKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure act_SourceTransExecute(Sender: TObject);
    procedure cxCmb_SourceDBPropertiesEditValueChanged(Sender: TObject);
    procedure cxCmb_TargetDBPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    //****************************************************************************//
    // SQL을 관리
    //****************************************************************************//
    procedure pSetDBSQL(pi_ObjSynEd : TSynEdit);
    procedure LoadDBConnInfo(pi_Flg : Integer; pi_ObjCmb : TcxComboBox);
    function ufSet_DBConnection(pi_Flg : Integer; pi_UniDBConn : TUniConnection; pi_DBProvider, pi_DBNm, pi_DBHost, pi_DBPort, pi_ServiceNm, pi_DBCharSet, pi_DBUserId, pi_DBPwd, pi_UserAuthMode, pi_DB : String) : String;
    //****************************************************************************//
    //* Mysql Database 목록을 가져온다.
    //****************************************************************************//
    procedure pGet_MySQLDatabaseList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
    //****************************************************************************//
    //* Mysql Database 를 변경한다.
    //****************************************************************************//
    procedure pSet_MySQLChangeDatabase(pi_UniConn : TUniConnection; pi_DBNm : String);
    //****************************************************************************//
    //* 선택한 Database의 Table List를 가져온다.
    //****************************************************************************//
    procedure pSet_MySQLTableList(pi_UniConn : TUniConnection; pi_ObjCmb : TcxComboBox);
    //****************************************************************************//
    //* Oracle User 목록을 가져온다.
    //****************************************************************************//
    procedure pGet_OracleUserList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
    //****************************************************************************//
    //* 선택한 User의 Table List를 가져온다.
    //****************************************************************************//
    procedure pSet_OracleTableList(pi_Param : String; pi_UniConn : TUniConnection; pi_ObjCmb : TcxComboBox);
    //****************************************************************************//
    //* MSSql Database 목록을 가져온다.
    //****************************************************************************//
    procedure pGet_MSSQLDatabaseList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
    //****************************************************************************//
    //* MSSql Database 를 변경한다.
    //****************************************************************************//
    procedure pSet_MSSQLChangeDatabase(pi_UniConn : TUniConnection; pi_DBNm : String);
    //****************************************************************************//
    //* 선택한 Database의 Table List를 가져온다.
    //****************************************************************************//
    procedure pSet_MSSQLTableList(pi_UniConn : TUniConnection; pi_ObjCmb : TcxComboBox);
    //****************************************************************************//
    //* Postgresql Database 목록을 가져온다.
    //****************************************************************************//
    procedure pGet_PGDatabaseList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
    //****************************************************************************//
    //* 선택한 Database의 Table List를 가져온다.
    //****************************************************************************//
    procedure pSet_PGTableList(pi_UniConn : TUniConnection; pi_ObjText : TcxTextEdit; pi_ObjCmb : TcxComboBox);
    //****************************************************************************//
    //* Postgresql Autocommit Off
    //****************************************************************************//
    procedure pSet_PGAutoCommit(pi_UniConn : TUniConnection);
  public
    { Public declarations }
    //****************************************************************************//
    //* DB 접속을 한다.
    //****************************************************************************//
    procedure pSet_SourceDBConnProcess(pi_Flg : Integer; pi_UniDBConn : TUniConnection);
    //****************************************************************************//
    //* DB 접속을 한다.
    //****************************************************************************//
    procedure pSet_TargetDBConnProcess(pi_Flg : Integer; pi_UniDBConn : TUniConnection);
    //****************************************************************************//
    //* SQL을 실행한다.
    //****************************************************************************//
    function ufBackGroundUniSQLExec(pi_Flg : Integer; pi_Sql, pi_SQLSession : String; pi_stlParam : TStringList; pi_ObjQry : TUniQuery) : Boolean;
    //****************************************************************************//
    //* Vitamin SQL Spool
    //* Parameter : pi_Flg
    //*             pi_Sql
    //*             pi_SQLMsg
    //*             pi_ObjSynEdt
    //****************************************************************************//
    function fSet_SQLSpool(pi_Flg : Integer; pi_Sql, pi_Msg : String) : String;
    //****************************************************************************//
    //* SynEdit Setting
    //****************************************************************************//
    procedure pSet_SynEditSetting(pi_Flg : Integer; pi_ObjSynEd : TSynEdit);
    //****************************************************************************//
    //* Line 끝의 공백을 제거
    //****************************************************************************//
    function ufSet_LineDelBlank(pi_Flg : Integer; pi_StrParam : String) : String;
    //****************************************************************************//
    // cxGrid 구성
    //****************************************************************************//
    procedure pSetCxGridSetting(pi_Flg : Integer; pi_ObjDts : TDataSource; pi_objGridTableView : TcxGridDBTableView);

    var
       {-- Mr Crawler DB SQL을 담는다. --}
       pb_DBSQL : array of TDBSQL;

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uLib, uProgress, uSetGetDatapump, Log4D;

//****************************************************************************//
//* User Define Function, Procedure Start
//****************************************************************************//

//****************************************************************************//
// SQL을 관리
//****************************************************************************//
procedure TfrmMain.pSetDBSQL(pi_ObjSynEd : TSynEdit);
var
   lv_LoopCnt, lv_Idx : Integer;
   lv_tmpStr, lv_Key, lv_Value : String;

   function lfGetSQL(pi_LoopCnt : Integer) : String;
   var
      lpv_LoopCnt : Integer;
      lpv_RetVal, lpv_tmpStr : String;
      lpv_stlSQL : TStringList;
   begin
      lpv_stlSQL := TStringList.Create;
      lpv_stlSQL.StrictDelimiter := True;
      try
         for lpv_LoopCnt := pi_LoopCnt to pi_ObjSynEd.Lines.Count - 1 do
         begin
            lpv_tmpStr := Trim(pi_ObjSynEd.Lines.Strings[lpv_LoopCnt]);

            if CompareStr('[', Copy(lpv_tmpStr, 1, 1)) = 0 then Break;

            lpv_tmpStr := Copy(lpv_tmpStr, Pos('=', lpv_tmpStr) + 1, Length(lpv_tmpStr));
            lpv_stlSQL.Add(lpv_tmpStr);
         end;
      finally
         lpv_RetVal := lpv_stlSQL.Text;
         FreeAndNil(lpv_stlSQL);
      end;
      Result := lpv_RetVal;
   end;
begin
   lv_Idx := 0;
   for lv_LoopCnt := 0 to pi_ObjSynEd.Lines.Count - 1 do
   begin
      lv_tmpStr := Trim(pi_ObjSynEd.Lines.Strings[lv_LoopCnt]);

      if (CompareStr(lv_tmpStr, '') = 0) then Continue;

      if CompareStr('[', Copy(lv_tmpStr, 1, 1)) = 0 then
      begin
         SetLength(pb_DBSQL, Length(pb_DBSQL)+1);
         pb_DBSQL[lv_Idx].rSQLId := Copy(lv_tmpStr, 2, Pos(']', lv_tmpStr) - 1);
      end else
      begin
         lv_Key   := Copy(lv_tmpStr, 1, Pos('=', lv_tmpStr) - 1);
         lv_Value := Copy(lv_tmpStr, Pos('=', lv_tmpStr) + 1, Length(lv_tmpStr));

         if CompareStr(lv_Key, 'sql_desc') = 0 then
         begin
            pb_DBSQL[lv_Idx].rSQLDesc := lv_Value;
         end else if CompareStr(lv_Key, 'sql_param_cnt') = 0 then
         begin
            pb_DBSQL[lv_Idx].rSQLParamCnt := lv_Value;
            pb_DBSQL[lv_Idx].rSQLText     := lfGetSQL(lv_LoopCnt+1);
            Inc(lv_Idx);
         end;
      end;
      //Inc(lv_LoopCnt);
   end; // while..end
end;

procedure TfrmMain.LoadDBConnInfo(pi_Flg : Integer; pi_ObjCmb : TcxComboBox);
var
   lv_stlTmp, lv_stlKeyTmp : TStringList;
   lv_LoopCnt, lv_subLoopCnt : Integer;
   lv_tmpStr, lv_Key, lv_Value : String;
begin
   lv_stlTmp := TStringList.Create;
   lv_stlKeyTmp := TStringList.Create;
   (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.BeginUpdate;
   try
      ufReadSection(getConfigPath + _INIVITAENV, lv_stlTmp);

      for lv_LoopCnt := 0 to lv_stlTmp.Count - 1 do
      begin
         lv_tmpStr := lv_stlTmp.Strings[lv_LoopCnt];
         ufReadSectionKeyValue(getConfigPath + _INIVITAENV, lv_tmpStr, lv_stlKeyTmp);
         if Pos('SDBCONINFO', lv_tmpStr) > 0 then
         begin
            lv_Value := 'Source - ';
         end else if Pos('TDBCONINFO', lv_tmpStr) > 0 then
         begin
            lv_Value := 'Target - ';
         end;

         for lv_subLoopCnt := 0 to lv_stlKeyTmp.Count - 1 do
         begin
            lv_tmpStr := lv_stlKeyTmp.Strings[lv_subLoopCnt];
            if Pos('DBTYPE', lv_tmpStr) > 0 then
            begin
               lv_Value := lv_Value + Copy(lv_tmpStr, Pos('=', lv_tmpStr) + 1, Length(lv_tmpStr));
            end;
            if Pos('USERID', lv_tmpStr) > 0 then
            begin
               lv_Value := lv_Value + ' : ' + Copy(lv_tmpStr, Pos('=', lv_tmpStr) + 1, Length(lv_tmpStr));
               if (pi_Flg = 0) and (Pos('Source', lv_Value) > 0) then
               begin
                  (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Add(lv_Value);
               end;
               if (pi_Flg = 1) and (Pos('Target', lv_Value) > 0) then
               begin
                  (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Add(lv_Value);
               end;
            end;
         end;
      end;

   finally
      (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.EndUpdate;
      FreeAndNil(lv_stlKeyTmp);
      FreeAndNil(lv_stlTmp);
   end;
end;

//****************************************************************************//
//* DB 접속을 한다.
//****************************************************************************//
procedure TfrmMain.pSet_SourceDBConnProcess(pi_Flg : Integer; pi_UniDBConn : TUniConnection);
var
   lv_UniQry : TUniQuery;
   lv_tmpProviderNm, lv_tmpSectionNm : String;
begin
   case pi_Flg of
      0 :
         begin
            lv_tmpProviderNm := 'MySQL';
            lv_tmpSectionNm  := 'MYSQL_SDBCONINFO' + ' - ' + cxTextEd_SourceDBID.Text;
         end;
      1 :
         begin
            lv_tmpProviderNm := 'Oracle';
            lv_tmpSectionNm  := 'ORACLE_SDBCONINFO' + ' - ' + cxTextEd_SourceDBID.Text;
         end;
      2 :
         begin
            lv_tmpProviderNm := 'SQL Server';
            lv_tmpSectionNm  := 'MSSQL_SDBCONINFO' + ' - ' + cxTextEd_SourceDBID.Text;
         end;
      3 :
         begin
            lv_tmpProviderNm := 'PostgreSQL';
            lv_tmpSectionNm  := 'PG_SDBCONINFO' + ' - ' + cxTextEd_SourceDBID.Text;
         end;
   end;
   lv_UniQry := TUniQuery.Create(nil);
   try
      with frmProgress do
      begin
         ufProgress(1, 'DB 접속중에 있습니다.', 20, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);

         if ufSet_DBConnection(  pi_Flg
                               , pi_UniDBConn
                               , lv_tmpProviderNm, pi_UniDBConn.Name
                               , cxTextEd_SourceDBHost.Text
                               , cxTextEd_SourceDBPort.Text
                               , cxTextEd_SourceServiceNm.Text
                               , 'utf8'
                               , cxTextEd_SourceDBID.Text
                               , cxTextEd_SourcePWD.Text
                               , cxCmb_SourceConnString.Text
                               , cxCmb_SourceDB.Text) = 'SUCCESS' then
         begin
//            ufProgress(1, 'Charater Set을 설정합니다.', 60, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
//            frmMain.pGet_MySQLCharacterSetting(pv_SourceDBConn);

            ufProgress(1, '접속 정보를 저장합니다.', 40, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE',  cxCmb_SourceDBType.Text);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST',    ufEncrypt(cxTextEd_SourceDBHost.Text, _MY_KEY));
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT',    cxTextEd_SourceDBPort.Text);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID',  cxTextEd_SourceDBID.Text);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ufEncrypt(cxTextEd_SourcePWD.Text, _MY_KEY));

            ufProgress(1, 'Database 목록을 가져오고 있습니다.', 80, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
            case pi_Flg of
               0 :
                  begin
                     pGet_MySQLDatabaseList(pi_UniDBConn, cxCmb_SourceDB);
                  end;
               1 :
                  begin
                     ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'SERVICE',  cxTextEd_SourceServiceNm.Text);
                     ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'AUTH',  cxCmb_SourceConnString.Text);
                     pGet_OracleUserList(pi_UniDBConn, cxCmb_SourceDB);
                     cxCmb_SourceDB.Text := UpperCase(cxTextEd_SourceDBID.Text);
                  end;
               2 :
                  begin
                     pGet_MSSQLDatabaseList(pi_UniDBConn, cxCmb_SourceDB);
                  end;
               3 :
                  begin
                     ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DATABASE', cxCmb_SourceDB.Text);
                     //pSet_PGAutoCommit(pi_UniDBConn);
                     pGet_PGDatabaseList(pi_UniDBConn, cxCmb_SourceDB);
                  end;
            end;

            Timer_frmClose.Enabled := True;
            Timer_frmClose.Interval := 100;

            act_SourceDBConn.Enabled   := False;
            act_SourceDBReload.Enabled := True;
            act_SourceSQLRun.Enabled   := True;
         end else
         begin
            ufProgress(1, 'DB 접속이 실패 되었습니다.', 100, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);

            cxbtn_close.Enabled := True;
         end;
      end;

   finally
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* DB 접속을 한다.
//****************************************************************************//
procedure TfrmMain.pSet_TargetDBConnProcess(pi_Flg : Integer; pi_UniDBConn : TUniConnection);
var
   lv_UniQry : TUniQuery;
   lv_tmpProviderNm, lv_tmpSectionNm : String;
begin
   case pi_Flg of
      0 :
         begin
            lv_tmpProviderNm := 'MySQL';
            lv_tmpSectionNm  := 'MYSQL_TDBCONINFO' + ' - ' + cxTextEd_TargetDBID.Text;
         end;
      1 :
         begin
            lv_tmpProviderNm := 'Oracle';
            lv_tmpSectionNm  := 'ORACLE_TDBCONINFO' + ' - ' + cxTextEd_TargetDBID.Text;
         end;
      2 :
         begin
            lv_tmpProviderNm := 'SQL Server';
            lv_tmpSectionNm  := 'MSSQL_TDBCONINFO' + ' - ' + cxTextEd_TargetDBID.Text;
         end;
      3 :
         begin
            lv_tmpProviderNm := 'PostgreSQL';
            lv_tmpSectionNm  := 'PG_TDBCONINFO' + ' - ' + cxTextEd_TargetDBID.Text;
         end;
   end;
   lv_UniQry := TUniQuery.Create(nil);
   try
      with frmProgress do
      begin
         ufProgress(1, 'DB 접속중에 있습니다.', 20, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);

         if ufSet_DBConnection(  pi_Flg
                               , pi_UniDBConn
                               , lv_tmpProviderNm, pi_UniDBConn.Name
                               , cxTextEd_TargetDBHost.Text
                               , cxTextEd_TargetDBPort.Text
                               , cxTextEd_TargetServiceNm.Text
                               , 'utf8'
                               , cxTextEd_TargetDBID.Text
                               , cxTextEd_TargetPWD.Text
                               , cxCmb_TargetConnString.Text
                               , cxCmb_TargetDB.Text) = 'SUCCESS' then
         begin
//            ufProgress(1, 'Charater Set을 설정합니다.', 60, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
//            frmMain.pGet_MySQLCharacterSetting(pv_SourceDBConn);

            ufProgress(1, '접속 정보를 저장합니다.', 40, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE',  cxCmb_TargetDBType.Text);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST',    ufEncrypt(cxTextEd_TargetDBHost.Text, _MY_KEY));
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT',    cxTextEd_TargetDBPort.Text);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID',  cxTextEd_TargetDBID.Text);
            ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ufEncrypt(cxTextEd_TargetPWD.Text, _MY_KEY));

            ufProgress(1, 'Database 목록을 가져오고 있습니다.', 80, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
            case pi_Flg of
               0 :
                  begin
                     pGet_MySQLDatabaseList(pi_UniDBConn, cxCmb_TargetDB);
                  end;
               1 :
                  begin
                     ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'SERVICE',  cxTextEd_TargetServiceNm.Text);
                     ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'AUTH',  cxCmb_TargetConnString.Text);
                     pGet_OracleUserList(pi_UniDBConn, cxCmb_TargetDB);
                     cxCmb_TargetDB.Text := UpperCase(cxTextEd_TargetDBID.Text);
                  end;
               2 :
                  begin
                     pGet_MSSQLDatabaseList(pi_UniDBConn, cxCmb_TargetDB);
                  end;
               3 :
                  begin
                     ufWriteINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DATABASE', cxCmb_TargetDB.Text);
                     //pSet_PGAutoCommit(pi_UniDBConn);
                     pGet_PGDatabaseList(pi_UniDBConn, cxCmb_TargetDB);
                  end;
            end;

            Timer_frmClose.Enabled := True;
            Timer_frmClose.Interval := 100;

            act_TargetDBConn.Enabled   := False;
            act_TargetDBReload.Enabled := True;
            act_TargetSQLRun.Enabled   := True;
         end else
         begin
            ufProgress(1, 'DB 접속이 실패 되었습니다.', 100, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);

            cxbtn_close.Enabled := True;
         end;
      end;

   finally
      FreeAndNil(lv_UniQry);
   end;
end;

function TfrmMain.ufSet_DBConnection(pi_Flg : Integer; pi_UniDBConn : TUniConnection; pi_DBProvider, pi_DBNm, pi_DBHost, pi_DBPort, pi_ServiceNm, pi_DBCharSet, pi_DBUserId, pi_DBPwd, pi_UserAuthMode, pi_DB : String) : String;
var
   lv_retVal : String;
begin
   lv_retVal := 'SUCCESS';
   try
      with pi_UniDBConn do
      begin
         Connected   := False;
         Name        := pi_DBNm;
         LoginPrompt := False;
         AutoCommit  := False;

         ProviderName := pi_DBProvider;
         Username     := pi_DBUserId;
         Password     := pi_DBPwd;
         Server       := pi_DBHost;
         Port         := StrToInt(pi_DBPort);

         case pi_Flg of
            0 :
               begin
                  //SpecificOptions.Values['Charset'] := 'utf';
                  //SpecificOptions.Values['UseUnicode'] := 'True';
               end;
            1 :
               begin
                  Server := pi_DBHost + ':' + pi_DBPort + ':' + pi_ServiceNm;
                  SpecificOptions.Values['Direct'] := 'True';
                  // 2021.03.02
                  // Mysql -> Oracle 이관시 CLOB 한글 깨짐 현상으로 주석 처리함.
                  //SpecificOptions.Values['Charset'] := pi_DBCharSet;
                  SpecificOptions.Values['UseUnicode'] := 'True';
               end;
            3 :
               begin
                  Database := pi_DB;
               end;
         end;



         Connected := True;
         AutoCommit := False;
      end;
   except
      on E : Exception do
      begin
         lv_retVal := 'FAIL';
      end;
   end;

   Result := lv_retVal;
end;

//****************************************************************************//
//* SQL을 실행한다.
//****************************************************************************//
function TfrmMain.ufBackGroundUniSQLExec(pi_Flg : Integer; pi_Sql, pi_SQLSession : String; pi_stlParam : TStringList; pi_ObjQry : TUniQuery) : Boolean;
var
   lv_iParamCnt : Integer;
   lv_bCheck    : Boolean;
   lv_Sql, lv_Msg, lv_QryElapsedTM : String;

   {-- 소요시간 계산  --}
   lv_dtStart, lv_dtEnd : TDateTime;
   lv_SqlExecTime, lv_SpoolParam : String;

   {-- SQL Error --}
   lv_SQLErrLineNum, lv_SQLErrColNum : Integer;
begin
   {-- Local Variable Initialize --}
   lv_bCheck := True;
   lv_Msg   := '';
   lv_Sql   := pi_Sql;
   lv_SpoolParam := '';

   {-- SQL 실행 시간 --}
   lv_SqlExecTime := ufDateFormat(5, Now);

   {-- Global 변수 초기화 (SQL Parase Error)  --}
   lv_SQLErrLineNum := 0;
   lv_SQLErrColNum  := 0;
   try
      with pi_ObjQry do
      begin
         Active     := False;
         //Connection := TUniConnection(Application.FindComponent(pi_SQLSession));
         try
            SQL.Clear;
            SQL.Text := ufSet_LineDelBlank(0, lv_Sql);
            {-- 소요시간 Start --}
            lv_dtStart := Now;
            Case pi_Flg of
               0 :
                  begin  {-- Parameter 와 SQL 같이 오는 경우 --}
                     FetchRows := StrToInt(cxSpinEdt_SFetch.Text);
                     Active := True;
                  end;
               1 :
                  begin  {-- Parameter 와 SQL 따로 오는 경우 --}
                     for lv_iParamCnt := 0 to pi_stlParam.Count - 1 do
                     begin
                        Params[lv_iParamCnt].AsString := pi_stlParam.Strings[lv_iParamCnt];
                        if lv_iParamCnt = 0 then lv_SpoolParam := '### Parameter : ' + pi_stlParam.Strings[lv_iParamCnt]
                        else lv_SpoolParam := lv_SpoolParam + ', ' + pi_stlParam.Strings[lv_iParamCnt];
                     end;
                     FetchRows := StrToInt(cxSpinEdt_SFetch.Text);
                     Active := True;
                  end;
               2 :
                  begin {-- Parameter 와 SQL 같이 오는 경우 --}
                     ExecSQL;
                  end;
               3 :
                  begin
                     for lv_iParamCnt := 0 to pi_stlParam.Count - 1 do
                     begin
                        Params[lv_iParamCnt].AsString := pi_stlParam.Strings[lv_iParamCnt];
                        if lv_iParamCnt = 0 then lv_SpoolParam := '### Parameter : ' + pi_stlParam.Strings[lv_iParamCnt]
                        else lv_SpoolParam := lv_SpoolParam + ', ' + pi_stlParam.Strings[lv_iParamCnt];
                     end;
                     ExecSQL;
                  end;
            end;
         except
            on E : Exception do
            begin
               {-- SQL Parae Error 정보 --}
               lv_Msg := '##### SQL Fail !!! : ' + E.Message + ' #####';
               //pSetLogging('Mr', 'ERROR', lv_Msg + #13 + '[' + lv_Sql + ']' + #13 + '[' + pi_stlParam.Text + ']');
               fSet_SQLSpool(0, lv_Sql, lv_Msg);
               lv_bCheck := False;
            end;
         end;
      end;
   finally
      {-- 소요시간 End --}
      lv_dtEnd := Now;
      lv_QryElapsedTM := 'SQL Elapsed Time : ' + fGetQueryElapsedTime(0, lv_dtStart, lv_dtEnd);

      {-- SQL Parse Error Message Logging --}
      if lv_bCheck = False then
      begin
        {-- SQL Logging --}
        //ufSQLSpool(1, lv_SQLErrLineNum, lv_SQLErrColNum, lv_Sql, lv_Msg);
        //pSetLogging('SQL-DEBUG', '');
      end else
      begin
        {-- SQL Logging --}
        //ufSQLSpool(0, lv_SQLErrLineNum, lv_SQLErrColNum, lv_Sql, '');
        //if lv_Msg <> '' then ufSQLSpool(0, lv_SQLErrLineNum, lv_SQLErrColNum, lv_Msg, '');
      end;
      {-- Param Logging --}
      //if lv_SpoolParam <> '' then ufSQLSpool(0, lv_SQLErrLineNum, lv_SQLErrColNum, lv_SpoolParam, '');

      {-- 소요시간 Logging --}
      lv_Msg := '######### SQL 실행 시간 :  ' + lv_SqlExecTime + ' - ' + lv_QryElapsedTM + ' ##########';
      fSet_SQLSpool(0, lv_Sql, lv_Msg);
      Result := lv_bCheck;
   end;

end;

//****************************************************************************//
//* Mysql Database 목록을 가져온다.
//****************************************************************************//
procedure TfrmMain.pGet_MySQLDatabaseList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
var
   lv_UniQry : TUniQuery;
begin
   pi_ObjCmbBox.ItemIndex := -1;
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry := TUniQuery.Create(nil);
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.BeginUpdate;
   try
      lv_UniQry.Connection := pi_UniConn;
      if ufBackGroundUniSQLExec(0, pb_DBSQL[0].rSQLText, pi_UniConn.Name, nil, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.EndUpdate;
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* Mysql Database 를 변경한다.
//****************************************************************************//
procedure TfrmMain.pSet_MySQLChangeDatabase(pi_UniConn : TUniConnection; pi_DBNm : String);
var
   lv_UniQry : TUniQuery;
begin
   lv_UniQry := TUniQuery.Create(nil);
   try
      lv_UniQry.Connection := pi_UniConn;
      pi_UniConn.Database := pi_DBNm;
      ufBackGroundUniSQLExec(2, 'USE ' + pi_DBNm, pi_UniConn.Name, nil, lv_UniQry);
   finally
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* 선택한 Database의 Table List를 가져온다.
//****************************************************************************//
procedure TfrmMain.pSet_MySQLTableList(pi_UniConn : TUniConnection; pi_ObjCmb : TcxComboBox);
var
   lv_UniQry : TUniQuery;
begin
   pi_ObjCmb.ItemIndex := -1;
   (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry := TUniQuery.Create(nil);
   try
      lv_UniQry.Connection := pi_UniConn;
      if ufBackGroundUniSQLExec(0, pb_DBSQL[2].rSQLText, pi_UniConn.Name, nil, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* Oracle User 목록을 가져온다.
//****************************************************************************//
procedure TfrmMain.pGet_OracleUserList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
var
   lv_UniQry : TUniQuery;
begin
   pi_ObjCmbBox.ItemIndex := -1;
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry := TUniQuery.Create(nil);
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.BeginUpdate;
   try
      lv_UniQry.Connection := pi_UniConn;
      ufBackGroundUniSQLExec(2, pb_DBSQL[10].rSQLText, pi_UniConn.Name, nil, lv_UniQry);
      ufBackGroundUniSQLExec(2, pb_DBSQL[11].rSQLText, pi_UniConn.Name, nil, lv_UniQry);
      if ufBackGroundUniSQLExec(0, pb_DBSQL[3].rSQLText, pi_UniConn.Name, nil, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.EndUpdate;
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* 선택한 User의 Table List를 가져온다.
//****************************************************************************//
procedure TfrmMain.pSet_OracleTableList(pi_Param : String; pi_UniConn : TUniConnection; pi_ObjCmb : TcxComboBox);
var
   lv_UniQry : TUniQuery;
   lv_stlParam : TStringList;
begin
   pi_ObjCmb.ItemIndex := -1;
   (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry   := TUniQuery.Create(nil);
   lv_stlParam := TStringList.Create;
   lv_stlParam.StrictDelimiter := True;
   try
      lv_stlParam.Add(pi_Param);
      lv_UniQry.Connection := pi_UniConn;
      if ufBackGroundUniSQLExec(1, pb_DBSQL[4].rSQLText, pi_UniConn.Name, lv_stlParam, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      FreeAndNil(lv_stlParam);
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* MSSql Database 목록을 가져온다.
//****************************************************************************//
procedure TfrmMain.pGet_MSSQLDatabaseList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
var
   lv_UniQry : TUniQuery;
begin
   pi_ObjCmbBox.ItemIndex := -1;
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry := TUniQuery.Create(nil);
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.BeginUpdate;
   try
      lv_UniQry.Connection := pi_UniConn;
      if ufBackGroundUniSQLExec(0, pb_DBSQL[7].rSQLText, pi_UniConn.Name, nil, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.EndUpdate;
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* MSSql Database 를 변경한다.
//****************************************************************************//
procedure TfrmMain.pSet_MSSQLChangeDatabase(pi_UniConn : TUniConnection; pi_DBNm : String);
var
   lv_UniQry : TUniQuery;
begin
   lv_UniQry := TUniQuery.Create(nil);
   try
      lv_UniQry.Connection := pi_UniConn;
      pi_UniConn.Database := pi_DBNm;
      ufBackGroundUniSQLExec(2, 'USE ' + pi_DBNm, pi_UniConn.Name, nil, lv_UniQry);
   finally
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* 선택한 Database의 Table List를 가져온다.
//****************************************************************************//
procedure TfrmMain.pSet_MSSQLTableList(pi_UniConn : TUniConnection; pi_ObjCmb : TcxComboBox);
var
   lv_UniQry : TUniQuery;
begin
   pi_ObjCmb.ItemIndex := -1;
   (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry := TUniQuery.Create(nil);
   try
      lv_UniQry.Connection := pi_UniConn;
      if ufBackGroundUniSQLExec(0, pb_DBSQL[8].rSQLText, pi_UniConn.Name, nil, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* Postgresql Database 목록을 가져온다.
//****************************************************************************//
procedure TfrmMain.pGet_PGDatabaseList(pi_UniConn : TUniConnection; pi_ObjCmbBox : TcxComboBox);
var
   lv_UniQry : TUniQuery;
   lv_DBBk : String;
begin
   lv_DBBk := pi_ObjCmbBox.Text;
   pi_ObjCmbBox.ItemIndex := -1;
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry := TUniQuery.Create(nil);
   (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.BeginUpdate;
   try
      lv_UniQry.Connection := pi_UniConn;
      if ufBackGroundUniSQLExec(0, pb_DBSQL[12].rSQLText, pi_UniConn.Name, nil, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      (pi_ObjCmbBox.Properties as TcxComboBoxProperties).Items.EndUpdate;
      pi_ObjCmbBox.Text := lv_DBBk;
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* 선택한 Database의 Table List를 가져온다.
//****************************************************************************//
procedure TfrmMain.pSet_PGTableList(pi_UniConn : TUniConnection; pi_ObjText : TcxTextEdit; pi_ObjCmb : TcxComboBox);
var
   lv_UniQry : TUniQuery;
   lv_stlParam : TStringList;
begin
   pi_ObjCmb.ItemIndex := -1;
   (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Clear;
   lv_UniQry := TUniQuery.Create(nil);

   lv_stlParam := TStringList.Create;
   try
      lv_stlParam.Add(pi_ObjText.Text);
      lv_UniQry.Connection := pi_UniConn;
      if ufBackGroundUniSQLExec(1, pb_DBSQL[13].rSQLText, pi_UniConn.Name, lv_stlParam, lv_UniQry) then
      begin
         while not lv_UniQry.Eof do
         begin
            (pi_ObjCmb.Properties as TcxComboBoxProperties).Items.Add(lv_UniQry.Fields[0].asString);
            lv_UniQry.Next;
         end;
      end;
   finally
      FreeAndNil(lv_stlParam);
      FreeAndNil(lv_UniQry);
   end;
end;
//****************************************************************************//
//* Postgresql Autocommit Off
//****************************************************************************//
procedure TfrmMain.pSet_PGAutoCommit(pi_UniConn : TUniConnection);
var
   lv_UniQry : TUniQuery;
begin
   lv_UniQry := TUniQuery.Create(nil);
   try
      lv_UniQry.Connection := pi_UniConn;
      ufBackGroundUniSQLExec(0, pb_DBSQL[15].rSQLText, pi_UniConn.Name, nil, lv_UniQry)
   finally
      FreeAndNil(lv_UniQry);
   end;
end;

//****************************************************************************//
//* Vitamin SQL Spool
//* Parameter : pi_Flg
//*             pi_Sql
//*             pi_SQLMsg
//*             pi_ObjSynEdt
//****************************************************************************//
function TfrmMain.fSet_SQLSpool(pi_Flg : Integer; pi_Sql, pi_Msg : String) : String;
var
  {-- Log를 저장하기 위한 변수 선언 --}
  lv_FileDir, lv_FileNm : String;
  lv_logFile : TextFile;

  lv_LoopCnt, lv_LogLineCnt1, lv_LogLineCnt2 : Integer;
  lv_TmpStr : String;
begin
   SynEdit_Log.Lines.BeginUpdate;
   try
      {--  현재 Editor Line Count  --}
      lv_LogLineCnt1 := SynEdit_Log.Lines.Count;

      SynEdit_Log.Lines.Add('');
      SynED_Main.Text := pi_Sql;
      SynEdit_Log.Lines.AddStrings(SynED_Main.Lines);
      SynED_Main.Text := pi_Msg;
      SynEdit_Log.Lines.AddStrings(SynED_Main.Lines);

      {--  Log 추가 후  Editor Line Count  --}
      lv_LogLineCnt2 := SynEdit_Log.Lines.Count;

      {-- Log 지우기  --}
      if lv_LogLineCnt2 > 3000 then
      begin
         for lv_LoopCnt := 0 to (lv_LogLineCnt2 - lv_LogLineCnt1) - 1 do
         begin
            SynEdit_Log.Lines.Delete(lv_LoopCnt);
         end;
      end;
   finally
      SynEdit_Log.GotoLineAndCenter(lv_LogLineCnt2);
      SynEdit_Log.Lines.EndUpdate;
   end;

end;

//****************************************************************************//
//* SynEdit Setting
//****************************************************************************//
procedure TfrmMain.pSet_SynEditSetting(pi_Flg : Integer; pi_ObjSynEd : TSynEdit);
begin
   with pi_ObjSynEd do
   begin
      Lines.Clear;
      Options := SynED_Main.Options;
      // eoScrollPastEol      : Editor 마우스 클릭시 클릭한 위치에 cursor 가 생김
      // eoTrimTrailingSpaces : 맨뒤 공백 제거
      // eoShowSpecialChars   : 공백, 캐리지리턴 값 에 대한 표시.

      {-- Keystroker --}
      Keystrokes := SynED_Main.Keystrokes;

      {-- Etc Editor Option --}
      Color                          := SynED_Main.Color;
      Font.Name                      := SynED_Main.Font.Name;
      Font.Size                      := SynED_Main.Font.Size;
      Gutter.Font.Name               := SynED_Main.Font.Name;
      Gutter.Font.Size               := SynED_Main.Font.Size;
      Gutter.ShowLineNumbers         := SynED_Main.Gutter.ShowLineNumbers;
      Gutter.ZeroStart               := SynED_Main.Gutter.ZeroStart;
      WantTabs                       := SynED_Main.WantTabs;
      ActiveLineColor                := SynED_Main.ActiveLineColor;
      ExtraLineSpacing               := SynED_Main.ExtraLineSpacing;
      TabWidth                       := SynED_Main.TabWidth;
      WordWrap                       := SynED_Main.WordWrap;

      Highlighter := SynSQL_HH1;
   end;
end;

//****************************************************************************//
//* Line 끝의 공백을 제거
//****************************************************************************//
function TfrmMain.ufSet_LineDelBlank(pi_Flg : Integer; pi_StrParam : String) : String;
var
   lv_LoopCnt : Integer;
   lv_Return  : String;
begin
   lv_Return  := '';
   SynED_Main.Clear;
   SynED_Main.Lines.BeginUpdate;
   try
      SynED_Main.Text := pi_StrParam;
      for lv_LoopCnt := 0 to SynED_Main.Lines.Count - 1 do
      begin
        lv_Return := lv_Return + #13 + TrimRight(StringReplace(SynED_Main.Lines.Strings[lv_LoopCnt], #13#10, '', [rfReplaceAll]));
      end;
   finally
      SynED_Main.Lines.BeginUpdate;
      Result := lv_Return;
   end;
end;

//****************************************************************************//
// cxGrid 구성
//****************************************************************************//
procedure TfrmMain.pSetCxGridSetting(pi_Flg : Integer; pi_ObjDts : TDataSource; pi_objGridTableView : TcxGridDBTableView);
var
   lv_LoopCnt: Integer;
   AColumn: TcxGridDBColumn;
begin
   with pi_objGridTableView do
   begin
      DataController.DataSource := nil;
      DataController.DataSource := pi_ObjDts;
     { -- Grid 부분범위 처리 -- }
     DataController.DataModeController.GridMode := True;
     DataController.BeginUpdate;
     try
       (pi_objGridTableView.DataController as IcxCustomGridDataController).DeleteAllItems;

        { -- Rownum 표현 -- }
        AColumn := CreateColumn;
        AColumn.Caption := '#NO';
        AColumn.DataBinding.ValueTypeClass := TcxStringValueType;
        AColumn.Styles.Content := frmMain.cxStyle1;
        AColumn.Options.Editing := False;

       { -- SQL 결과를 Grid에 표현 -- }
       (pi_objGridTableView.DataController as IcxCustomGridDataController).CreateAllItems(True);
       for lv_LoopCnt := 0 to DataController.ItemCount - 1 do
       begin
         if Columns[lv_LoopCnt].Caption = '#NO' then
         begin
           { -- Rownum 표시 -- }
           //Columns[lv_LoopCnt].Properties.Alignment.Horz := taRightJustify;
           Columns[lv_LoopCnt].OnGetDataText := cxGrd_formatDBTableView1Column2GetDataText;
         end
         else
         begin
           { -- Image, Lob, Binary 표시 : uses 절에 cxImage, cxMemo, cxBlobEdit, Clipbrd, FileCtr -- }

           if pi_objGridTableView.Columns[lv_LoopCnt].DataBinding.Field.DataType in [ftGraphic, ftBlob, ftTypedBinary, ftOraBlob] then
           begin
             Columns[lv_LoopCnt].PropertiesClass := TcxImageProperties;
             TcxImageProperties(Columns[lv_LoopCnt]).GraphicClass := TcxBitmap;
             //TcxImageProperties(Columns[lv_LoopCnt]).GraphicClassName :=
           end else if Columns[lv_LoopCnt].DataBinding.Field.DataType in [ftBytes, ftByte, ftVarBytes, ftVariant] then
           begin
             Columns[lv_LoopCnt].PropertiesClass := TcxMemoProperties;
             Columns[lv_LoopCnt].OnGetDataText := cxGrd_formatDBTableView1Column1GetDataText;
             { -- DataTime 표시 -- }
           end else if Columns[lv_LoopCnt].DataBinding.Field.DataType in [ftDateTime] then
           begin
             Columns[lv_LoopCnt].OnGetDataText := cxGrd_formatDBTableView1Column3GetDataText;
             { -- Timestamp 표시 -- }
           end else if Columns[lv_LoopCnt].DataBinding.Field.DataType in
             [ftTimeStamp] then
           begin
             Columns[lv_LoopCnt].OnGetDataText := cxGrd_formatDBTableView1Column4GetDataText;
           end;
         end;
         Columns[lv_LoopCnt].HeaderAlignmentHorz := taCenter;
         // showmessage(Columns[lv_LoopCnt].Caption + ' : ' + IntToStr(lv_ColSize));
         {
           lv_ColSize := Columns[lv_LoopCnt].Width;
           if lv_ColSize > 300 then
           Columns[lv_LoopCnt].Width := 350
           else ApplyBestFit(Columns[lv_LoopCnt]);
           }
       end;

     finally
       DataController.EndUpdate;
     end;
   end;
end;

//****************************************************************************//
//* User Define Function, Procedure End
//****************************************************************************//

procedure TfrmMain.FormCreate(Sender: TObject);
begin
   {-- Initialize --}
   {-- Dir 생성 --}
   setAppPath(ExtractFilePath(ParamStr(0)));
   setLogPath(getAppPath + 'Log\');
   setConfigPath(getAppPath + 'Config\');

   //Directory 생성
   ufCreateDir(0, getLogPath);
   ufCreateDir(0, getConfigPath);

   {-- Logger 생성 --}
   TLogBasicConfigurator.Configure;
   TLogLogger.GetRootLogger.Level := All;

   cxTextEd_SourceCurrentDBType.Text := '0';
   cxTextEd_TargetCurrentDBType.Text := '0';

   cxCmb_SourceDBType.ItemIndex := 0;
   cxCmb_TargetDBType.ItemIndex := 0;

   cxCmb_SourceSaveDBType.Clear;
   cxCmb_TargetSaveDBType.Clear;

   cxTextEd_SourceDBHost.Clear;
   cxTextEd_TargetDBHost.Clear;

   cxTexted_SourceDBPort.Clear;
   cxTexted_TargetDBPort.Clear;

   cxTextEd_SourceDBID.Clear;
   cxTextEd_TargetDBID.Clear;

   cxTextEd_SourcePWD.Clear;
   cxTextEd_TargetPWD.Clear;

   cxCmb_SourceConnString.ItemIndex := 0;
   cxCmb_TargetConnString.ItemIndex := 0;

   cxTextEd_SourceServiceNm.Clear;
   cxTextEd_TargetServiceNm.Clear;

   cxCmb_SourceDB.Clear;
   cxCmb_TargetDB.Clear;

   cxCmb_SourceTable.Clear;
   cxCmb_TargetTable.Clear;

   pSet_SynEditSetting(0, SynEdit_Source);
   pSet_SynEditSetting(0, SynEdit_Log);
   pSet_SynEditSetting(0, SynEdit_Target);

   {-- Local DB에서 사용할 SQL을 저장한다. --}
   pSetDBSQL(SynEd_DBSQL);

   LoadDBConnInfo(0, cxCmb_SourceSaveDBType);
   LoadDBConnInfo(1, cxCmb_TargetSaveDBType);

end;

procedure TfrmMain.act_SourceColResizeExecute(Sender: TObject);
begin
   cxGrid_SourceDBTableView1.ApplyBestFit();
end;

procedure TfrmMain.act_SourceDBConnExecute(Sender: TObject);
begin
   if cxTextEd_SourceDBHost.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 Host를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_SourceDBHost.SetFocus;
      Exit;
   end;
   if cxTextEd_SourceDBPort.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 Port를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_SourceDBPort.SetFocus;
      Exit;
   end;
   if cxTextEd_SourceDBID.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 User Id를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_SourceDBID.SetFocus;
      Exit;
   end;
   if cxTextEd_SourcePWD.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 User 비밀번호를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_SourcePWD.SetFocus;
      Exit;
   end;

   case cxCmb_SourceDBType.ItemIndex of
      1 :
         begin
            if cxTextEd_SourceServiceNm.Text = '' then
            begin
               Application.MessageBox(StrPCopy(pv_arrMessage, 'Oracle Service 명을 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
               cxTextEd_SourceServiceNm.SetFocus;
               Exit;
            end;
         end;
   end;

   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Database에 접속 중입니다. 잠시만 기다려 주세요.!!';
      cxTxtEd_ProgressTypeFlg.Text := IntToStr(cxCmb_SourceDBType.ItemIndex);
      ShowModal;
   end;

end;

procedure TfrmMain.act_SourceDBReloadExecute(Sender: TObject);
begin
   case cxCmb_SourceDBType.ItemIndex of
      0 : pSet_MySQLTableList(UniConn_Source, cxCmb_SourceTable);
      1 : pSet_OracleTableList(cxCmb_SourceDB.Text, UniConn_Source, cxCmb_SourceTable);
   end;
end;

procedure TfrmMain.act_SourceSQLRunExecute(Sender: TObject);
begin
   if Trim(SynEdit_Source.Text) = '' then Exit;

   if UniConn_Source.Connected = True then
   begin
      UniQry_Source.Active := False;
      UniQry_Source.Connection := UniConn_Source;
      UniQry_Source.SpecificOptions.Values['FetchAll'] := 'False';
      UniQry_Source.FetchRows := 500;
      if ufBackGroundUniSQLExec(0, SynEdit_Source.Text, UniConn_Source.Name, nil, UniQry_Source) then
      begin
         pSetCxGridSetting(0, UniDts_Source, cxGrid_SourceDBTableView1);
      end;
   end;
end;

procedure TfrmMain.act_SourceTransExecute(Sender: TObject);
begin
   if UniConn_Target.Connected = False then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, '이관할 Target DB에 접속을 해주세요.'), '이관 Error', MB_OK + MB_ICONERROR);
      cxCmb_TargetTable.SetFocus;
      Exit;
   end;

   if cxCmb_TargetTable.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, '이관할 Target Table 을 선택해 주세요.'), '이관 Error', MB_OK + MB_ICONERROR);
      cxCmb_TargetTable.SetFocus;
      Exit;
   end;

   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Data 이관 중입니다. 잠시만 기다려 주세요.!!';
      case cxCmb_TargetDBType.ItemIndex of
         0 : cxTxtEd_ProgressTypeFlg.Text := '100'; // MySQL
         1 : cxTxtEd_ProgressTypeFlg.Text := '101'; // Oracle
         2 : cxTxtEd_ProgressTypeFlg.Text := '102'; // MsSQL
         3 : cxTxtEd_ProgressTypeFlg.Text := '103'; // Postgresql
      end;
      cxPrgbar_SQLCount.Visible := True;
      ShowModal;
   end;
end;

procedure TfrmMain.act_TargetColResizeExecute(Sender: TObject);
begin
   cxGrid_TargetDBTableView1.ApplyBestFit();
end;

procedure TfrmMain.act_TargetDBConnExecute(Sender: TObject);
begin
   if cxTextEd_TargetDBHost.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 Host를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_TargetDBHost.SetFocus;
      Exit;
   end;
   if cxTextEd_TargetDBPort.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 Port를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_TargetDBPort.SetFocus;
      Exit;
   end;
   if cxTextEd_TargetDBID.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 User Id를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_TargetDBID.SetFocus;
      Exit;
   end;
   if cxTextEd_TargetPWD.Text = '' then
   begin
      Application.MessageBox(StrPCopy(pv_arrMessage, 'DB 접속 User 비밀번호를 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
      cxTextEd_TargetPWD.SetFocus;
      Exit;
   end;

   case cxCmb_TargetDBType.ItemIndex of
      1 :
         begin
            if cxTextEd_TargetServiceNm.Text = '' then
            begin
               Application.MessageBox(StrPCopy(pv_arrMessage, 'Oracle Service 명을 입력해 주세요.'), 'DB 접속 Error', MB_OK + MB_ICONERROR);
               cxTextEd_TargetServiceNm.SetFocus;
               Exit;
            end;
         end;
   end;

   frmProgress := TfrmProgress.Create(Self);
   with frmProgress do
   begin
      cxLbl_Elapsed.Caption      := 'Elapsed Time : 00:00:00.00';
      cxGrpBox_Progress1.Caption := 'Database에 접속 중입니다. 잠시만 기다려 주세요.!!';
      cxTxtEd_ProgressTypeFlg.Text := IntToStr(cxCmb_TargetDBType.ItemIndex + 10);
      ShowModal;
   end;

end;

procedure TfrmMain.act_TargetDBReloadExecute(Sender: TObject);
begin
   case cxCmb_TargetDBType.ItemIndex of
      0 : pSet_MySQLTableList(UniConn_Target, cxCmb_TargetTable);
      1 : pSet_OracleTableList(cxCmb_TargetDB.Text, UniConn_Target, cxCmb_TargetTable);
   end;
end;

procedure TfrmMain.act_TargetSQLRunExecute(Sender: TObject);
begin
   if Trim(SynEdit_Target.Text) = '' then Exit;

   if UniConn_Target.Connected = True then
   begin
      UniQry_Target.Active := False;
      UniQry_Target.Connection := UniConn_Target;
      UniQry_Target.SpecificOptions.Values['FetchAll'] := 'False';
      UniQry_Target.FetchRows := 500;
      if ufBackGroundUniSQLExec(0, SynEdit_Target.Text, UniConn_Target.Name, nil, UniQry_Target) then
      begin
         pSetCxGridSetting(0, UniDts_Target, cxGrid_TargetDBTableView1);
      end;
   end;
end;

procedure TfrmMain.cxCmb_SourceDBPropertiesEditValueChanged(Sender: TObject);
begin
   if UniConn_Source.Connected = False then Exit;

   if cxCmb_SourceDB.Text <> '' then
   begin
      case cxCmb_SourceDBType.ItemIndex of
         0 :
            begin
               pSet_MySQLChangeDatabase(UniConn_Source, cxCmb_SourceDB.Text);
               pSet_MySQLTableList(UniConn_Source, cxCmb_SourceTable);
            end;
         1 :
            begin
               pSet_OracleTableList(cxCmb_SourceDB.Text, UniConn_Source, cxCmb_SourceTable);
            end;
         2 :
            begin
               pSet_MSSQLChangeDatabase(UniConn_Source, cxCmb_SourceDB.Text);
               pSet_MSSQLTableList(UniConn_Source, cxCmb_SourceTable);
            end;
         3 :
            begin
               pSet_PGTableList(UniConn_Source, cxTextEd_SourceDBID, cxCmb_SourceTable);
            end;
      end;
   end;
end;

procedure TfrmMain.cxCmb_SourceDBTypePropertiesEditValueChanged(
  Sender: TObject);
begin
   case cxCmb_SourceDBType.ItemIndex of
      0, 2, 3 :
         begin
            cxCmb_SourceConnString.Visible := False;
            cxTextEd_SourceServiceNm.Visible := False;
         end;
      1 :
         begin
            cxCmb_SourceConnString.Visible := True;
            cxTextEd_SourceServiceNm.Visible := True;
         end;
   end;
   cxTextEd_SourceCurrentDBType.Text := IntToStr(cxCmb_SourceDBType.ItemIndex);
   UniConn_Source.Connected := False;
   act_SourceDBConn.Enabled := True;
   act_SourceSQLRun.Enabled := False;
   act_SourceDBReload.Enabled := False;
end;

procedure TfrmMain.cxCmb_SourceSaveDBTypePropertiesEditValueChanged(
  Sender: TObject);
var
   lv_tmpStr, lv_tmpUserId, lv_tmpSectionNm : String;
begin
   lv_tmpStr := cxCmb_SourceSaveDBType.Text;
   lv_tmpUserId := Trim(Copy(lv_tmpStr, Pos(':', lv_tmpStr) + 1, Length(lv_tmpStr)));

   if Pos('Source - MySQL', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'MYSQL_SDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_SourceDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_SourceDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_SourceDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_SourceDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_SourcePWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
   end else if Pos('Source - Oracle', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'ORACLE_SDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_SourceDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_SourceDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_SourceDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_SourceDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_SourcePWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
      cxTextEd_SourceServiceNm.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'SERVICE', '');
      cxCmb_SourceConnString.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'AUTH', '');
   end else if Pos('Source - SQL Server', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'MSSQL_SDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_SourceDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_SourceDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_SourceDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_SourceDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_SourcePWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
   end else if Pos('Source - Postgresql', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'PG_SDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_SourceDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_SourceDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_SourceDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_SourceDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_SourcePWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
      cxCmb_SourceDB.Text        := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DATABASE', '');
   end;
end;

procedure TfrmMain.cxCmb_TargetDBPropertiesEditValueChanged(Sender: TObject);
begin
   if UniConn_Target.Connected = False then Exit;
   
   if cxCmb_TargetDB.Text <> '' then
   begin
      case cxCmb_TargetDBType.ItemIndex of
         0 :
            begin
               pSet_MySQLChangeDatabase(UniConn_Target, cxCmb_TargetDB.Text);
               pSet_MySQLTableList(UniConn_Target, cxCmb_TargetTable);
            end;
         1 :
            begin
               pSet_OracleTableList(cxCmb_TargetDB.Text, UniConn_Target, cxCmb_TargetTable);
            end;
         2 :
            begin
               pSet_MSSQLChangeDatabase(UniConn_Target, cxCmb_TargetDB.Text);
               pSet_MSSQLTableList(UniConn_Target, cxCmb_TargetTable);
            end;
         3 :
            begin
               pSet_PGTableList(UniConn_Target, cxTextEd_TargetDBID, cxCmb_TargetTable);
            end;
      end;
   end;

end;

procedure TfrmMain.cxCmb_TargetDBTypePropertiesEditValueChanged(
  Sender: TObject);
begin
   case cxCmb_TargetDBType.ItemIndex of
      0, 2 :
         begin
            cxCmb_TargetConnString.Visible := False;
            cxTextEd_TargetServiceNm.Visible := False;
         end;
      1 :
         begin
            cxCmb_TargetConnString.Visible := True;
            cxTextEd_TargetServiceNm.Visible := True;
         end;
   end;
   cxTextEd_TargetCurrentDBType.Text := IntToStr(cxCmb_TargetDBType.ItemIndex);
   UniConn_Target.Connected := False;
   act_TargetDBConn.Enabled := True;
   act_TargetSQLRun.Enabled := False;
   act_TargetDBReload.Enabled := False;
end;

procedure TfrmMain.cxCmb_TargetSaveDBTypePropertiesEditValueChanged(
  Sender: TObject);
var
   lv_tmpStr, lv_tmpUserId, lv_tmpSectionNm : String;
begin
   lv_tmpStr := cxCmb_TargetSaveDBType.Text;
   lv_tmpUserId := Trim(Copy(lv_tmpStr, Pos(':', lv_tmpStr) + 1, Length(lv_tmpStr)));

   if Pos('Target - MySQL', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'MYSQL_TDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_TargetDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_TargetDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_TargetDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_TargetDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_TargetPWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
   end else if Pos('Target - Oracle', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'ORACLE_TDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_TargetDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_TargetDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_TargetDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_TargetDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_TargetPWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
      cxTextEd_TargetServiceNm.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'SERVICE', '');
      cxCmb_TargetConnString.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'AUTH', '');
   end else if Pos('Target - MSSQL', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'MSSQL_TDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_TargetDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_TargetDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_TargetDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_TargetDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_TargetPWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
   end else if Pos('Target - Postgresql', lv_tmpStr) > 0 then
   begin
      lv_tmpSectionNm := 'PG_TDBCONINFO' + ' - ' + lv_tmpUserId;

      cxCmb_TargetDBType.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DBTYPE', '');
      cxTextEd_TargetDBHost.Text := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'HOST', ''), _MY_KEY);
      cxTextEd_TargetDBPort.Text := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'PORT', '');
      cxTextEd_TargetDBID.Text   := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERID', '');
      cxTextEd_TargetPWD.Text    := ufDecrypt(ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'USERPWD', ''), _MY_KEY);
      cxCmb_TargetDB.Text        := ufReadINI(getConfigPath + _INIVITAENV, lv_tmpSectionNm, 'DATABASE', '');
   end;
end;

procedure TfrmMain.cxGrd_formatDBTableView1Column1GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
var
  lv_AFocusedRecordIndex, lv_ARecno: Integer;
begin
   lv_ARecno := TcxGridDBTableView(Sender.GridView).DataController.DataSource.DataSet.RecNo;
   lv_AFocusedRecordIndex := TcxGridDBTableView(Sender.GridView).Controller.FocusedRecordIndex;
   AText := IntToStr(lv_ARecno - lv_AFocusedRecordIndex + ARecordIndex);
end;


procedure TfrmMain.cxGrd_formatDBTableView1Column2GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
var
  lv_AFocusedRecordIndex, lv_ARecno: Integer;
begin
   lv_ARecno := TcxGridDBTableView(Sender.GridView).DataController.DataSource.DataSet.RecNo;
   lv_AFocusedRecordIndex := TcxGridDBTableView(Sender.GridView).Controller.FocusedRecordIndex;
   AText := IntToStr(lv_ARecno - lv_AFocusedRecordIndex + ARecordIndex);
end;

procedure TfrmMain.cxGrd_formatDBTableView1Column3GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if VarIsNull(TcxGridDBTableView(Sender.GridView).DataController.Values[ARecordIndex, Sender.Index]) then AText := ''
  else AText := ufDateFormat(5, TcxGridDBTableView(Sender.GridView).DataController.Values[ARecordIndex, Sender.Index]);
end;

procedure TfrmMain.cxGrd_formatDBTableView1Column4GetDataText(
  Sender: TcxCustomGridTableItem; ARecordIndex: Integer; var AText: string);
begin
  if VarIsNull(TcxGridDBTableView(Sender.GridView).DataController.Values[ARecordIndex, Sender.Index]) then AText := ''
  else AText := ufDateFormat(6, TcxGridDBTableView(Sender.GridView).DataController.Values[ARecordIndex, Sender.Index]);
end;

procedure TfrmMain.SynEdit_SourceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) and (ssCtrl in shift) then
   begin
      act_SourceSQLRunExecute(Sender);
   end;
end;

procedure TfrmMain.SynEdit_TargetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_RETURN) and (ssCtrl in shift) then
   begin
      act_TargetSQLRunExecute(Sender);
   end;

end;

end.
