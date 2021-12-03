unit uprg_api_items_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type TPrgApiItems = class
    private

        FPath: String;                      // =$method/:id
        FFunction: String;                  //            api.items[0].function=getById($id)
        FProtected: boolean;                // api.items[0].protected=true
        FFunctionCode: TStringList;
        FVerb: String;                      // api.items[0].verb=true
   private
        procedure setFunction(cStr: String);
        procedure setPath(cStr: String);
        procedure setVerb(cStr: String);
        procedure setProtected(lBoolean: Boolean);
        procedure setFunctionCode(slList: TStringList);
        function getFunction(): String;
        function getProtected(): Boolean;
        function getFunctionCode(): TStringList;
        function getPath(): String;
        function getVerb(): String;
   published
        property functionName: String read getFunction write setFunction;
        property isProtected: Boolean read getProtected write setProtected;
        property functionCode: TStringList read getFunctionCode write setFunctionCode;
        property path: String read getPath write setPath;
        property verb: String read getVerb write setVerb;

   end;

implementation

procedure TPrgApiItems.setFunction(cStr: String);
begin
   FFunction:= cStr;
end;

procedure TPrgApiItems.setPath(cStr: String);
begin
   FPath:= cStr;
end;

procedure TPrgApiItems.setProtected(lBoolean: Boolean);
begin
   FProtected:= lBoolean;
end;

procedure TPrgApiItems.setFunctionCode(slList: TStringList);
begin
   FFunctionCode:= slList;
end;

procedure TPrgApiItems.setVerb(cStr: String);
begin
   FVerb:= cStr;
end;

function TPrgApiItems.getFunction(): String;
begin
   result:= FFunction;
end;

function TPrgApiItems.getPath(): String;
begin
   result:= FPath;
end;

function TPrgApiItems.getVerb(): String;
begin
   result:= FVerb;
end;

function TPrgApiItems.getProtected(): Boolean;
begin
   result:= FProtected;
end;

function TPrgApiItems.getFunctionCode(): TStringList;
begin
   result:= FFunctionCode;
end;

end.

