{eval $file=$utable.'Controller.php'}
<?php
/**
 * Created by PhpStorm.
 * User: erhuo
 * Date: 2018/3/13
 * Time: 22:20
 */

namespace Cms\{$dirname};

use Cms\common\Auth;
use Cms\common\ErrorCode;
use Cms\common\{$Utable}Service;
use Cms\core\Controller;
use Cms\core\db;

class {$utable}Controller extends Controller
{
    public function __construct()
    {
        global $G;
        $rule = $G['get']['d'].'/'.$G['get']['f'].'/'.$G['get']['m'];
        if(!Auth::check($rule)){
            msg_error('',ErrorCode::AuthNoPermission);
        }
    }
/************************  {$table_des} CONTROLLER CURD  *****************************/

    public function index(){

    }

    /**
     * 添加{$table_des}数据Controller
{foreach $cols $col}
{if $col['extra']!='auto_increment'}
     * @param {$col['colname']} {$col['comment']}

{/if}
{/foreach}
     */
    public function add{$utable}(){
        global  $G;
        $data = $G['post'];
        $s_{$table} = new {$Utable}Service();
        $ret = $s_{$table}->add{$Utable}($data);
        set_data($ret);
        return msg($ret);
    }

    /**
     * 删除{$table_des}数据 Controller
{foreach $cols $col}
{if $col['extra']=='auto_increment'}
     * @param {$col['colname']} {$col['comment']}

{/if}
{/foreach}
     */
    public function del{$utable}by{$cols[0]['colname']}(){
        global  $G;
        $data = $G['get']['param'];
        $s_{$table} = new {$Utable}Service();
        $ret = $s_{$table}->del{$Utable}By{$cols[0]['Colname']}($data);
        set_data($ret);
        return msg($ret);
    }

    /**
     * 通过{$cols[0]['col_name_raw']}修改{$table_des} Model
     * 添加{$table_des}数据
{foreach $cols $col}
     * @param {$col['colname']} {$col['comment']}

{/foreach}
     */
    public function update{$utable}by{$cols[0]['colname']}(){
        global  $G;
        $data = $G['post'];
        $s_{$table} =  new {$Utable}Service();
        $ret = $s_{$table}->update{$Utable}By{$cols[0]['Colname']}($data);
        set_data($ret);
        return msg($ret);
    }

    /**
     * 查询 Controller
     * @param pagesize 分页大小
     * @param p 当前分页
     */
    public function query{$utable}(){
        global  $G;
        $data = $G['get']['param'];
        $s_{$table} = new {$Utable}Service();
        $ret = $s_{$table}->query{$Utable}($data);
        set_data($ret);
        return $ret;
    }

    /**
     * 通过{$cols[0]['col_name_raw']}单条查询 Model
     * @param {$cols[0]['col_name_raw']}
     */
    public function find{$utable}by{$cols[0]['colname']}(){
        global  $G;
        $data = $G['get']['param'];
        $s_{$table} = new {$Utable}Service();
        $ret = $s_{$table}->find{$Utable}By{$cols[0]['Colname']}($data);
        if(!$ret['status']){
            msg_error($ret['data'],$ret);
        }
        set_data($ret);
        return $ret;
    }

/************************  {$table_des} CONTROLLER CURD end *****************************/
}