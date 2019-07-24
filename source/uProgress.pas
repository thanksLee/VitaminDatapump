unit uProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Samples.Gauges, Vcl.Grids, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxProgressBar, cxTextEdit, cxMemo, cxRichEdit, cxLabel,
  cxGroupBox, Vcl.Menus, cxButtons, MemDS, DBAccess, Uni, dxSkinTheBezier;

type
  TfrmProgress = class(TForm)
    cxGrpBox_Progress1: TcxGroupBox;
    cxLbl_Elapsed: TcxLabel;
    cxRichEd_ProgressLog: TcxRichEdit;
    cxPgBar_Progress: TcxProgressBar;
    cxGroupBox1: TcxGroupBox;
    cxbtn_close: TcxButton;
    Timer_Prgs: TTimer;
    cxTxtEd_ProgressTypeFlg: TcxTextEdit;
    Timer_frmClose: TTimer;
    cxPrgbar_SQLCount: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Timer_PrgsTimer(Sender: TObject);
    procedure Timer_frmCloseTimer(Sender: TObject);
    procedure cxbtn_closeClick(Sender: TObject);
  private
    { Private declarations }
    var
      fv_dtStart : TDateTime;
  public
    { Public declarations }

    //****************************************************************************//
    //* 실행 과정을 보여 준다.
    //****************************************************************************//
    procedure ufProgress(pi_Flg : Integer; pi_Msg : String; pi_PrgsPercent : Integer; pi_Objlabel : TcxLabel; pi_ObjPrgs : TcxProgressBar; pi_ObjRichEdit : TcxRichEdit);
    procedure upSQLProcess(pi_Flg : Integer; pi_ObjDbConn : TFDConnection; pi_ObjDts : TDatasource; pi_ObjSgdParam : TStringGrid; lv_SQL : String);
    procedure pSet_SQLPorcess(pi_Flg : Integer; pi_arryParam : TArray<String>; pi_ObjSQry : TUniQuery; pi_UniConn : TUniConnection);

    function fGet_InsertSQL(pi_Flg : Integer; pi_Owner, pi_TableNm : String; pi_UniConn : TUniConnection) : TArray<String>;
  end;

var
  frmProgress: TfrmProgress;
  pv_Flg : Integer;
  pv_bStop : Boolean;

implementation
uses uMain, uLib;
{$R *.dfm}

//****************************************************************************//
//* User Define Function, Procedure Start
//****************************************************************************//

//****************************************************************************//
//* 실행 과정을 보여 준다.
//****************************************************************************//
procedure TfrmProgress.ufProgress(pi_Flg : Integer; pi_Msg : String; pi_PrgsPercent : Integer; pi_Objlabel : TcxLabel; pi_ObjPrgs : TcxProgressBar; pi_ObjRichEdit : TcxRichEdit);
var
   lv_LineTotCnt : Integer;
   lv_tmpStr : String;
begin
   if pi_Flg = 0 then pi_Objlabel.Caption := pi_Msg;
   pi_ObjPrgs.Position := pi_PrgsPercent;
   //lv_LineTotCnt := pi_ObjRichEdit.Lines.Count;
   pi_ObjRichEdit.Lines.BeginUpdate;
   try
      if pi_Flg = 10 then
      begin
         //pi_ObjRichEdit.Lines.Strings[lv_LineTotCnt] := pi_Msg;
         //lv_tmpStr := pi_ObjRichEdit.Text;
         pi_ObjRichEdit.Text := pi_Msg;
      end else
      begin
         pi_ObjRichEdit.Lines.Add(pi_Msg);
      end;
   finally
      pi_ObjRichEdit.Lines.EndUpdate;
      Application.ProcessMessages;
   end;
end;

procedure TfrmProgress.upSQLProcess(pi_Flg : Integer; pi_ObjDbConn : TFDConnection; pi_ObjDts : TDatasource; pi_ObjSgdParam : TStringGrid; lv_SQL : String);
var
   {-- 소요시간 계산  --}
   lv_dtTotalStart : TDateTime;
   lv_dtPartStart : TDateTime;

   lv_Query : TFDQuery;
   lv_LoopCnt, lv_TotalRecCnt, lv_ParamLoopCnt : Integer;
   lv_SuccessCnt, lv_ErrorCnt : Integer;
   lv_Param, lv_tmpColData : WideString;
