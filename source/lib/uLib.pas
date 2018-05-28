unit uLib;

interface
uses SynTokenMatch, SynHighlighterWebMisc, SynHighlighterSQL, Winapi.Windows
   , Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics
   , Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Grids, Vcl.ComCtrls, cxRichEdit
   , cxDropDownEdit, cxTextEdit
   , Inifiles, Clipbrd, Registry, System.Hash, RegularExpressions;

type
  TByteArr = array of byte;

//*****************************************************************************
//* Active 된 form 찾기
//* Parameter : pi_Flg     - 0 : Active 된 Child Form 닫기
//*                        - 1 : Form 활성화 시키기
//*                        - 2 : Close 시키기
//*             pi_Caption - FormCaption
//*****************************************************************************
function ufSearchFrom(pi_Flg : Integer; pi_Caption : String) : TForm;
//****************************************************************************//
//* Directory 존재 유무와 디렉토리 새성을 한다.
//* Parameter : pi_DirPath - 디렉토리 경로
//* ex) ufCreateDir('c:\sample\', 'sample');
//****************************************************************************//
function ufCreateDir(pi_Flg : Integer; pi_DirPath : String) : String;
//****************************************************************************//
//* Date Formate
//****************************************************************************//
function ufDateFormat(pi_Flg : Integer; pi_Date : TDateTime) : String;
function ufNewDateFormat(pi_Flg : Integer; pi_Date : String) : String;
//****************************************************************************//
//* StringGrid Clear
//****************************************************************************//
procedure upSGrdClear(pi_ObjSGrd : TStringGrid); Overload;
//****************************************************************************//
//* Inifile 정보를 읽어 들인다.
//****************************************************************************//
function ufReadINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
//****************************************************************************//
//* Inifile에 값을 정의 한다
//* Parameter : pi_FileNm - ini 파일명을 포함 전체 경로
//*             pi_Section - ini 파일의 섹션
//*             pi_Nm      - 명
//*             pi_Value   - 값
//*             ex) [섹션]
//*                 명 = 값
//* ex) ufWriteINI('c:\sample.ini', 섹션, 명, 값);
//****************************************************************************//
function ufWriteINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
function ufWriteINI(pi_FileNm : String; pi_ObjSGrd : TStringGrid) : String; Overload;
//****************************************************************************//
//* Inifile에서 Section 을 모두 읽어들인다.
//* Parameter : pi_FileNm - ini 파일명을 포함 전체 경로
//*             pi_SectionLst - Section 리스트.
//* ex) ufEarseSection('c:\sample.ini', 섹션, TStringList);
//****************************************************************************//
function ufReadSection(pi_FileNm : String; pi_SectionLst : TStringList) : String;
//****************************************************************************//
//* Inifile에서 Section에 대한 하위 Key List를 모두 읽어들인다.
//* Parameter : pi_FileNm - ini 파일명을 포함 전체 경로
//*             pi_SectionNm - 찾고자 하는 Section 명
//*             pi_SectionKeyLst - Section 리스트.
//* ex) ufEarseSection('c:\sample.ini', 섹션, TStringList);
//****************************************************************************//
function ufReadSectionKeyValue(pi_FileNm, pi_SectionNm : String; pi_SectionKeyLst : TStringList) : String;

function RPad(S: string; Ch: Char; Len: Integer): string; overload;
function LPad(S: string; Ch: Char; Len: Integer): string; overload;
//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function fGetQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;
function getBoolean(pi_Flg : String) : Boolean;
//****************************************************************************//
// 특수 문자를 '' 으로 치환
//****************************************************************************//
function fGetHTMLReplace(pi_Flg : Integer; pi_Str : String) : String;
//****************************************************************************//
// Html Tag 제거
//****************************************************************************//
function fGetDeleteHTML(pi_Flg : Integer; pi_Str : String) : String;
//****************************************************************************//
// 구분자로 파싱
//****************************************************************************//
function fGetParsing(pi_Flg : Integer; pi_SplitFlg, pi_Str : String) : String;
//****************************************************************************//
//* 숫자에 ,를 추가한다.                                                                                                                            //
//* Parameter : pi_Flg - format Mode
//*             pi_Data - 숫자 데이터
//* ex) Value := ufInsComma('1000000')                                                                                                                  //
//****************************************************************************//
function ufNumberFormat(pi_Flg : Integer; pi_Data : Double) : String;
//****************************************************************************//
//* 들어온 문자를 암호화
//****************************************************************************//
function ufEncrypt(const S: String; Key: Word): String;
//****************************************************************************//
//* 들어온 문자를 복호화
//****************************************************************************//
function ufDecrypt(const S: String; Key: Word): String;
//****************************************************************************//
// Regular Express로 삭제
// uses 절에 RegularExpressions 추가
//****************************************************************************//
function fGetRegExp(pi_RegExpPattern, pi_stlHTML : String) : String;
//****************************************************************************//
//* 실행한 Command의 내용을 Editor에 뿌린다.
//* Parameter : pi_Cmd : Command
//*             pi_stlOutPut : 출력할 TStringList
//****************************************************************************//
function ufCommandRedirect(pi_flg : Integer; pi_Cmd : String; pi_stlOutPut : TStringList) : String;
function BinToStr(const bin: TByteArr): string;
function LeftPad(S: string; Ch: Char; Len: Integer): string;
function RightPad(S: string; Ch: Char; Len: Integer): string;
//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function ufQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;
function ufMakeInsertSql(pi_Flg : Integer; pi_ObjStrGrd : TStringGrid; pi_Owner, pi_TableNm : String) : TArray<String>;

