unit uroute_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

 type
   TRoute = class
   private
     class var FList: String;
        FMethod: String;
        FRoute: String;
        FSource: String;

     class constructor Create;
   public
     procedure setData( a: String; b: String; c: String );
   end;

 implementation

 class constructor TRoute.Create;
 begin
   { Initialize the static FList member }
   FList := 'TList<Integer>.Create()';
 end;

 procedure TRoute.setData( a: String; b: String; c: String );
 begin
   writeln('a,b,c data:' + a  + ',' + b + ',' + c + '.');
 end;


end.

