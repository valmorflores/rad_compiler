connection.default = [
        'DSN'      => '(DESCRIPTION = 
        (ADDRESS = 
          (PROTOCOL = TCP)
          (HOST = 10.1.6.60)
          (PORT = 1521)
        )
        (CONNECT_DATA = 
          (SERVER = DEDICATED)
          (SERVICE_NAME = producao.cardiologia.org)
        )
      )',
        'hostname' => 'oci:dbname=producao.cardiologia.org/producao',
        'username' => 'dbamv',
        'password' => 'prdca395mv',
        'database' => '',
        'DBDriver' => 'oci8',
        'DBPrefix' => '',
        'pConnect' => false,
        'DBDebug'  => (ENVIRONMENT !== 'production'),
        'charset'  => 'utf8',
        'DBCollat' => 'utf8_general_ci',
        'swapPre'  => '',
        'encrypt'  => false,
        'compress' => false,
        'strictOn' => false,
        'failover' => [],
        'port'     => 3306,
    ];