{eval $file=$Utable.'Model.class.php'}
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
use Cms\core\Model;

class {$Utable}Model extends Model
{

    /************************  {$table_des}数据CURD  *****************************/

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
        $sql = 'insert into {pre}{$table} ({foreach $cols $key $col}{if $col['extra']!='auto_increment'}`{$col['col_name_raw']}`{if $key<count($cols)-1},{/if}{/if}{/foreach})values({foreach $cols $key $col}{if $col['extra']!='auto_increment'}:{$col['col_name_raw']}{if $key<count($cols)-1} , {/if}{/if}{/foreach})';
{foreach $cols $col}
{if $col['extra']!='auto_increment'}
        $param[':{$col['col_name_raw']}'] = $data['{$col['col_name_raw']}'];
{/if}
{/foreach}
        $ret = $this->exec($sql,$param);
        if ($ret){
            return $this->getLastInsertId();
        }
        return $ret;
    }

    /**
     * 删除{$table_des}数据
{foreach $cols $col}
{if $col['extra']=='auto_increment'}
     * @param {$col['colname']} {$col['comment']}

{/if}
{/foreach}
     */
    public function del{$Utable}By{$cols[0]['Colname']}(${$cols[0]['colname']}){
        $sql = 'delete from {pre}{$table} where {$cols[0]['col_name_raw']}=:{$cols[0]['col_name_raw']}';
        $param[':{$cols[0]['col_name_raw']}'] = ${$cols[0]['colname']};
        return $this->exec($sql,$param);
    }

    /**
     * 通过{$cols[0]['col_name_raw']}修改{$table_des} Model
     * 添加{$table_des}数据
{foreach $cols $col}
     * @param {$col['colname']} {$col['comment']}

{/foreach}
     */
    public function update{$Utable}By{$cols[0]['Colname']}($data){
        $sql = 'update {pre}{$table} set {foreach $cols $key $col}{if $col['extra']!='auto_increment'}`{$col['col_name_raw']}`= :{$col['col_name_raw']}{if $key<count($cols)-1},{/if}{/if}{/foreach} where {$cols[0]['col_name_raw']}=:{$cols[0]['col_name_raw']}';
{foreach $cols $col}
        $param[':{$col['col_name_raw']}'] = $data['{$col['col_name_raw']}'];
{/foreach}
        return $this->exec($sql,$param);
    }
    /**
     * 增减{$table_des} Model
     **/
    public function expr($field,$num,${$cols[0]['col_name_raw']}){
        $num = intval($num);
        $pdo = [];
        if($num>0)
        $sql = 'update {pre}{$table} set `'.$field.'`='.$field.'+'.$num.' where {$cols[0]['col_name_raw']}=:{$cols[0]['col_name_raw']};';
        if($num<0)
        $sql = 'update {pre}{$table} set `'.$field.'`='.$field.'-'.$num.' where {$cols[0]['col_name_raw']}=:{$cols[0]['col_name_raw']};';
        $pdo[':{$cols[0]['col_name_raw']}'] = ${$cols[0]['col_name_raw']};
        return $this->exec($sql,$pdo);
    }
    /**
     * 查询{$table_des}数据
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    public function query{$Utable}($pagesize=50, $p=1,$search=false,$orderby = false){
        $sql = 'select {$utable}.* from {pre}{$table} {$utable} WHERE 1';
        $pdo_param = [];
{foreach $cols $key $col}
        if(isset($search['{$col['col_name_raw']}'])){
            $sql.=' and {$utable}.{$col['col_name_raw']}=:{$col['col_name_raw']}';
            $pdo_param[':{$col['col_name_raw']}'] = $search['{$col['col_name_raw']}'];
        }
{/foreach}
        if($orderby) {
            if ( $orderby == 'new' ) {
                $sql.=' order by {$utable}.{$cols[0]['col_name_raw']} desc';
            }
        }
        $data = $this->page_query($sql,$pdo_param,$pagesize, $p);
        $data['result'] = $this->format{$Utable}($data['result']);
        return $data;
    }
    /**
     * 查询{$table_des}数据
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    public function query{$Utable}All($search=false,$orderby = false){
        $sql = 'select {$utable}.* from {pre}{$table} {$utable} WHERE 1';
        $pdo_param = [];
{foreach $cols $key $col}
        if(isset($search['{$col['col_name_raw']}'])){
            $sql.=' and {$utable}.{$col['col_name_raw']}=:{$col['col_name_raw']}';
            $pdo_param[':{$col['col_name_raw']}'] = $search['{$col['col_name_raw']}'];
        }
{/foreach}
        if($orderby) {
            if ( $orderby == 'new' ) {
                $sql.=' order by {$utable}.{$cols[0]['col_name_raw']} desc';
            }
        }
        $data = $this->select($sql,$pdo_param);
        $data = $this->format{$Utable}($data);
        return $data;
    }
    /**
     * 通过{$cols[0]['col_name_raw']}单条查询 Model
     * @param {$cols[0]['col_name_raw']}
     */
    public function find{$Utable}By{$cols[0]['Colname']}(${$cols[0]['colname']}){
        $sql = 'select * from {pre}{$table} where {$cols[0]['col_name_raw']}=:{$cols[0]['col_name_raw']}';
        $param[':{$cols[0]['col_name_raw']}'] = ${$cols[0]['colname']};
        $data = $this->find($sql,$param);
        $data = $this->format{$Utable}([$data])[0];
        return $data;
    }



    /**
     * 格式化数据
     * @param $rows
     * @return mixed
     */
    public function format{$Utable}($rows){
        if(is_array($rows)&&array_filter($rows)){

            foreach ((array)$rows as $k=>$data)
            {
                //do sth
            }
        }
        return $rows;
    }
}