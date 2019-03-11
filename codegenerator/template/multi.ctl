{eval $file=$Utable.'multi.js'}
//========================{$table_des}JsApi=====================================
        //添加{$table_des}数据
    add{$utable}:(row)=>{return post('admin/{$managecontrooler}/add{$utable}_ajax_1',row)},
        //删除{$table_des}数据
    del{$utable}by{$cols[0]['colname']}:(row)=>{return get('admin/{$managecontrooler}/del{$utable}by{$cols[0]['colname']}_ajax_1',{{$cols[0]['col_name_raw']}:row.{$cols[0]['col_name_raw']}})},
        //通过{$cols[0]['col_name_raw']}修改{$table_des}

    update{$utable}by{$cols[0]['colname']}:(row)=>{return post(`admin/{$managecontrooler}/update{$utable}by{$cols[0]['colname']}_ajax_1`,row)},
        //查询{$table_des}数据
    query{$utable}:(row)=>{
        return get(`admin/{$managecontrooler}/query{$utable}_ajax_1`,row)
    },


    '0.01'=>[
        'INSERT INTO `{pre}rule` (`rule_name`, `type`, `tips`) VALUES
        (\'admin/{$managecontrooler}/add{$utable}\', \'\', \'添加{$table_des}数据\'),
        (\'admin/{$managecontrooler}/del{$utable}by{$cols[0]['colname']}\', \'\', \'删除{$table_des}数据\'),
        (\'admin/{$managecontrooler}/update{$utable}by{$cols[0]['colname']}\', \'\', \'通过{$cols[0]['col_name_raw']}修改{$table_des}\'),
        (\'admin/{$managecontrooler}/query{$utable}\', \'\', \'查询{$table_des}数据\')',
        'INSERT INTO `{pre}role` (`role_name`) VALUES (\'{$table_des}管理员\')',
        'INSERT INTO {pre}role_rule (role_id, rule_id)
         SELECT role.id as role_id,r.id as rule_id FROM {pre}rule  as r
         LEFT JOIN {pre}role as role on 1
         WHERE r.rule_name in (\'admin/{$managecontrooler}/add{$utable}\',\'admin/{$managecontrooler}/del{$utable}by{$cols[0]['colname']}\',\'admin/{$managecontrooler}/update{$utable}by{$cols[0]['colname']}\',\'admin/{$managecontrooler}/query{$utable}\') and role.role_name=\'{$table_des}管理员\'',
        'INSERT INTO `{pre}role_group` (`group_id`,`role_id`) SELECT 1 as group_id,r.id as role_id FROM `{pre}role` as r WHERE role_name=\'{$table_des}管理员\''
],


<UserSelector @change="selectuser" :uid="row.uid" :username="row.username"></UserSelector>
import  UserSelector from  '../../components/user_selector'
selectuser(res){
    this.row.uid = res;
},

<CommonSelector :value="row.type" :label="''" type="cyberlab_coursetype" @change="selecttype"></CommonSelector>
import  CommonSelector from  '../../components/common_selector'
selecttype(res){
    this.row.type = res
},
CommonSelector

import  Virtualmachine  from  '../../components/vm_selector'
selectvm(res){
    this.vm = res;
},
Virtualmachine

import  CourseSelect from  '../../components/course_selector'
selectcourse(res){
    this.row.course = res;
},
<CourseSelect :label="''" :value="row.course" @change="selectcourse"></CourseSelect>
CourseSelect


<ExamSelector label="row.exam_name" :value="row.exam_id" @change="selectexam"></ExamSelector>
import  ExamSelector from  '../../components/exam_selector'
ExamSelector
selectexam(res){
    this.row.exam_id=res
},