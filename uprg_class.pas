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
             procedure apiItemsProcess();
             function GetSqlTable(): String;
             procedure SetSqlTable( table: String );
             function GetSqlKey(): String;
             procedure SetSqlKey( key: String );

       public
             function routeList(): TStringList;
             procedure loadFile();
             procedure setFile(cFile: String);
             procedure setRouteList( aRouteList: TRouteList );
             function getFile(): String;
             function getName(): String;
             procedure setName( name: String );
             procedure preProcess();
             procedure preProcessWidth();
        published
               property name: String read GetName write SetName;
               property sqlTable: String read GetSqlTable write SetSqlTable;
               property sqlKey: String read GetSqlKey write SetSqlKey;
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
  preProcess();
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

    if ('sql.table'=lowercase(copy(FPrgFile[i], 0, 9))) then
    begin
        sqlTable:=trim( copy( FPrgFile[i], 11, 256 ) );
        writeln(FPrgFile[i]);
        writeln(sqlTable);
    end;

    if ('sql.key'=lowercase(copy(FPrgFile[i], 0, 7))) then
    begin
        sqlKey:=trim( copy( FPrgFile[i], 9, 256 ) );
        writeln(FPrgFile[i]);
        writeln(sqlKey);
    end;

    if ('-start-'=lowercase(copy(FPrgFile[i], 0, 7))) then
    begin
        nLineCode:= i+1;
        break;
    end;
  end;

  apiItemsProcess();

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

{ Porcessamento de itens }
procedure TPrgClass.apiItemsProcess();
var
  i: Integer;
  nLineCode: integer;
  slCode: TStringlist;
  cItem: String;
  cContent: String;
  cParameterName: String;
  apiItem: TPrgApiItems;
  cLastItem: String;
begin
  // resolve pre process
  // preset, declarations, params, start data and definitions
  nLineCode:= 0;
  cLastItem:= '';
  FApi_items:= [];
  for i:= 1 to FPrgFile.Count-1 do
  begin
    if ('api.'=lowercase(copy(FPrgFile[i], 0, 4))) then
    begin
        cItem:= copy(FPrgFile[i],0,256);
        cContent:= copy(cItem,Pos('=',cItem)+1,256);
        cItem:= copy(cItem,0,Pos('=',cItem)-1);
        cItem:= copy(cItem,pos('[',cItem)+1);
        cItem:= copy(cItem,0,pos(']',cItem)-1);
        cParameterName:= copy(FPrgFile[i], Pos('].',FPrgFile[i])+2, 256 );
        cParameterName:= copy(cParameterName,0,Pos('=',cParameterName)-1);
        writeLn(cItem + '->' + cParameterName + '=>' + cContent);
        if ( cItem <> cLastItem ) then
        begin
            apiItem:= TPrgApiItems.create;
        end;
        if ( cParameterName = 'path' ) then
        begin
            apiItem.path:= cContent;
        end;
        if ( cParameterName = 'function' ) then
        begin
            apiItem.functionName:= cContent;
        end;
        if ( cParameterName = 'protected' ) then
        begin
            apiItem.isProtected:= ( cContent = 'true' );
        end;
        if ( cParameterName = 'verb' ) then
        begin
            apiItem.verb:= cContent;
        end;
        // end of api declaration, push to list
        if ( cParameterName = 'zeof' ) then
        begin
           setLength( FApi_items, StrToInt(cItem)+1 );
           FApi_items[StrToInt(cItem)]:= apiItem;
        end;
    end;
  end;
end;

procedure TPrgClass.preProcess();
begin
  preProcessWidth();
end;

procedure TPrgClass.preProcessWidth();
var
  i: integer;
  cElement: String;
  lonWith: boolean;
begin
  lonWith:= false;
  for i:= 1 to FPrgFile.Count-1 do
  begin
    if ('with'=lowercase(copy(FPrgFile[i], 0, 4))) then
    begin
       cElement:= trim(copy(FPrgFile[i], 5, 255));
       cElement:= trim(copy(cElement, 0, Pos(' ', cElement)-1));
       lonWith:= true;
    end
    else if ( ( trim(FPrgFile[i])='}' ) and lonWith ) then
    begin
       writeln('-wend-');
       lonWith:= false;
    end
    else if ( ( trim(FPrgFile[i]) <> '' ) and ( trim(FPrgFile[i]) <> '{' ) ) then
    begin
       if lonWith then
       begin
          FPrgFile[i]:= cElement + '.' + trim( FPrgFile[i] );
          writeln('->with: ' +FPrgFile[i]);
       end;
    end;
  end;
end;

function TPrgClass.GetSqlTable(): String;
begin
  result:= FSql_Table;
end;

procedure TPrgClass.SetSqlTable( table: String );
begin
  FSql_Table:= table;
end;

function TPrgClass.GetSqlKey(): String;
begin
  result:= FSql_Key;
end;

procedure TPrgClass.SetSqlKey( key: String );
begin
  FSql_Key:= key;
end;

end.