begin
   {-- 소요시간 Start --}
   lv_dtTotalStart := Now;
   lv_dtPartStart := Now;

   with cxRichEd_ProgressLog do
   begin
      Lines.Add('-------------------------');
      Lines.Add('전체 Record 를 읽어오기를 시작 합니다.');
      Lines.Add('-------------------------');
   end;

   {*
   pi_ObjDts.DataSet.Last;

   lv_TotalRecCnt := pi_ObjDts.DataSet.RecordCount;

   pi_ObjDts.DataSet.First;
   }


   lv_LoopCnt := 0;
   lv_Query := TFDQuery.Create(nil);
   lv_Query.Connection := pi_ObjDbConn;
   pi_ObjDbConn.TxOptions.AutoCommit := False;


   with lv_Query do
   begin
      lv_Query.SQL.Clear;
      lv_Query.Active := False;
      lv_Query.SQL.Text := 'select count(1) c_totcnt from ( ' + frmMain.SynEdit_Source.Text + ' ) a';
      lv_Query.Active := True;

      lv_TotalRecCnt := lv_Query.Fields[0].AsInteger;
   end;

   with cxRichEd_ProgressLog do
   begin
     Lines.Add('-------------------------');
     Lines.Add('총 ' + IntToStr(lv_TotalRecCnt) + ' 건을 읽어 왔습니다.' );
     Lines.Add('-------------------------');
     Lines.Add('Elapsed Time : ' + ufQueryElapsedTime(0, lv_dtPartStart, Now));
     Lines.Add('-------------------------');
   end;

   pi_ObjDbConn.StartTransaction;
   try
     while not pi_ObjDts.DataSet.Eof do
     begin
       try
          lv_dtPartStart := Now;
          lv_Query.Active := False;
          lv_Query.SQL.Clear;
          lv_Query.SQL.Text := lv_SQL;
          lv_Param := '';

          for lv_ParamLoopCnt := 0 to pi_ObjSgdParam.RowCount - 1 do
          begin
            lv_tmpColData := pi_ObjDts.DataSet.Fields[lv_ParamLoopCnt].AsString;
//            if (Length(lv_tmpColData) > 1500) then
//            begin
//               pi_ObjDts.DataSet.Fields[lv_ParamLoopCnt].SetFieldType(ftMemo);
//            end;
            if pi_ObjSgdParam.Rows[lv_ParamLoopCnt].Strings[4] = 'N' then
            begin
               if CompareStr(lv_tmpColData, '') = 0 then
               begin
                  lv_tmpColData := ' ';
               end;
            end;
            if pi_ObjDts.DataSet.Fields[lv_ParamLoopCnt].DataType in [ftBlob, ftMemo, ftWideMemo] then
            begin
               lv_Query.Params[lv_ParamLoopCnt].AsMemo := lv_tmpColData;
            end else
//            end else if pi_ObjDts.DataSet.Fields[lv_ParamLoopCnt].DataType in [ftWideString] then
            begin