const
   {-- 암호화를 하기 위하여 필요 --}
   _C1      = 52845; // 기준키1
   _C2      = 22719; // 기준키2
   _MY_KEY  = 12345; // 사용자키
   _HexSymbols = '0123456789ABCDEF';


var
   pb_iniEnv : TIniFile;
   pv_arrMessage : array[0..1000] of Char;

implementation


function ufSearchFrom(pi_Flg : Integer; pi_Caption : String) : TForm;
var
   lv_LoopCnt : Integer;
   lv_Result  : TForm;
begin
   lv_Result := nil;
   for lv_LoopCnt := 0 to Screen.FormCount - 1 do
   begin
      if CompareStr(Screen.Forms[lv_LoopCnt].Caption, pi_Caption) = 0 then
      begin
         lv_Result := Screen.Forms[lv_LoopCnt];
         Break;
      end;
   end;
   Result := lv_Result;
end;

//****************************************************************************//
//* Directory 존재 유무와 디렉토리 새성을 한다.
//* Parameter : pi_DirPath - 디렉토리 경로
//* ex) ufCreateDir('c:\sample\', 'sample');
//****************************************************************************//
function ufCreateDir(pi_Flg : Integer; pi_DirPath : String) : String;
var
    lv_Return : String;
begin
   lv_Return := 'SUCCESS';
   try
      if DirectoryExists(pi_DirPath) = False then
      begin
         if pi_Flg = 0 then CreateDir(pi_DirPath)
         else ForceDirectories(pi_DirPath);
      end;
   except
      on E : Exception do
      begin
         lv_Return := 'FAIL - ' + E.Message;
      end;
   end;
   Result := lv_Return;
end;

//****************************************************************************//
//* Date Formate
//****************************************************************************//
function ufDateFormat(pi_Flg : Integer; pi_Date : TDateTime) : String;
var
   lv_Date : String;
begin
   case pi_Flg of
      0 : lv_Date := FormatDateTime('yyyy-mm-dd hh:nn:ss dddd', pi_Date);
      1 : lv_Date := FormatDateTime('yyyy-mm-dd', pi_Date);
      2 : lv_Date := FormatDateTime('t', pi_Date);
      3 : lv_Date := FormatDateTime('tt', pi_Date);
      4 : lv_Date := FormatDateTime('yyyymmddhhnnsszzz', pi_Date);
      5 : lv_Date := FormatDateTime('yyyy-mm-dd hh:nn:ss', pi_Date);
      6 : lv_Date := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', pi_Date);
      7 : lv_Date := FormatDateTime('yyyymmdd', pi_Date);
      8 : lv_Date := FormatDateTime('yyyymmddhhnnss', pi_Date);
      9 : lv_Date := FormatDateTime('yyyymm', pi_Date);
      10 : lv_Date := FormatDateTime('yyyymmddhhnnsszzz', pi_Date) + LPad(IntToStr(Random(999)), '0', 3);
      11 : lv_Date := FormatDateTime('yyyymmddhhnnsszzz', pi_Date);
      99 : lv_Date := FormatDateTime('yyyy-mm-dd', now);
   end;
   Result := lv_Date;
end;

function ufNewDateFormat(pi_Flg : Integer; pi_Date : String) : String;
var
   lv_rtlVal, lv_Year, lv_Month, lv_Day : String;
