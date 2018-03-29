<?php
namespace app\Config;

class Config
{
    const Production = false;
    const DisplayErrors = true;
    const CacheEnabled = false;
    const SecretApplicationKey = '0e17ce11162433f25ff96fghjfghjfrtyu45674ac238d3021af757a1a';
    const Admin = '/^[\/]{1}[aAdDmMiInN]{5}[\/]{0,1}[a-zA-Z\/\-\_0-9]{1,500}$/';
    const Firewall = '/^[a-zA-Z\/\-\_0-9]{1,500}$/';

    private static $mysql = array
    (
        'test' => array
        (
            'host' => '10.10.10.10',
            'base' => 'Dao',
            'user' => 'mysql',
            'pass' => '',
        ),

        'production' => array
        (
            'host' => '10.10.10.10',
            'base' => 'Dao',
            'user' => 'mysql',
            'pass' => '',
        )
    );

    private static $mssql = array
    (
        'test' => array
        (
            'host' => '10.10.10.10',
            'base' => 'Dao',
            'user' => 'mysql',
            'pass' => '',
        ),

        'production' => array
        (
            'host' => '10.10.10.10',
            'base' => 'Dao',
            'user' => 'mysql',
            'pass' => '',
        )
    );

    private static $oracle = array
    (
        'test' => array
        (
            'host' => '10.10.10.10',
            'base' => 'Dao',
            'user' => 'mysql',
            'pass' => '',
        ),

        'production' => array
        (
            'host' => '10.10.10.10',
            'base' => 'Dao',
            'user' => 'mysql',
            'pass' => '',
        )
    );

    // CLEAR CACHE BEFORE CHANGE!
    private static $bundles = array
    (
        'test' => array
        (
            'AdminBundle',
            'AuthorizationBundle',
        ),

        'production' => array
        (
            'AdminBundle',
            'AuthorizationBundle',
        )
    );

    public static function mysql()
    {
        if(self::Production === true)
        {
            return self::$mysql['production'];
        } else {
            return self::$mysql['test'];
        }
    }

    public static function mssql()
    {
        if(self::Production === true)
        {
            return self::$mssql['production'];
        } else {
            return self::$mssql['test'];
        }
    }

    public static function oracle()
    {
        self::Production === true ? self::$oracle['production'] : self::$oracle['test'];
    }


    public static function bundles()
    {
        if(self::Production === true)
        {
            return self::$bundles['production'];
        } else {
            return self::$bundles['test'];
        }
    }
}