//               if (Length(lv_tmpColData) > 1000) then
//               begin
//                  lv_Query.Params[lv_ParamLoopCnt].AsMemo := lv_tmpColData;
//               end else begin
//                  lv_Query.Params[lv_ParamLoopCnt].AsString := lv_tmpColData;
//               end;
//            end else begin
//               lv_Query.Params[lv_ParamLoopCnt].Value := lv_tmpColData;
               lv_Query.Params[lv_ParamLoopCnt].AsString := lv_tmpColData;
            end;
            lv_Param := lv_Param + IntToStr(lv_ParamLoopCnt) + ' : [' + lv_tmpColData + ']' + #13#10;
          end;

          lv_Query.ExecSQL;
          Inc(lv_SuccessCnt);
       except
         On E : Exception do begin
            with cxRichEd_ProgressLog do
            begin
               Lines.Add('-------------------------');
               Lines.Add('SQL ERROR : ' + E.Message);
               Lines.Add('ReNo : ' + IntToStr(lv_LoopCnt+1));
               Lines.Add(lv_Query.SQL.Text);
               Lines.Add(lv_Param);
               Lines.Add('-------------------------');
               Inc(lv_ErrorCnt);
               if pi_Flg = 0 then
               begin
                  pi_ObjDbConn.Rollback;
                  Exit;
               end;
            end;
         end;
       end;
       cxPgBar_Progress.Position := (lv_LoopCnt * 100) div lv_TotalRecCnt;
       Inc(lv_LoopCnt);
       Application.ProcessMessages;
       pi_ObjDts.DataSet.Next;
     end;
     pi_ObjDbConn.Commit;
   finally
      with cxRichEd_ProgressLog do
      begin
        Lines.Add('총 ' + ufNumberFormat(1, lv_TotalRecCnt)
                + ' : Success : ' + ufNumberFormat(1, lv_SuccessCnt)
                + ' : Error : ' + ufNumberFormat(1, lv_ErrorCnt)
                + ' - Elapsed Time : ' + ufQueryElapsedTime(0, lv_dtTotalStart, Now));
      end;
      cxPgBar_Progress.Position := (lv_LoopCnt * 100) div lv_TotalRecCnt;
      lv_Query.Free;
   end;
end;

procedure TfrmProgress.pSet_SQLPorcess(pi_Flg : Integer; pi_arryParam : TArray<String>; pi_ObjSQry : TUniQuery; pi_UniConn : TUniConnection);
var
   lv_tmpOwner, lv_tmpTable, lv_tmpSQL, lv_Elapsed : String;
   lv_ColTotCnt, lv_tmpTotAffect, lv_tmpRecCnt, lv_CommitCnt : Integer;
   lv_tmpReVal : TArray<String>;

   lv_UniQry : TUniQuery;
   lv_LoopCnt, lv_ParamLoopCnt, lv_ColLoopCnt, lv_tmpTotLoop, lv_EFetchSize, lv_AffectRow : Integer;
   {-- 소요시간 계산  --}
   lv_dtTotalStart : TDateTime;
   lv_dtPartStart : TDateTime;
   lv_tmpStr : String;

   lv_TotCntCheck : Boolean;
begin

   SetLength(lv_tmpReVal, 3);
   lv_tmpTotAffect := 0;

   lv_TotCntCheck := frmMain.chkTotCnt_Without.Checked;
   lv_tmpRecCnt   := 0;

//   ufProgress(1, '이관할 데이터 전체 개수를 읽어 오고 있습니다.', 10, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
//   Application.ProcessMessages;

   //pi_ObjSQry.Last;  {-- Thread 안에다 넣으면 오류가 발생 --}
   //lv_tmpRecCnt    := pi_ObjSQry.RecordCount;

   //* 2019-06-13


//   ufProgress(1, ufNumberFormat(1, lv_tmpRecCnt) + ' 건을 읽어왔습니다.', 20, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
//   frmMain.fSet_SQLSpool(0, ufNumberFormat(1, lv_tmpRecCnt), '');

   ufProgress(1, 'Target Table의 Insert 문장을 만듭니다.', 10, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);

   lv_tmpOwner := pi_arryParam[0];
   lv_tmpTable := pi_arryParam[1];
   lv_tmpReVal := fGet_InsertSQL(pi_Flg, lv_tmpOwner, lv_tmpTable, pi_UniConn);

   if lv_tmpReVal[0] = 'FAIL' then Exit;

   lv_tmpSQL    := lv_tmpReVal[1];  {-- Generate 된 SQL 문장 --}
   lv_ColTotCnt := StrToInt(lv_tmpReVal[2]); {-- Target Table의 컬럼 개수 --}

   frmMain.fSet_SQLSpool(0, lv_tmpSQL, '');

   ufProgress(1, 'Target Table에 Data를 이관 합니다.', 40, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);