begin
   lv_Month := LPAD(UpperCase(Copy(pi_Date, 1, Pos(' ', pi_Date) - 1)), '0', 2);
   lv_Day   := Copy(pi_Date, Pos(' ', pi_Date) + 1, Length(pi_Date));
   lv_Day   := LPAD(Copy(lv_Day, 1, Pos(',', lv_Day) - 1), '0', 2);
   lv_Year  := Trim(Copy(pi_Date, Pos(',', pi_Date) + 1, Length(pi_Date)));

   if CompareStr('JANUARY', lv_Month) = 0       then lv_Month := '01'
   else if CompareStr('FEBRUARY', lv_Month) = 0 then lv_Month := '02'
   else if CompareStr('MARCH', lv_Month) = 0    then lv_Month := '03'
   else if CompareStr('APRIL', lv_Month) = 0    then lv_Month := '04'
   else if CompareStr('MAY', lv_Month) = 0      then lv_Month := '05'
   else if CompareStr('JUNE', lv_Month) = 0     then lv_Month := '06'
   else if CompareStr('JULY', lv_Month) = 0     then lv_Month := '07'
   else if CompareStr('AUGUST', lv_Month) = 0   then lv_Month := '08'
   else if CompareStr('SEPTEMBER', lv_Month) = 0 then lv_Month := '09'
   else if CompareStr('OCTOBER', lv_Month) = 0  then lv_Month := '10'
   else if CompareStr('NOVEMBER', lv_Month) = 0 then lv_Month := '11'
   else lv_Month := '12';

   case pi_Flg of
      0 : lv_rtlVal := lv_Year + '-' + lv_Month + '-' + lv_Day;
      1 : lv_rtlVal := lv_Year + lv_Month + lv_Day;
   end;

   Result := lv_rtlVal;
end;

//****************************************************************************//
//* StringGrid Clear
//****************************************************************************//
procedure upSGrdClear(pi_ObjSGrd : TStringGrid); Overload;
var
  lv_LoopCnt : Integer;
begin
  for lv_LoopCnt := 0 to pi_ObjSGrd.ColCount - 1 do
  begin
     pi_ObjSGrd.Cols[lv_LoopCnt].Clear;
  end;
end;

//****************************************************************************//
//* Inifile 정보를 읽어 들인다.
//****************************************************************************//
function ufReadINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
var
   lv_reVal : String;
