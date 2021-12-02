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
        FFunctionCode: TStringList;         //            api.items[0].protected=true
    end;

implementation

end.

