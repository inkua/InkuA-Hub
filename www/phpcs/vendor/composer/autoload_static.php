<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit156aff48f079d412fe78c35c0e0ce714
{
    public static $prefixLengthsPsr4 = array (
        'V' => 
        array (
            'VariableAnalysis\\' => 17,
        ),
        'D' => 
        array (
            'Dealerdirect\\Composer\\Plugin\\Installers\\PHPCodeSniffer\\' => 55,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'VariableAnalysis\\' => 
        array (
            0 => __DIR__ . '/..' . '/sirbrillig/phpcs-variable-analysis/VariableAnalysis',
        ),
        'Dealerdirect\\Composer\\Plugin\\Installers\\PHPCodeSniffer\\' => 
        array (
            0 => __DIR__ . '/..' . '/dealerdirect/phpcodesniffer-composer-installer/src',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit156aff48f079d412fe78c35c0e0ce714::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit156aff48f079d412fe78c35c0e0ce714::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit156aff48f079d412fe78c35c0e0ce714::$classMap;

        }, null, ClassLoader::class);
    }
}