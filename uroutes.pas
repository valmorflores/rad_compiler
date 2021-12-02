unit uroutes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uroute_class;

type

     TRouteList = class
       private

              class var FList: array of TRoute;
              class constructor Create;
       public
procedure add( route: TRoute );
              function list(): TStringList;

       var
           routeList: array of TRoute;
     end;




implementation

class constructor TRouteList.Create;
 begin
   { Initialize the static FList member }
   FList := [];// List<TRoute>.Create();
 end;

function TRouteList.list(): TStringList;
var
  slList: TStringList;
  i: integer;
begin
  slList:= TStringList.create;
  slList.add('lista de item');
  writeln('List of route');
  for i:= Low(FList) to High(FList) do
  begin
    slList.Add(intToStr(i));
  end;
  result:= slList;
end;

procedure TRouteList.add( route: TRoute );
begin
  writeln('Add item');
  setlength(FList,Length(Flist)+1);
  FList[Length(Flist)-1]:= route;
end;

end.

