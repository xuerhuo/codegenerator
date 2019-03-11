<?php
/**
 * Created by PhpStorm.
 * User: erhuo
 * Date: 2018/8/4
 * Time: 22:26
 */

namespace Xufan;


class CodeGenerater
{
    private  $db;
    private $templatedir;
    private $builddir;
    private $params = [];
    private $dbconfig = [];

    public function __construct($templatedir,$builddir)
    {
        $this->templatedir = $templatedir;
        $this->builddir = $builddir;
    }
    public function setDataSource($host,$user,$passwd,$database,$port=3306,$pre='',$charset='utf8mb4',$type='mysql'){
        $this->db = new Db();
        $this->dbconfig = array(
            'user' => $user,
            'passwd' => $passwd,
            'database' => $database,
            'host' => $host,
            'port' => $port,
            'charset' => $charset,
            'type' => $type,
            'pre' => $pre,
        );
        $this->db->init($this->dbconfig);
    }
    public function addParam($key,$value){
        $this->params[$key] = $value;
        return $this;
    }
    public function generatorMaker($tables,$templates,$func=null){
        foreach ($tables as $table){
            foreach ($templates as $template){
                $params = null;
                $params['table_raw'] = $table;
                $params['table'] = str_replace($this->dbconfig['pre'],'',$table);
                $params['table_seg_'] = explode('_',$params['table']);
                $params['table_seg_']['end'] =end($params['table_seg_']);
                foreach ($params['table_seg_'] as $k=>$v){
                    $params['table_seg_'][$k] = [
                      'name' =>strtolower($v),
                        'Name' => ucfirst($v)
                    ];
                }

                $params['utable'] = str_replace([$this->dbconfig['pre'],'-','_'],'',$table);
                $params['Utable'] = ucfirst(str_replace([$this->dbconfig['pre'],'-','_'],'',$table));
                $params['tableName'] = $this->camelize($params['table']);
                $params['TableName'] = ucfirst($params['tableName']);
                $params['table_abbr'] = strtolower(preg_replace("/[a-z]/","",$params['TableName']));
                $params['TABLE_ABBR'] = strtoupper($params['table_abbr']);

                $params['Table'] = ucfirst($params['table']);
                $params = array_merge($params,$this->getColParam($table));
                $params = array_merge($params,$this->getTableParam($params['table']));
                $params = array_merge($params,$this->params);
                $this->parseTemplate($this->templatedir.$template,$params);
            }
        }
    }
    public function getColParam($tablename){
        $cols = $this->db->selectParam("show FULL COLUMNS FROM {$tablename}");
        $ret = [];
        foreach ($cols as $col){
            $temp = [];
            $temp['col_name_raw'] = $col['Field'];
            $temp['colName'] = $this->camelize($col['Field']);
            $temp['ColName'] = ucfirst($temp['colName']);
            $temp['colname'] = str_replace(['_','-'],'',$col['Field']);
            $temp['Colname'] = ucfirst($temp['colname']);
            $temp['Col_name'] = ucfirst($temp['col_name']);
            $temp['type'] = $col['Type'];
            $temp['jtype'] = $this->javaMapType($col['Type']);
            $temp['isnull'] = $col['Null'] == 'No'?false:true;
            $temp['key'] = $col['Key'];
            $temp['default'] = $col['Default'];
            $temp['extra'] = $col['Extra'];
            $temp['comment'] = $col['Comment'];
            $ret[] = $temp;
        }

        $cols = $ret;
        return compact('cols');
    }
    public function getTableParam($tabname){
        $sql = 'select table_name,table_comment from information_schema.tables WHERE table_schema=:database and TABLE_NAME=:tabname';
        $pdo_param[':database'] = $this->dbconfig['database'];
        $pdo_param[':tabname'] = $this->dbconfig['pre'].$tabname;
        $tab = $this->db->selectParam($sql,$pdo_param)[0];
        $table_des = $tab['table_comment'];
        return compact('table_des');
    }
    public function parseTemplate($filename,$param){
        extract($param);
        $tpl = new Template();
        $content = file_get_contents($filename);
        $content = str_replace("<?php",htmlspecialchars('<?php'),$content);
        $tpl->compile($content);
        $buidfile = $this->builddir.'xufan_ctl_build.htm';
        file_put_contents($buidfile,$content);
        ob_start();
        require $buidfile;
        $content = ob_get_contents();
        ob_end_clean();
        unlink($buidfile);

        $content = htmlspecialchars_decode($content);
        if(!isset($file)){
            throw new \Exception('请在模板中规定文件名称 模板路径：'.$filename);
        }
        file_put_contents($this->builddir.$file,$content);
    }

    /**
     * 下划线转驼峰
     * 思路:
     * step1.原字符串转小写,原字符串中的分隔符用空格替换,在字符串开头加上分隔符
     * step2.将字符串中每个单词的首字母转换为大写,再去空格,去字符串首部附加的分隔符.
     */
    function camelize($uncamelized_words,$separator='_')
    {
        $uncamelized_words = $separator. str_replace($separator, " ", strtolower($uncamelized_words));
        return ltrim(str_replace(" ", "", ucwords($uncamelized_words)), $separator );
    }

    /**
     * 驼峰命名转下划线命名
     * 思路:
     * 小写和大写紧挨一起的地方,加上分隔符,然后全部转小写
     */
    function uncamelize($camelCaps,$separator='_')
    {
        return strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . $separator . "$2", $camelCaps));
    }

    private function javaMapType($Type)
    {
        $res = '';
        $type = strtolower($Type);
         preg_match('/[a-z]+/',$type,$res);
         $type = $res[0];
        $map = [
            'varchar'=>'String',
            'int'=>'Integer',
            'datetime'=>'Date',
            'date'=>'Date',
            'text'=>'String',
        ];
        return $map[$type];
    }

}