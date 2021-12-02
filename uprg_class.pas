unit uprg_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uroute_class, uroutes, uprg_api_items_class;

  type TPrgClass = class
       private
              class var FRouteList: TRouteList;
              class var FPrgFile: TStringList;
              class var FFile: String;
              class var FCode: TStringList;

                FMethod_name:String; // =users
                FMethod_api:String; //method.api=yes
                FMethod_url:String; //method.url=yes
                FMethod_form:String; //method.form=yes
                FMethod_mobile:String; //method.mobile=yes

                FSql_base: String; //=default
                FSql_table: String; //sql.table=usuarios
                FSql_key: String; //sql.key=cd_usuario
                FSql_singlefields: String; //sql.singlefields=
                FSql_filters: String; //sql.filters=
                FSql_order: String; //sql.order=

                FApi_items: array of TPrgApiItems;

              class constructor Create;
             procedure fileProcess();
       public
             function routeList(): TStringList;
             procedure loadFile();
             procedure setFile(cFile: String);
             procedure setRouteList( aRouteList: TRouteList );
             function getFile(): String;
             function getName(): String;
             procedure setName( name: String );

        published
               property name: String read GetName write SetName;


     end;

implementation

class constructor TPrgClass.Create;
 begin
   { Initialize the static member }
   FRouteList:= TRouteList.Create();
end;

function TPrgClass.getFile(): String;
begin
  result:= FFile;
end;

function TPrgClass.getName(): String;
begin
  result:= FMethod_name;
end;

procedure TPrgClass.setName( name: String );
begin
  FMethod_name:= name;
end;

procedure TPrgClass.setRouteList( aRouteList: TRouteList );
begin
  FRouteList:= aRouteList;
end;

procedure TPrgClass.loadFile();
begin
  FPrgFile:= TStringList.create;
  FPrgFile.LoadFromFile( FFile );
  fileProcess();
end;

function TPrgClass.routeList(): TStringList;
var
  slList: TStringList;
begin
  slList:= TStringList.create;
  slList.add('teste');
  result:= slList;
end;

procedure TPrgClass.setFile(cFile: String);
begin
  FFile:= cFile;
end;

procedure TPrgClass.fileProcess();
var
  i: Integer;
  nLineCode: integer;
  slCode: TStringlist;
begin
  // preset, declarations, params, start data and definitions
  nLineCode:= 0;
  for i:= 1 to FPrgFile.Count-1 do
  begin
    if ('method.name'=lowercase(copy(FPrgFile[i], 0, 11))) then
    begin
        name:=trim( copy( FPrgFile[i], 13, 256 ) );
        writeln(FPrgFile[i]);
        writeln(name);
    end;
    if ('-start-'=lowercase(copy(FPrgFile[i], 0, 7))) then
    begin
        nLineCode:= i+1;
        break;
    end;
  end;

  // -start- code
  FCode:= TStringList.create;
  if ( nLineCode>0 ) then
  begin
      slCode:= TStringlist.create;
      for i:= nLineCode to FPrgFile.Count-1 do
      begin
         slCode.add(FPrgFile[i]);
         writeln(FPrgFile[i]);
      end;
      FCode:= slCode;
  end;

end;

end.

