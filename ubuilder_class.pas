unit ubuilder_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,
  uroute_class, uroutes, uprg_class;

type

     TBuilderClass = class
       private

              class var FRouteList: TRouteList;
              FProjectFile: TStringList;
              FFilesPrg: array of TPrgClass;
              class var FFile: String;
              class constructor Create;

       public
             function routeList(): TStringList;
             procedure setFile(cFile: String);
             procedure setRouteList( aRouteList: TRouteList );
             procedure loadProject();
             procedure showProject();

     end;

implementation

class constructor TBuilderClass.Create;
 begin
   { Initialize the static member }
   FRouteList:= TRouteList.Create();
end;

procedure TBuilderClass.setRouteList( aRouteList: TRouteList );
begin
  FRouteList:= aRouteList;
end;

procedure TBuilderClass.loadProject();
var
   i: integer;
   theFile: TPrgClass;
   cPath: String;
begin
  FProjectFile:= TStringList.create;
  FProjectFile.LoadFromFile( FFile );
  FFilesPrg:= [];
  cPath:= ExtractFilePath(FFile);
  for i:= 0 to pred(FProjectFile.Count) do
  begin
    writeln(cPath);
    writeln(FProjectFile[i]);
    theFile:= TPrgClass.create;
    theFile.setFile(cPath + FProjectFile[i]);
    theFile.loadFile();
    setLength( FFilesPrg, i+1 );
    FFilesPrg[i]:= theFile;
  end;
end;

function TBuilderClass.routeList(): TStringList;
var
  slList: TStringList;
begin
  slList:= TStringList.create;
  slList.add('teste');
  result:= slList;
end;

procedure TBuilderClass.setFile(cFile: String);
begin
  FFile:= cFile;
end;

procedure TBuilderClass.showProject();
begin
  writeln(FFile);
end;

end.

