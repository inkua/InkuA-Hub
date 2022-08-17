<?php return array (
  'components' => 
  array (
    'db' => 
    array (
      'class' => 'yii\\db\\Connection',
      'dsn' => 'mysql:host=localhost;dbname=inkuahubdev',
      'username' => 'root',
      'password' => 'root',
    ),
    'user' => 
    array (
    ),
    'mailer' => 
    array (
      'transport' => 
      array (
        'host' => 'localhost',
        'port' => 1025,
        'username' => 'admin',
        'password' => 'admin',
        'scheme' => 'smtp',
      ),
    ),
    'cache' => 
    array (
      'class' => 'yii\\caching\\FileCache',
      'keyPrefix' => 'humhub',
    ),
    'formatter' => 
    array (
      'defaultTimeZone' => 'Europe/Berlin',
    ),
  ),
  'params' => 
  array (
    'installer' => 
    array (
      'db' => 
      array (
        'installer_hostname' => 'localhost',
        'installer_database' => 'inkuahubdev',
      ),
    ),
    'config_created_at' => 1660743719,
    'horImageScrollOnMobile' => '1',
    'databaseInstalled' => true,
    'installed' => true,
  ),
  'name' => 'InkuA',
  'language' => 'en-US',
  'timeZone' => 'Europe/Berlin',
); ?>