
with method do {
    name=users
    api=yes
    url=yes
    form=yes
    mobile=yes
}

with sql do {
    base=default
    table=DBASGU.USUARIOS
    key=cd_usuario
    singlefields=
    filters=
    order=
    joins[0]=
    joins[0].on=
}

with api.items[0] do {
   verb=get
   path=$method/:id
   function=getById($id)
   protected=true
   zeof=1
}

with api.items[1] do {
    verb=get
    path=$method/name/:name
    function=getByName($name)
    protected=true
    zeof=1
}

api.items[2].verb=delete
api.items[2].path=$method/:id
api.items[2].function=deleteById($id)
api.items[2].protected=true
api.items[2].zeof=1

api.items[3].verb=post
api.items[3].path=$method/
api.items[3].function=post()
api.items[3].protected=true
api.items[3].zeof=1

-start-

public function getById($id) {
    sql.where=['ID'=>$id]
    $result = sql.select;
    result $result;
}

public function getByName($name) {
    sql.where=['DS_NAME'=>$name]
    $result = sql.select;
    result $result;
}
