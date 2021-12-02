unit uci4routes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

   function _routeStr( cType:String; cRoute: String; cMethod: String ): String;
   function buildCI4Routes(): TStringList;

implementation

function buildCI4Routes(): TStringList;
var
  aRoutes: TStringList;
begin
  aRoutes:= TStringList.create;
  aRoutes.add( _routeStr('get','/','Home::index') );
  aRoutes.add( _routeStr('get','/v1/users','APIUser::index') );
  aRoutes.add( _routeStr('get','/v1/users/(:any)','APIUser::getUserByUsername/$1') );
  result:= aRoutes;
end;

function _routeStr( cType:String; cRoute: String; cMethod: String ): String;
var cStr: String;
begin
  cStr:= '';
  if cType = 'get' then
     cStr:= cStr + '$routes->get(';
  if cType = 'delete' then
     cStr:= cStr + '$routes->delete(';
  if cType = 'put' then
     cStr:= cStr + '$routes->put(';
  if cType = 'post' then
     cStr:= cStr + '$routes->post(';
  cStr:= cStr + QuotedStr(cRoute) + ',' + QuotedStr(cMethod) + ');';
  result:= cStr;
end;

end.

