<?php
/**
 * Created by PhpStorm.
 * User: erhuo
 * Date: 2019/3/11
 * Time: 14:11
 */
require './vendor/autoload.php';
//模板放置目录和  生成文件目录
$code = new \Xufan\CodeGenerater(path([ 'template']), path([ 'build']));
//设置数据连接
$code->setDataSource('127.0.0.1', 'root', 'root', 'test', '3306', '');

$code->addParam('namespace', 'Cms\common')
    ->addParam('dirname', 'admin')
    ->addParam('managecontrooler', 'teluchn')
    ->addParam('package', 'com.xnft')//添加在模板中使用的自定义变量值
    ->generatorMaker([
        'inventory_list'//设置要生成数据库的表  可以设置多种表
    ], ['SpringMvcMybatis.ctl','SpringMvcEntity.ctl','SpringMvcMapper.ctl','SpringMvcservice.ctl','SpringMvcServiceImpl.java']);//设置要生成代码的模板



if(!function_exists('path')){
    function path($dirs=[],$type=1){
        if($type==1){
            $dir = '.'.implode(DIRECTORY_SEPARATOR,$dirs);
        }
        if(is_dir($dir)){
            return $dir.DIRECTORY_SEPARATOR;
        }
        return $dir;
    }
}