{eval $file=$Utable.'Service.class.php'}
<?php
/**
 * Created by PhpStorm.
 * User: xufan
 * Email: i@erhuo.org
 * Date: 2018/4/15
 * Time: 12:20
 */
{if $namespace}
namespace Cms\common;
{/if}

use Cms\core\db;
use Cms\core\Service;

class {$Utable}Service extends Service
{


    /**
     * 添加{$table_des}数据
{foreach $cols $col}
{if $col['extra']!='auto_increment'}
     * @param {$col['colname']} {$col['comment']}

{/if}
{/foreach}
     */
     /*<!--
     {foreach $cols $key $col}{if $col['extra']!='auto_increment'}``${$col['colname']}`{if $key<count($cols)-1},{/if}{/if}{/foreach}
     -->*/
    public function add{$Utable}($data){
        $m_{$table} = new {$Utable}Model();
        $ret = $m_{$table}->add{$Utable}($data);
        if(!$ret){
            return $this->reply(ErrorCode::InsertError);
        }
        return $this->reply('',$ret);
    }

    /**
     * 删除{$table_des}数据
{foreach $cols $col}
{if $col['extra']=='auto_increment'}
     * @param {$col['colname']} {$col['comment']}

{/if}
{/foreach}
     */
    public function del{$Utable}By{$cols[0]['Colname']}($data){
        $m_{$table} = new {$Utable}Model();
        $ret = $m_{$table}->del{$Utable}By{$cols[0]['Colname']}($data['{$cols[0]['col_name_raw']}']);
        if(!$ret){
            return $this->reply(ErrorCode::DeleteError);
        }
        return $this->reply('',$ret);
    }

    /**
     * 通过{$cols[0]['col_name_raw']}修改{$table_des} Model
     * 添加{$table_des}数据
{foreach $cols $col}
     * @param {$col['colname']} {$col['comment']}

{/foreach}
     */
    public function update{$Utable}By{$cols[0]['Colname']}($data){
        $m_{$table} = new {$Utable}Model();
        $ret = $m_{$table}->update{$Utable}By{$cols[0]['Colname']}($data);
        if(!$ret){
            return $this->reply(ErrorCode::UpdateError);
        }
        return $this->reply('',$ret);
    }
    /**
     * 增减{$table_des} Service
     **/
    public function expr($field,$num,${$cols[0]['col_name_raw']}){
        $m_{$table} = new {$Utable}Model();
        $ret = $m_{$table}->expr($field,$num,${$cols[0]['col_name_raw']});
        if(!$ret){
            return $this->reply(ErrorCode::UpdateError);
        }
        return $this->reply('',$ret);
    }
    /**
     * 查询{$table_des}数据
     * @param pagesize 分页大小
     * @param p 当前分页
{foreach $cols $col}
     * @param {$col['colname']} {$col['comment']}

{/foreach}
     */
    public function query{$Utable}($data){
        $m_{$table} = new {$Utable}Model();
        $ret = $m_{$table}->query{$Utable}($data['pagesize'], $data['p'],$data,$data['orderby']);
        if(!$ret['result']){
            return $this->reply(ErrorCode::NODATA);
        }
        return $this->reply('',$ret);
    }
    /**
     * 查询{$table_des} 所有数据
     * @param pagesize 分页大小
     * @param p 当前分页
{foreach $cols $col}
     * @param {$col['colname']} {$col['comment']}

{/foreach}
     */
    public function query{$Utable}All($data){
        $m_{$table} = new {$Utable}Model();
        $ret = $m_{$table}->query{$Utable}All($data,$data['orderby']);
        if(!$ret){
            return $this->reply(ErrorCode::NODATA);
        }
        return $this->reply('',$ret);
    }

    /**
     * 通过{$cols[0]['col_name_raw']}单条查询 Service
     * @param {$cols[0]['col_name_raw']}
     */
    public function find{$Utable}By{$cols[0]['Colname']}($data){
        $m_{$table} = new {$Utable}Model();
        $ret = $m_{$table}->find{$Utable}By{$cols[0]['Colname']}($data['{$cols[0]['col_name_raw']}']);
        if(!$ret){
            return $this->reply(ErrorCode::NODATA);
        }
        return $this->reply('',$ret);
    }

}