//   TThread.CreateAnonymousThread(procedure ()
//   var
//      lv_UniQry : TUniQuery;
//      lv_LoopCnt, lv_ParamLoopCnt, lv_ColLoopCnt, lv_tmpTotLoop, lv_EFetchSize, lv_AffectRow : Integer;
//      {-- 소요시간 계산  --}
//      lv_dtTotalStart : TDateTime;
//      lv_dtPartStart : TDateTime;
//      lv_tmpStr : String;
   //begin
      {-- 소요시간 Start --}
      lv_dtTotalStart := Now;
      lv_dtPartStart := Now;
      lv_EFetchSize := StrToInt(frmMain.cxSpinEdt_EFetch.Text);

      lv_UniQry := TUniQuery.Create(nil);
      pi_ObjSQry.DisableControls;  {-- 이걸 하지 않으면 속도차이가 너무 난다. --}
      //pi_ObjSQry.UniDirectional := True;
      frmMain.cxGrid_SourceDBTableView1.DataController.BeginUpdate;
      frmMain.UniDts_Source.Enabled := False; // out of memory를 방지하기 위하여
      try
         //* 2019-06-13

         ufProgress(1, '이관할 데이터 전체 개수를 읽어 오고 있습니다.', 20, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
         Application.ProcessMessages;

         {--
            2019.07.24
            - 대용량의 테이블 조회시 count 시간이 너무 오래 걸림
              따라서 제외하고 할수 있도록 조치
          --}
         if lv_TotCntCheck = False then
         begin
            with lv_UniQry do
            begin
               SQL.Clear;
               Active := False;
               Connection := frmMain.UniConn_Source;

               SQL.Text := 'select count(1) c_totcnt from ( ' + frmMain.SynEdit_Source.Text + ' ) a';
               Active := True;

               lv_tmpRecCnt := Fields[0].AsInteger;
               Active := False;
            end;

            ufProgress(1, ufNumberFormat(1, lv_tmpRecCnt) + ' 건을 읽어왔습니다.', 30, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
            frmMain.fSet_SQLSpool(0, ufNumberFormat(1, lv_tmpRecCnt), '');
         end;

         pi_ObjSQry.First;
         lv_UniQry.Connection := pi_UniConn;
         lv_UniQry.SQL.Text := lv_tmpSQL;
         lv_UniQry.UniDirectional := True;

         lv_LoopCnt := 0;
         cxPrgbar_SQLCount.Position := 0;
         lv_tmpTotLoop := 0;
         lv_AffectRow := 0;
         lv_CommitCnt := 0;
         while not pi_ObjSQry.Eof do
         begin
            try
               {-- Array로 처리할 건수 셋팅 --}
               if lv_LoopCnt = 0 then
               begin
                  lv_UniQry.Params.ValueCount := lv_EFetchSize; {-- Insert Array 처리 --}
                  pi_UniConn.StartTransaction;
                  {-- 소요시간 Start --}
                  lv_dtPartStart := Now;
               end;

               {-- Parameter Array 처리 --}
               for lv_ColLoopCnt := 0 to lv_ColTotCnt - 1 do
               begin
                  if (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftDate) or
                     (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftDateTime) or
                     (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftTime) or
                     (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftTimeStamp)
                  then
                  begin
                     lv_UniQry.Params[lv_ColLoopCnt][lv_LoopCnt].AsDateTime := pi_ObjSQry.Fields[lv_ColLoopCnt].AsDateTime;
                  end else if (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftWideMemo) or
                              (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftMemo) or
                              (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftWideString) or
                              (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftOraClob)
                  then
                  begin
                     lv_UniQry.Params[lv_ColLoopCnt][lv_LoopCnt].AsMemo := pi_ObjSQry.Fields[lv_ColLoopCnt].AsWideString;
                  end else if (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftOraBlob)
                  then
                  begin
                     lv_UniQry.Params[lv_ColLoopCnt][lv_LoopCnt].AsBlob := pi_ObjSQry.Fields[lv_ColLoopCnt].AsBytes;
                  end else if (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftInteger) or
                              (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftSmallint)
                  then
                  begin
                     lv_UniQry.Params[lv_ColLoopCnt][lv_LoopCnt].AsInteger := pi_ObjSQry.Fields[lv_ColLoopCnt].AsInteger;
//                  end else if (pi_ObjSQry.Fields[lv_ColLoopCnt].DataType = ftWideString)
//                  then
//                  begin
//                     lv_UniQry.Params[lv_ColLoopCnt][lv_LoopCnt].AsWideString := pi_ObjSQry.Fields[lv_ColLoopCnt].AsWideString;
                  end else
                  begin
                     lv_UniQry.Params[lv_ColLoopCnt][lv_LoopCnt].AsString := pi_ObjSQry.Fields[lv_ColLoopCnt].AsString;
                  end;
               end;
            except
               on E : Exception do
               begin
                  frmMain.fSet_SQLSpool(0, lv_tmpSQL, lv_tmpTable + ': Error - ' + E.Message);
//                  frmMain.fSet_SQLSpool(0, lv_tmpSQL, '');
               end;
            end;
            Inc(lv_LoopCnt);

            if lv_LoopCnt = lv_EFetchSize then
            begin
               lv_AffectRow := 0;
               try
                  lv_UniQry.Execute(lv_LoopCnt);
                  pi_UniConn.Commit;
                  lv_AffectRow := lv_UniQry.RowsAffected;
                  Inc(lv_CommitCnt);
               except
                  on E : Exception do
                  begin
                     lv_AffectRow := -1;
                     frmMain.fSet_SQLSpool(0, lv_tmpSQL, lv_tmpTable + ': Error - ' + E.Message);
                     pi_UniConn.Rollback;
                     {--
                        Exception 시 루프 종료
                       --}
                     Break;
                  end;
               end;

               lv_LoopCnt := 0;  {-- 처리할 건수 초기화 --}
               lv_tmpTotAffect := lv_tmpTotAffect + lv_AffectRow;
               lv_Elapsed      := ' - Elapsed Time : ' + ufQueryElapsedTime(0, lv_dtPartStart, Now);

               if lv_TotCntCheck = False then
               begin
                  ufProgress(1, lv_tmpTable + ' : ' + ufNumberFormat(1, lv_AffectRow) + lv_Elapsed, 50, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
                  frmMain.fSet_SQLSpool(0, lv_tmpSQL, lv_tmpTable + ' : ' + ufNumberFormat(1, lv_AffectRow) + lv_Elapsed);
               end else
               begin
                  ufProgress(10, lv_tmpTable + ' - Commit : ' + ufNumberFormat(1, lv_CommitCnt) + ' : ' + ufNumberFormat(1, lv_tmpTotAffect) + lv_Elapsed, 50, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
                  frmMain.fSet_SQLSpool(0, lv_tmpSQL, lv_tmpTable + ' - Commit : ' + ufNumberFormat(1, lv_CommitCnt) + ' : ' + ufNumberFormat(1, lv_tmpTotAffect) + lv_Elapsed);
               end;

               if pv_bStop = True then Break;
            end;
            Inc(lv_tmpTotLoop);

            if lv_TotCntCheck = False then
            begin
               cxPrgbar_SQLCount.Position := (lv_tmpTotLoop * 100) div lv_tmpRecCnt;
            end;

            pi_ObjSQry.Next;
         end;

         {-- 처리할 Array 보다 작을때.. --}
         if (lv_LoopCnt < lv_EFetchSize) and (lv_LoopCnt > 0) then
         begin
            try
               lv_UniQry.Params.ValueCount := lv_LoopCnt;
               lv_UniQry.Execute(lv_LoopCnt);
               pi_UniConn.Commit;
            except
               on E : Exception do
               begin
                  frmMain.fSet_SQLSpool(0, lv_tmpSQL, lv_tmpTable + ': Error - ' + E.Message);
                  pi_UniConn.Rollback;
               end;
            end;
            lv_tmpTotAffect := lv_tmpTotAffect + lv_UniQry.RowsAffected;
            lv_Elapsed      := ' - Elapsed Time : ' + ufQueryElapsedTime(0, lv_dtPartStart, Now);

            ufProgress(1, lv_tmpTable + ' : ' + ufNumberFormat(1, lv_UniQry.RowsAffected) + lv_Elapsed, 50, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
            frmMain.fSet_SQLSpool(0, lv_tmpSQL, lv_tmpTable + ' : ' + ufNumberFormat(1, lv_UniQry.RowsAffected) + lv_Elapsed);
         end;
      finally
         lv_Elapsed := ' - Elapsed Time : ' + ufQueryElapsedTime(0, lv_dtTotalStart, Now);
         ufProgress(1, lv_tmpTable + ' : 총 - ' + ufNumberFormat(1, lv_tmpTotAffect) + lv_Elapsed, 100, cxLbl_Elapsed, cxPgBar_Progress, cxRichEd_ProgressLog);
         frmMain.fSet_SQLSpool(0, lv_tmpSQL, lv_tmpTable + ' : 총 - ' + ufNumberFormat(1, lv_tmpTotAffect) + lv_Elapsed);
         FreeAndNil(lv_UniQry);
         //Timer_frmClose.Enabled := True;
         //Timer_frmClose.Interval := 100;
         Timer_Prgs.Enabled := False;
         cxbtn_close.Enabled := True;
         frmMain.UniDts_Source.Enabled := True;
         frmMain.cxGrid_SourceDBTableView1.DataController.EndUpdate;
         pi_ObjSQry.EnableControls;
         pi_UniConn.Commit;
      end;
   //end).Start;
end;

//****************************************************************************//
//* Target DB의 Table Column을 가져온다.
//****************************************************************************//
function TfrmProgress.fGet_InsertSQL(pi_Flg : Integer; pi_Owner, pi_TableNm : String; pi_UniConn : TUniConnection) : TArray<String>;
var
   lv_tmpColNm, lv_tmpColType, lv_Sql, lv_reSql, lv_ColLst_1, lv_ColLst_2 : String;
   lv_UniQry : TUniQuery;
   lv_stlParam : TStringList;
   lv_reVal : TArray<String>;
begin
   SetLength(lv_reVal, 3);
   lv_reVal[0] := 'SUCCESS';

   lv_UniQry   := TUniQuery.Create(nil);
   lv_stlParam := TStringList.Create;
   lv_stlParam.StrictDelimiter := True;
   try
      lv_UniQry.Connection := pi_UniConn;

     lv_stlParam.Add(pi_Owner);
     lv_stlParam.Add(pi_TableNm);
     case pi_Flg of
         0 : lv_Sql := frmMain.pb_DBSQL[5].rSQLText;  // Mysql
         1 : lv_Sql := frmMain.pb_DBSQL[6].rSQLText;  // Oracle
      end;

      if frmMain.ufBackGroundUniSQLExec(1, lv_Sql, pi_UniConn.Name, lv_stlParam, lv_UniQry) then
      begin
         lv_reSql := 'insert into ' + pi_TableNm;
         while not lv_UniQry.Eof do
         begin
            lv_tmpColNm   := lv_UniQry.Fields[0].AsString;
            lv_tmpColType := lv_UniQry.Fields[1].AsString;

            if pi_Flg = 1 then  // Oracle
            begin
               if lv_tmpColNm = 'COMMENT' then lv_tmpColNm := '"' + lv_tmpColNm + '"';               
            end;

            lv_ColLst_1 := lv_ColLst_1 + lv_tmpColNm + ', ';

            if (LowerCase(lv_tmpColType) = 'timestamp') or
               (LowerCase(lv_tmpColType) = 'datetime') or
               (LowerCase(lv_tmpColType) = 'date') or
               (LowerCase(lv_tmpColType) = 'time') then
            begin
//               case pi_Flg of
//                  0 : lv_tmpColNm := 'str_to_date(:' + lv_tmpColNm + ', ''%Y-%d-%m %H:%i:%s'')';  // Mysql
//                  1 : lv_tmpColNm := 'to_date(:' + lv_tmpColNm + ', ''yyyy-mm-dd hh24:mi:ss'')';  // Oracle
//               end;

               lv_tmpColNm := ':' + lv_tmpColNm;
            end else
            begin
               lv_tmpColNm := ':' + lv_tmpColNm;
            end;

            lv_ColLst_2 := lv_ColLst_2 + lv_tmpColNm + ', ';

            lv_UniQry.Next;
         end;
         lv_ColLst_1 := Copy(lv_ColLst_1, 1, Length(lv_ColLst_1) - 2);
         lv_ColLst_2 := Copy(lv_ColLst_2, 1, Length(lv_ColLst_2) - 2);

         lv_reVal[1] := lv_reSql + '(' + lv_ColLst_1 + ')' + #13
                      + ' values(' + lv_ColLst_2 + ')';
         lv_reVal[2] := IntToStr(lv_UniQry.RecordCount);
      end else
      begin
         lv_reVal[0] := 'FAIL';
      end;

   finally
      FreeAndNil(lv_stlParam);
      FreeAndNil(lv_UniQry);
   end;

   Result := lv_reVal;
end;

//****************************************************************************//
//* User Define Function, Procedure End
//****************************************************************************//

procedure TfrmProgress.cxbtn_closeClick(Sender: TObject);
begin
   pv_bStop := True;
   Close;
end;

procedure TfrmProgress.FormActivate(Sender: TObject);
var
   lv_Tmp : TArray<String>;
   lv_SQL : String;
   lv_ParamCnt : Integer;
begin
   fv_dtStart := Now;

   Timer_Prgs.Enabled  := True;
   Timer_Prgs.Interval := 100;

   cxRichEd_ProgressLog.Clear;
   case StrToInt(cxTxtEd_ProgressTypeFlg.Text) of
      0 :
         begin
            frmMain.pSet_SourceDBConnProcess(0, frmMain.UniConn_Source);
         end;
      1 :
         begin
            frmMain.pSet_SourceDBConnProcess(1, frmMain.UniConn_Source);
         end;
      2 :
         begin
            frmMain.pSet_SourceDBConnProcess(2, frmMain.UniConn_Source);
         end;
      10 :
         begin
            frmMain.pSet_TargetDBConnProcess(0, frmMain.UniConn_Target);
         end;
      11 :
         begin
            frmMain.pSet_TargetDBConnProcess(1, frmMain.UniConn_Target);
         end;
      12 :
         begin
            frmMain.pSet_TargetDBConnProcess(2, frmMain.UniConn_Target);
         end;
      100 :
         begin
            SetLength(lv_Tmp, 2);
            lv_Tmp[0] := frmMain.cxCmb_TargetDB.Text;
            lv_Tmp[1] := frmMain.cxCmb_TargetTable.Text;
            pSet_SQLPorcess(0, lv_Tmp, frmMain.UniQry_Source, frmMain.UniConn_Target);
         end;
      101 :
         begin
            SetLength(lv_Tmp, 2);
            lv_Tmp[0] := frmMain.cxCmb_TargetDB.Text;
            lv_Tmp[1] := frmMain.cxCmb_TargetTable.Text;
            pSet_SQLPorcess(1, lv_Tmp, frmMain.UniQry_Source, frmMain.UniConn_Target);
         end;
   end;
//   SetLength(lv_Tmp, 2);
//   lv_Tmp := ufMakeInsertSql(0, frmMain.sgdParam, UpperCase(frmMain.txtUserNm2.Text), UpperCase(frmMain.cmbOraTableLst.Text));
//   lv_SQL := lv_Tmp[0];
//   lv_ParamCnt := StrToInt(lv_Tmp[1]);
//
//   if lv_SQL <> '' then
//   begin
//      upSQLProcess(pv_Flg, frmMain.FDConnectionOracle, frmMain.DataSource1, frmMain.sgdParam, lv_SQL);
//   end;
end;

procedure TfrmProgress.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmProgress.FormCreate(Sender: TObject);
begin
   pv_bStop := False;
   cxRichEd_ProgressLog.Clear;
   cxPgBar_Progress.Position := 0;
end;

procedure TfrmProgress.FormDestroy(Sender: TObject);
begin
   Self := nil;
end;

procedure TfrmProgress.Timer_frmCloseTimer(Sender: TObject);
begin
   Self.Close;
end;

procedure TfrmProgress.Timer_PrgsTimer(Sender: TObject);
begin
   cxLbl_Elapsed.Caption := 'Elapsed Time : ' + fGetQueryElapsedTime(0, fv_dtStart, Now);
end;

end.
