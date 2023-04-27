unit MainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, {GdipGraphic,} StopwatchD7, Vcl.Imaging.jpeg;

type
  TfMain = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1Progress(Sender: TObject; Stage: TProgressStage;
      PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
  private
    { Private declarations }
    Stopwatch: TStopwatch;
  public
    { Public declarations }
    PicsFolder: string;

    procedure LoadPicFiles(path: string; list: TStrings);
    function OpenPic(IMG: TImage; path: string): string;
  end;

var
  fMain: TfMain;

implementation

{$R *.dfm}

procedure TfMain.LoadPicFiles(path: string; list: TStrings);
var
  sr: TSearchRec;
begin
  if FindFirst(path, faAnyFile, sr) = 0 then
    repeat
      list.Add(sr.Name); // выводим список в ListBox
    until FindNext(sr) <> 0;
  FindClose(sr);
end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  Stopwatch := TStopwatch.Create(False);
  PicsFolder := ExtractFilePath(ParamStr(0)) + 'pics\';

  ListBox1.Items.Clear;
  LoadPicFiles(PicsFolder + '*.jpg', ListBox1.Items);
end;

function TfMain.OpenPic(IMG: TImage; path: string): string;
begin
  IMG.Picture := nil;
  IMG.Picture.LoadFromFile(path);
end;

procedure TfMain.ListBox1Click(Sender: TObject);
begin
  OpenPic(Image1, PicsFolder + ListBox1.Items[ListBox1.ItemIndex]);
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  Stopwatch.Free;
end;

procedure TfMain.Image1Progress(Sender: TObject; Stage: TProgressStage;
  PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
  case Stage of
    psStarting:
      begin
        Stopwatch.Start;
      end;
    psRunning:
      ;
    psEnding:
      begin
        Stopwatch.Stop;
        Label3.Caption := Stopwatch.ToString;
      end;
  end;
end;

end.
