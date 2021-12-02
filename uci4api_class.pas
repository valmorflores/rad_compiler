unit uci4api_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, ubuilder_class;

type

     TCi4ApiClass = class
       private

              class var FBuilder: TBuilderClass;
              class constructor Create;
              procedure buildRoutes();
              procedure buildDatabase();
       public
             procedure build();
     end;

implementation

const _NAME = 'uci4api';

class constructor TCi4ApiClass.Create;
begin
   { Initialize the static member }
   FBuilder:= TBuilderClass.Create();
end;

procedure TCi4ApiClass.build();
begin
  writeln('Build complete ' + _NAME + '...');
  writeln(FBuilder.ClassName);
  buildDatabase();
  buildRoutes();


end;

procedure TCi4ApiClass.buildRoutes();
begin
  writeln('[' + _NAME + '] Build routes');

end;

procedure TCi4ApiClass.buildDatabase();
begin
  writeln('[' + _NAME + '] Build database');

end;


end.

