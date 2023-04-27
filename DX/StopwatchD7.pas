unit StopwatchD7;

interface

uses
  Windows, SysUtils;

const
  TicksPerMillisecond = 10000;
  TicksPerSecond = 1000 * Int64(TicksPerMillisecond);
  TicksPerMinute = 60 * Int64(TicksPerSecond);
  TicksPerHour = 60 * Int64(TicksPerMinute);
  TicksPerDay = 24 * TicksPerHour;

type
  TStopwatch = class(TObject)
  private
    //FRunning: Boolean;
    FCounterPerSec: TLargeInteger;
    FTimeStart: TLargeInteger;
    FTImeStop: TLargeInteger;
    function GetAsSecond: Double;
    function GetAsTimeFormat: string;
  public
    constructor Create(CreateAndStart: Boolean = True);
    procedure Start;
    procedure Stop;

    property AsSecond: Double read GetAsSecond;
    property ToString: string read GetAsTimeFormat;
  end;

implementation

{ TStopwatch }

constructor TStopwatch.Create(CreateAndStart: Boolean);
begin
  inherited Create;
  // Получение частоты процессора
  QueryPerformanceFrequency(FCounterPerSec);
  // Запуск при старте
  if CreateAndStart
    then Start;
end;

function TStopwatch.GetAsSecond: Double;
begin
  Result := (FTImeStop - FTimeStart) / FCounterPerSec;
end;

function TStopwatch.GetAsTimeFormat: string;
var
  MillisecondCount,
    SecondCount,
    MinuteCount,
    HourCount: Integer;
  ElapsedTime: Double;
begin
  // Получение временного промежутка
  ElapsedTime := GetAsSecond;
  // Получение милисекунд
  MillisecondCount := Trunc(Frac(ElapsedTime) * 10000);
  ElapsedTime := Trunc(ElapsedTime);
  // Получение часов
  HourCount := Trunc(ElapsedTime / 3600);
  ElapsedTime := ElapsedTime - HourCount * 3600;
  // Получение минут
  MinuteCount := Trunc(ElapsedTime / 60);
  // Получение секунд
  SecondCount := Trunc(ElapsedTime);

  Result := Format('%d:%d:%d.%4d', [HourCount, MinuteCount, SecondCount, MillisecondCount]);
end;

procedure TStopwatch.Start;
begin
  FTImeStop := 0;
  // Первичная метка
  QueryPerformanceCounter(FTimeStart);
end;

procedure TStopwatch.Stop;
begin
  // Метка останова
  QueryPerformanceCounter(FTImeStop);
end;

end.
