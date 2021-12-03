unit uci4api_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ubuilder_class, uprg_class;

type

     TCi4ApiClass = class
       private

              class var FBuilder: TBuilderClass;
              class constructor Create;
              procedure buildRoutes();
              procedure buildDatabase();
              procedure setBuildClass( buildClass: TBuilderClass );
              function getBuildClass(): TBuilderClass;
       public
             procedure build();
       published
            property builder: TBuilderClass read getBuildClass write setBuildClass;

     end;

implementation

const _NAME = 'uci4api';

class constructor TCi4ApiClass.Create;
begin
   { Initialize the static member }
   FBuilder:= TBuilderClass.Create();
end;

procedure TCi4ApiClass.build();
var
  prgList: array of TPrgClass;
begin
  writeln('Build complete ' + _NAME + '...');
  writeln(FBuilder.ClassName);
  buildDatabase();
  buildRoutes();
  FBuilder.getPrg;


end;

procedure TCi4ApiClass.buildRoutes();
begin
  writeln('[' + _NAME + '] Build routes');

end;

procedure TCi4ApiClass.buildDatabase();
begin

  writeln('[' + _NAME + '] Build database');
  writeln('[' + ']' );

end;

procedure TCi4ApiClass.setBuildClass( buildClass: TBuilderClass );
begin
   FBuilder:= buildClass;
end;

function TCi4ApiClass.getBuildClass(): TBuilderClass;
begin
   result:= FBuilder;
end;


end.

