unit ubuilder;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uroutes, uroute_class, ubuilder_class, uci4api_class;

  procedure compilePrj(cFile: String);
  function getApiRoutes(): TRouteList;


implementation

procedure compilePrj(cFile: String);
var
  builder: TBuilderClass;
  routeList: TRouteList;
  ci4api: TCi4ApiClass;
begin
  WriteLn('Stage 1: Starting compiling module');
  builder:= TBuilderClass.create;
  builder.setFile(cFile);
  builder.loadProject();
  routeList:= getApiRoutes();
  builder.setRouteList( routeList );
  builder.showProject();
  ci4api:= TCi4ApiClass.create;
  ci4api.build();

  {
  buildCi4Api();
  buildCi4Client();
  buildFlutterClient();
  buildLazarusClient();
  }
end;

function getApiRoutes(): TRouteList;
var
  routeList: TRouteList;
  route: TRoute;
  list: TStringList;
begin
  WriteLn('Getting API routes...');
  // Lista de rotas
  routeList:= TRouteList.create();

  // Item de rota 1
  route:= TRoute.create();
  route.setData('get','Teste','teste');
  routeList.add(route);

  // Item de rota 1
  route:= TRoute.create();
  route.setData('get','Teste2','teste2');
  routeList.add(route);

  list:= TStringList.create;
  list:= routeList.list();

  WriteLn(list.Text);
  //routeList.add();
  //routeList.Add('More items');
  result:= routeList;

end;


end.

