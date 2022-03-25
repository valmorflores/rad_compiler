unit udbtable_class;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, memds, sqldb, udmbase;

type TDBTableClass = class
     private
        FName: String; // =users
        FTableName: String; // =users
        class constructor Create;
     public
        function getName(): String;
        procedure setName( name: String );
        function getTableName(): String;
        procedure setTableName( name: String );
        function getStructure(): TStringList;
     published
        property name: String read GetName write SetName;
        property tableName: String read GetTableName write SetTableName;
   end;

implementation


class constructor TDBTableClass.Create;
 begin
   { Initialize the static member }
   //FRouteList:= TRouteList.Create();
end;


function TDBTableClass.getName(): String;
begin
  result:= Fname;
end;

procedure TDBTableClass.setName( name: String );
begin
  Fname:= name;
end;

function TDBTableClass.getTableName(): String;
begin
   result:= FTableName;
end;

procedure TDBTableClass.setTableName( name: String );
begin
   FTableName:= name;
end;

function TDBTableClass.getStructure(): TStringList;
var
  slStructure: TStringList;
  bufDataSet: TMemDataset;
  sqlGetTable: TSQLQuery;
  sqlTransaction: TSQLTransaction;
  cSQL: String;
  DataModule1: TDataModule1;
begin
  writeLn('Start database');
  if ( DataModule1 = nil ) then
  begin
    writeln( 'Datamodule disabled' );
    DataModule1:= TDataModule1.Create(nil);
  end;

  if ( DataModule1 = nil ) then
  begin
    writeln( 'Datamodule has not created' );
  end;
  //DataModule1.ODBCConnection1.connected:= true;
  writeLn('Start getting table structure');

  cSQL:= ' select * ' +
        ' from all_tab_cols ' +
        ' where  OWNER = ' + QuotedStr( 'DBASGU' ) + ' AND ' +
        '  table_name= ' + QuotedStr('USUARIOS') +
        ' ORDER BY COLUMN_ID';

  if DataModule1.SQLQuery1.active then
  begin
    writeln( 'SQL query closed' );
  end;
  writeln( 'Server connecting...' );
  DataModule1.ODBCConnection1.Connected:= true;
  writeln( 'Server connected succefully' );
  writeLn(cSQL);
  writeln( 'Table close' );
  DataModule1.SQLQuery1.Close;
  writeln( 'Table SQL clear' );
  DataModule1.SQLQuery1.SQL.Clear;
  writeln( 'Table SQL add' );
  DataModule1.SQLQuery1.SQL.Add(cSQL);
  writeln( 'Table open' );
  DataModule1.SQLQuery1.Open;

  if DataModule1.SQLQuery1.active then
  begin
    writeln( 'Table active' );
  end;
  while not DataModule1.SQLQuery1.eof do
  begin
      writeln( DataModule1.SQLQuery1.fieldByName('column_name').asString + ' ' +
           DataModule1.SQLQuery1.fieldByName('data_type').asString + ' ' +
           DataModule1.SQLQuery1.fieldByName('data_length').asString + ' ' +
           DataModule1.SQLQuery1.fieldByName('data_precision').asString + ' ' +
           DataModule1.SQLQuery1.fieldByName('data_default').asString + ' '
      );
      DataModule1.SQLQuery1.next;

  end;
  slStructure:= TStringList.create();
  result:= slStructure;
end;


end.