begin
   lv_reVal := 'SUCCESS';
   if FileExists(pi_FileNm) then
   begin
      pb_iniEnv := TIniFile.Create(pi_FileNm);
      try
         try
            Result := pb_iniEnv.ReadString(pi_Section, pi_Nm, pi_Value);
         except
            on E : Exception do
            begin
               lv_reVal := 'FAIL - ' + E.Message;
            end;
         end; // try..exception
      finally
        pb_iniEnv.Free;
        {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
        WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
      end; // try..finally
   end; //if FileExists(pi_FileNm) then begin
end;

//****************************************************************************//
//* Inifile에 값을 정의 한다
//* Parameter : pi_FileNm - ini 파일명을 포함 전체 경로
//*             pi_Section - ini 파일의 섹션
//*             pi_Nm      - 명
//*             pi_Value   - 값
//*             ex) [섹션]
//*                 명 = 값
//* ex) ufWriteINI('c:\sample.ini', 섹션, 명, 값);
//****************************************************************************//
function ufWriteINI(pi_FileNm, pi_Section, pi_Nm, pi_Value : String) : String; Overload;
var
   lv_Return : String;
begin
   lv_Return := 'SUCCESS';
   pb_iniEnv := TIniFile.Create(pi_FileNm);
   try
     try
       pb_iniEnv.WriteString(pi_Section, pi_Nm, pi_Value);
     except
       on E : Exception do begin
          lv_Return := 'FAIL - ' + E.Message;
       end;
     end;
   finally
     pb_iniEnv.Free;
     {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
     WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
     Result := lv_Return;
   end;
end;

function ufWriteINI(pi_FileNm : String; pi_ObjSGrd : TStringGrid) : String; Overload;
var
  lv_LoopCnt : Integer;
  lv_Section, lv_Nm, lv_Value : String;
  lv_Return : String;
begin
  lv_Return := '';
  pb_iniEnv := TIniFile.Create(pi_FileNm);
  try
    try
      for lv_LoopCnt := 0 to pi_ObjSGrd.RowCount - 1 do
      begin
        lv_Section := pi_ObjSGrd.Rows[lv_LoopCnt].Strings[0];
        lv_Nm      := pi_ObjSGrd.Rows[lv_LoopCnt].Strings[1];
        lv_Value   := pi_ObjSGrd.Rows[lv_LoopCnt].Strings[2];

        pb_iniEnv.WriteString(lv_Section, lv_Nm, lv_Value);
      end;
      lv_Return := 'SUCCESS';

      //pv_iniEnv.WriteString(pi_Section, pi_Nm, pi_Value);
    except
      on E : Exception do begin
        lv_Return := 'ERROR';
      end;
    end;
  finally
    pb_iniEnv.Free;
    {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
    WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
    Result := lv_Return;
  end;
end;

//****************************************************************************//
//* Inifile에서 Section 을 모두 읽어들인다.
//* Parameter : pi_FileNm - ini 파일명을 포함 전체 경로
//*             pi_SectionLst - Section 리스트.
//* ex) ufReadSection('c:\sample.ini', 섹션, TStringList);
//****************************************************************************//
function ufReadSection(pi_FileNm : String; pi_SectionLst : TStringList) : String;
var
  lv_Return : String;
begin
  pb_iniEnv := TIniFile.Create(pi_FileNm);
  try
    try
      pb_iniEnv.ReadSections(pi_SectionLst);
      lv_Return := '0';
    except
      on E : Exception do begin
         lv_Return := '-1';
//        Application.MessageBox(  StrPCopy(pv_arrMessage, ufMessageInfo(901, E.Message))
//                               , 'IniFile Section 삭제 실패!!'
//                               , MB_OK + MB_ICONERROR
//                               );
      end;
    end;
  finally
    pb_iniEnv.Free;
    {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
    WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
  end;
  Result := lv_Return;
end;

//****************************************************************************//
//* Inifile에서 Section에 대한 하위 Key List를 모두 읽어들인다.
//* Parameter : pi_FileNm - ini 파일명을 포함 전체 경로
//*             pi_SectionNm - 찾고자 하는 Section 명
//*             pi_SectionKeyLst - Section 리스트.
//* ex) ufEarseSection('c:\sample.ini', 섹션, TStringList);
//****************************************************************************//
function ufReadSectionKeyValue(pi_FileNm, pi_SectionNm : String; pi_SectionKeyLst : TStringList) : String;
var
  lv_Return : String;
begin
  pb_iniEnv := TIniFile.Create(pi_FileNm);
  try
    try
      pb_iniEnv.ReadSectionValues(pi_SectionNm, pi_SectionKeyLst);
      lv_Return := '0';
    except
      on E : Exception do begin
        lv_Return := '-1';
      end;
    end;
  finally
    pb_iniEnv.Free;
    {-- INI의 데이타를 바로 갱신해준다.(없으면 갱신하지않고 버퍼링만 한다.) --}
    WritePrivateProfileString(nil, nil, nil, PChar(pi_FileNm));
    Result := lv_Return;
  end;
end;

function RPad(S: string; Ch: Char; Len: Integer): string; overload;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function LPad(S: string; Ch: Char; Len: Integer): string; overload;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function fGetQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;
var
  {-- 소요시간 계산  --}
  lv_Hour, lv_Min, lv_Sec, lv_MSec : Word;
  lv_dtElp : TDateTime;
  lv_strtmp, lv_StartTime, lv_EndTime, lv_ElpTime : String;
begin
  lv_StartTime := TimeToStr( pi_StartTime );
  lv_EndTime := TimeToStr( pi_EndTime );

  lv_dtElp := pi_EndTime - pi_StartTime;
  DecodeTime( lv_dtElp, lv_Hour, lv_Min, lv_Sec, lv_MSec );

//  lv_ElpTime := LeftPad(IntToStr( lv_Hour * 60 + lv_Min ), '0', 2)  + ':'
  lv_ElpTime := LPad(IntToStr( lv_Hour), '0', 2)  + ':'
              + LPad(IntToStr( lv_Min ), '0', 2)  + ':'
              + LPad(IntToStr( lv_Sec ), '0', 2) + '.'
              + LPad(IntToStr( lv_MSec), '0', 2);

  Result := lv_ElpTime;
end;

function getBoolean(pi_Flg : String) : Boolean;
var
   lv_Return : Boolean;
begin
   if pi_Flg = '0' then
   begin
      lv_Return := False;
   end else
   begin
      lv_Return := True;
   end;
end;

//****************************************************************************//
// 특수 문자를 '' 으로 치환
//****************************************************************************//
function fGetHTMLReplace(pi_Flg : Integer; pi_Str : String) : String;
var
   lv_retVal : String;
begin
   lv_retVal := pi_Str;
   case pi_Flg of
      0 :
         begin
            lv_retVal := StringReplace(lv_retVal, '&#39;', '''', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&#160;', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&amp;', '&', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&quot;', '"', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '­', '-', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '‘', '''', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '’', '''', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&ldquo;', '"', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&rdquo;', '"', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&rsquo;', '''', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&mdash;', '-', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&hellip;', '...', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&nbsp;', ' ', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&ndash;', '–', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&lsquo;', '''', [rfReplaceAll]);

            lv_retVal := StringReplace(lv_retVal, '”', '"', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '”', '"', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '…', '...', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '“', '"', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '”', '"', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '–', '-', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '—', '-', [rfReplaceAll]);
         end;
      1 :
         begin
            lv_retVal := StringReplace(lv_retVal, '&#39;', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&amp;', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&quot;', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&shy;', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&nbsp;', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '''', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, ',', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '’', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, ':', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '?', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '!', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '.', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '‘', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '’', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '’', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '”', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '“', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '%', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '…', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '–', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '—', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, ' ', '_', [rfReplaceAll]);
         end;
      2 :
         begin
            lv_retVal := StringReplace(lv_retVal, '<strong>', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '</strong>', '', [rfReplaceAll]);
         end;
      3 :
         begin
            lv_retVal := StringReplace(lv_retVal, '<strong>', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '</strong>', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, ' class="wsw__h2"', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '<em>', '', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '</em>', '', [rfReplaceAll]);
         end;
      4 :
         begin
            lv_retVal := StringReplace(lv_retVal, '&lt;', '<', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&gt;', '>', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&ouml;', 'ö', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&uuml;', 'ü', [rfReplaceAll]);
            lv_retVal := StringReplace(lv_retVal, '&iacute;', 'í', [rfReplaceAll]);
         end;
      5 :
         begin
            lv_retVal := StringReplace(lv_retVal, '&nbsp;', '', [rfReplaceAll]);
         end;
   end;

   Result := lv_retVal;
end;

//****************************************************************************//
// Html Tag 제거
//****************************************************************************//
function fGetDeleteHTML(pi_Flg : Integer; pi_Str : String) : String;
var
  TagBegin, TagEnd, TagLength: integer;
  lv_LoopCnt : Integer;
  lv_tmpStr, lv_KeyStr, lv_tmpReplaceStr : String;
begin
   if pi_Flg = 0 then
   begin
      lv_KeyStr := pi_Str;
      TagBegin := Pos( '<', lv_KeyStr);      // search position of first <
      lv_LoopCnt := 0;
      while (TagBegin > 0) do begin  // while there is a < in S
        TagEnd := Pos('>', lv_KeyStr);              // find the matching >
        TagLength := TagEnd - TagBegin + 1;
        Delete(lv_KeyStr, TagBegin, TagLength);     // delete the tag
        TagBegin:= Pos( '<', lv_KeyStr);            // search for next <

        if lv_LoopCnt > Length(lv_KeyStr) then Break;
        Inc(lv_LoopCnt);
      end;
   end else if pi_Flg = 1 then
   begin
      lv_KeyStr := StringReplace(pi_Str, ' type="text/javascript"', '',[rfReplaceAll]);
      while Pos('<script>', lv_KeyStr) > 0 do
      begin
         lv_tmpStr := Copy(lv_KeyStr, Pos('<script>', lv_KeyStr), Length(lv_KeyStr));
         lv_tmpStr := Copy(lv_tmpStr, 1, Pos('</script>', lv_tmpStr)+8);
         if (Pos('<script>renderExternalContent', lv_tmpStr) > 0) then
         begin
            lv_tmpReplaceStr := StringReplace(lv_tmpStr, '<script>', '', [rfReplaceAll]);
            lv_tmpReplaceStr := StringReplace(lv_tmpReplaceStr, '</script>', '', [rfReplaceAll]);
            lv_KeyStr := StringReplace(lv_KeyStr, lv_tmpStr, lv_tmpReplaceStr, [rfReplaceAll]);
         end else
         begin
            lv_KeyStr := StringReplace(lv_KeyStr, lv_tmpStr, '', [rfReplaceAll]);
         end;
      end;
   end else if pi_Flg = 2 then
   begin
      lv_KeyStr := pi_Str;
      while Pos('<em>', lv_KeyStr) > 0 do
      begin
         lv_tmpStr := Copy(lv_KeyStr, Pos('<em>', lv_KeyStr), Length(lv_KeyStr));
         lv_tmpStr := Copy(lv_tmpStr, 1, Pos('</em>', lv_tmpStr)+4);
         lv_KeyStr := StringReplace(lv_KeyStr, lv_tmpStr, '', [rfReplaceAll]);
      end;
   end else if pi_Flg = 3 then
   begin
      lv_KeyStr := pi_Str;
      while Pos('#2008B', lv_KeyStr) > 0 do
      begin
         lv_tmpStr := Copy(lv_KeyStr, Pos('#2008B', lv_KeyStr), Length(lv_KeyStr));
         lv_tmpStr := Copy(lv_tmpStr, 1, Pos('</em>', lv_tmpStr)+4);
         lv_KeyStr := StringReplace(lv_KeyStr, lv_tmpStr, '', [rfReplaceAll]);
      end;
   end;
  Result := lv_KeyStr;                   // give the result
end;

//****************************************************************************//
// 구분자로 파싱
//****************************************************************************//
function fGetParsing(pi_Flg : Integer; pi_SplitFlg, pi_Str : String) : String;
var
   lv_retVal : String;
   lv_stlSplit : TStringList;
begin
   lv_retVal := '';
   lv_stlSplit := TStringList.Create;
   try
      if pi_Flg = 0 then
      begin
         ExtractStrings(  ['/']
                        , [' ']
                        , pChar(pi_Str)
                        , lv_stlSplit
                        );

      end else
      begin
         ExtractStrings(  ['\']
                        , [' ']
                        , pChar(pi_Str)
                        , lv_stlSplit
                        );
      end;

      lv_retVal := lv_stlSplit.Strings[lv_stlSplit.Count - 1];
   finally
      FreeAndNil(lv_stlSplit);
   end;
   Result := lv_retVal
end;

//****************************************************************************//
//* 숫자에 ,를 추가한다.                                                                                                                            //
//* Parameter : pi_Flg - format Mode
//*             pi_Data - 숫자 데이터
//* ex) Value := ufInsComma('1000000')                                                                                                                  //
//****************************************************************************//
function ufNumberFormat(pi_Flg : Integer; pi_Data : Double) : String;
var
  lv_Result : String;
  lv_TmpStr : String;
  lv_StlTmp : TStringList;
begin
  try
    try
      case pi_Flg of
        1 : lv_Result := FormatFloat('#,##0', pi_Data);
        10 : lv_Result := FormatFloat('#.###', pi_Data);
        9 : begin
              lv_TmpStr := ufNumberFormat(1, pi_Data);
              lv_StlTmp := TStringList.Create;
              try
                ExtractStrings(  [',']
                               , [' ']
                               , PChar(lv_TmpStr)
                               , lv_StlTmp
                               );
                lv_Result := lv_StlTmp.Strings[0];
                case (lv_StlTmp.Count-1) of
                  0 : lv_Result := lv_Result + 'kb';
                  1 : lv_Result := lv_Result + 'k';
                  2 : lv_Result := lv_Result + 'm';
                  3 : lv_Result := lv_Result + 'g';
                  4 : lv_Result := lv_Result + 't';
                end;
              finally
                lv_StlTmp.Free;
              end;
            end;
      end;
    except
      case pi_Flg of
        1 : lv_Result := '0'
        else
          lv_Result := '';
      end;
    end;
  finally
    Result := lv_Result;
  end;
end;

//****************************************************************************//
//* 들어온 문자를 암호화
//****************************************************************************//
function ufEncrypt(const S: String; Key: Word): String;
var
   i: byte;
   sEncrypt, rEncrypt: String;
   rChar: Char;
begin
   sEncrypt := ''; // 암호화된 이진 문자열
   if S = '' then begin
      ufEncrypt := '';
      System.Exit;
   end;

   for i := 1 to Length(S) do begin
      sEncrypt := sEncrypt + char(byte(S[i]) xor (Key shr 8));
      Key := (byte(sEncrypt[i]) + Key) * _C1 + _C2;
   end;

   rEncrypt := ''; // 암호화된 이진 문자열을 ASCII 숫자로 변경
   for i := 1 to Length(sEncrypt) do begin
      rChar := sEncrypt[i];
      rEncrypt := rEncrypt + format('%.3d', [Ord(rChar)]); // 한문자당 3자리씩
   end;
   Result := rEncrypt;
end;

//****************************************************************************//
//* 들어온 문자를 복호화
//****************************************************************************//
function ufDecrypt(const S: String; Key: Word): String;
var
   i: byte;
   sDecrypt, rDecrypt, temp: String;
begin
   rDecrypt := '';
   if S = '' then begin
      ufDecrypt := '';
      System.Exit;
   end;

   i := 1;
   repeat
      temp := Copy(S, i, 3); // 한문자당 3자리 숫자로 저장되어 있다
      rDecrypt := rDecrypt + Chr(StrToIntDef(temp, 0)); // ASCII값을 구한다
      i := i + 3;
   until i > Length(S);

   sDecrypt := '';
   for i := 1 to Length(rDecrypt) do begin
      sDecrypt := sDecrypt + char(byte(rDecrypt[i]) xor (Key shr 8));
      Key := (byte(rDecrypt[i]) + Key) * _C1 + _C2;
   end;
   Result := sDecrypt;
end;

//****************************************************************************//
// Regular Express로 삭제
// uses 절에 RegularExpressions 추가
//****************************************************************************//
function fGetRegExp(pi_RegExpPattern, pi_stlHTML : String) : String;
var
   lv_LoopCnt, lv_divSCnt, lv_divECnt : Integer;
   lv_retVal, lv_tmpStr : String;
   lv_bCheck : Boolean;
   lv_stlTmp, lv_stlReplace : TStringList;
begin
   lv_retVal := 'SUCCESS';
   lv_divSCnt := 0;
   lv_divECnt := 0;

   lv_stlTmp := TStringList.Create;
   lv_stlTmp.StrictDelimiter := True;

   lv_stlReplace := TStringList.Create;
   lv_stlReplace.StrictDelimiter := True;
   try
      lv_stlTmp.Text := pi_stlHTML;
      lv_bCheck := False;
      for lv_LoopCnt := 0 to lv_stlTmp.Count - 1 do
      begin
         lv_tmpStr := lv_stlTmp.Strings[lv_LoopCnt];

         if (lv_tmpStr = pi_RegExpPattern) and (lv_bCheck = False) then
         begin
            lv_bCheck := True;
         end;

         if lv_bCheck = True then
         begin
            if Pos('<div', lv_tmpStr) > 0 then
            begin
               Inc(lv_divSCnt);
            end;
            if Pos('</div>', lv_tmpStr) > 0 then
            begin
               Inc(lv_divECnt);
            end;

            if (lv_divSCnt - lv_divECnt) = 0 then
            begin
               Break;
            end else begin
               lv_stlReplace.Add(lv_tmpStr);
            end;
         end;
      end;
      lv_stlTmp.Text := StringReplace(lv_stlTmp.Text, lv_stlReplace.Text, '', [rfReplaceAll]);
      lv_retVal := lv_stlTmp.Text;
   finally
      FreeAndNil(lv_stlReplace);
      FreeAndNil(lv_stlTmp);
   end;

   Result := lv_retVal;
end;

//****************************************************************************//
//* 실행한 Command의 내용을 Editor에 뿌린다.
//* Parameter : pi_Cmd : Command
//*             pi_stlOutPut : 출력할 TStringList
//****************************************************************************//
function ufCommandRedirect(pi_flg : Integer; pi_Cmd : String; pi_stlOutPut : TStringList) : String;
var
  hReadPipe  : THandle;
  hWritePipe : THandle;
  SI : TStartUpInfo;
  PI : TProcessInformation;
  SA : TSecurityAttributes;
  SD : TSecurityDescriptor;
  BytesRead : DWORD;
  Avail, ExitCode, wrResult: DWORD;
  Dest    : array [0 .. 4095] of AnsiChar;
  CmdLine : array [0 .. 512] of char;
  S, Param : string;
  UsingWinNT : boolean;
begin
  UsingWinNT := true;

  if UsingWinNT then
  begin
    InitializeSecurityDescriptor(@SD, SECURITY_DESCRIPTOR_REVISION);
    SetSecurityDescriptorDacl(@SD, true, nil, False);
    With SA do
    begin
      nLength := SizeOf(SA);
      lpSecurityDescriptor := @SD;
      bInheritHandle := true;
    end;
    CreatePipe(hReadPipe, hWritePipe, @SA, 1024);
  end else CreatePipe(hReadPipe, hWritePipe, nil, 1024);
  try
    Screen.Cursor := crHourglass; { STARTUPINFO를 설정한다. }
    {-- Array 초기화 --}
    FillChar(SI, SizeOf(SI), #0);

    SI.cb          := SizeOf(TStartUpInfo);
    if pi_flg = 0 then SI.wShowWindow := SW_SHOW
    else SI.wShowWindow := SW_HIDE;
    { STARTF_USESTDHANDLES 를 빼면 PIPE로 입출력이 Redirect 되지 않는다. }
    SI.dwFlags    := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    SI.hstdoutput := hWritePipe;
    SI.hStdError  := hWritePipe;
    StrPCopy(CmdLine, pi_Cmd); { Process를 생성한다. }

    //if CreateProcess(nil, CmdLine, nil, nil, true, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then
    if CreateProcess(PChar('C:\Windows\System32\cmd.exe'), PChar(pi_Cmd), nil, nil, true, CREATE_NEW_PROCESS_GROUP + NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then
    begin
      ExitCode := 0;
      while ExitCode = 0 do
      begin
        wrResult := WaitForSingleObject(PI.hProcess, 500);
        { Pipe에 출력된 내용이 있는 지 조사한다. }
        if PeekNamedPipe(hReadPipe, nil, 0, nil, @Avail, nil) then
        begin
          if Avail > 0 then
          begin
            { Redirect된 화면 내용을 출력 윈도에 내보낸다. }
            FillChar(Dest, SizeOf(Dest), #0);
            //ReadFile(hReadPipe, Dest, Avail, BytesRead, nil);
            // 원본에 버그 있음 버퍼 크기를 넘어가는 경우가 생김 : 수정
            //ReadFile(hReadPipe, Dest, SizeOf(Dest) - 1, BytesRead, nil);
            ReadFile(hReadPipe, Dest, SizeOf(Dest) - 1, BytesRead, nil);
            pi_stlOutPut.Add(Trim(StrPas(Dest)));
            Application.ProcessMessages;
          end;
        end; // end of peek
        { WAIT_TIMEOUT이 아니면 루프를 마친다. }
        if wrResult <> WAIT_TIMEOUT then ExitCode := 1;
      end; // while
      { 실행이 끝났다.. }
      GetExitCodeProcess(PI.hProcess, ExitCode);
      CloseHandle(PI.hProcess);
      CloseHandle(PI.hThread);
    end; // if
    Result := '1';
  finally
    CloseHandle(hReadPipe);
    CloseHandle(hWritePipe);
    Screen.Cursor := crDefault;
  end;
end;

function BinToStr(const bin: TByteArr): string;
var
  i : integer;
begin
  SetLength(Result, 2*Length(bin));
  for i :=  0 to Length(bin)-1 do
  begin
    Result[1 + 2*i + 0] := _HexSymbols[1 + bin[i] shr 4];
    Result[1 + 2*i + 1] := _HexSymbols[1 + bin[i] and $0F];
  end;
end;

function LeftPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := S + StringOfChar(Ch, RestLen);
end;

function RightPad(S: string; Ch: Char; Len: Integer): string;
var
  RestLen: Integer;
begin
  Result  := S;
  RestLen := Len - Length(s);
  if RestLen < 1 then Exit;
  Result := StringOfChar(Ch, RestLen) + S;
end;

//****************************************************************************//
//* Query 경과 시간을 구한다.
//****************************************************************************//
function ufQueryElapsedTime(pi_Flg : Integer; pi_StartTime, pi_EndTime : TDateTime) : String;
var
  {-- 소요시간 계산  --}
  lv_Hour, lv_Min, lv_Sec, lv_MSec : Word;
  lv_dtElp : TDateTime;
  lv_strtmp, lv_StartTime, lv_EndTime, lv_ElpTime : String;
begin
  lv_StartTime := TimeToStr( pi_StartTime );
  lv_EndTime := TimeToStr( pi_EndTime );

  lv_dtElp := pi_EndTime - pi_StartTime;
  DecodeTime( lv_dtElp, lv_Hour, lv_Min, lv_Sec, lv_MSec );

//  lv_ElpTime := LeftPad(IntToStr( lv_Hour * 60 + lv_Min ), '0', 2)  + ':'
  lv_ElpTime := RightPad(IntToStr( lv_Hour), '0', 2)  + ':'
              + RightPad(IntToStr( lv_Min ), '0', 2)  + ':'
              + RightPad(IntToStr( lv_Sec ), '0', 2) + '.'
              + RightPad(IntToStr( lv_MSec), '0', 2);

  Result := lv_ElpTime;
end;

function ufMakeInsertSql(pi_Flg : Integer; pi_ObjStrGrd : TStringGrid; pi_Owner, pi_TableNm : String) : TArray<String>;
var
   lv_ParamCnt, lv_LoopCnt : Integer;
   lv_strSQL, lv_tmpCol, lv_tmpColSQL, lv_tmpParamSQL, lv_tmpDataType  : String;
   lv_retVal : array[0..1] of String;
begin
   SetLength(Result, 2);
   lv_strSQL   := '';
   lv_ParamCnt := 0;
   try
      for lv_LoopCnt := 0 to pi_ObjStrGrd.RowCount - 1 do
      begin
         lv_tmpCol      := pi_ObjStrGrd.Rows[lv_LoopCnt].Strings[0];
         lv_tmpDataType := pi_ObjStrGrd.Rows[lv_LoopCnt].Strings[1];

         lv_tmpColSQL   := lv_tmpColSQL + ', ' + lv_tmpCol;
         if Pos(UpperCase(lv_tmpDataType), 'DATE') > 0 then
         begin
            lv_tmpParamSQL := lv_tmpParamSQL + ', to_date(:' + lv_tmpCol + ', ''yyyy-mm-dd hh24:mi:ss)''';
         end else
         begin
            lv_tmpParamSQL := lv_tmpParamSQL + ', :' + lv_tmpCol;
         end;

         Inc(lv_ParamCnt);
      end;

      lv_strSQL      := 'INSERT INTO ' + pi_Owner + '.' + pi_TableNm;
      lv_tmpColSQL   := Copy(lv_tmpColSQL, 2, Length(lv_tmpColSQL));
      lv_tmpParamSQL := Copy(lv_tmpParamSQL, 2, Length(lv_tmpParamSQL));
      lv_strSQL      := lv_strSQL + '(' + lv_tmpColSQL + ') VALUES (' + lv_tmpParamSQL + ')';
   except
      on E : Exception do begin
         lv_strSQL := '';
      end;
   end;

   Result[0] := lv_strSQL;
   Result[1] := IntToStr(lv_ParamCnt);
end;


end.

