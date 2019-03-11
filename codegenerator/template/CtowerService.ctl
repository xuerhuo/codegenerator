{eval $file=$TableName.'Service.java'}
package {$package};

import com.ec.ctower.core.mvc.model.BasePageObj;
import com.ec.ctower.core.mvc.service.BusiBaseService;

import java.util.ArrayList;
import java.util.List;

public interface {$TableName}Service extends BusiBaseService<{$TableName}Model> {
    /*添加{$table_des}数据*/
    Integer add{$TableName}({$TableName}Model {$tableName}Model);

    /*删除{$table_des}数据*/
    Integer del{$TableName}({$TableName}Model {$tableName}Model);

    /*修改{$table_des}数据*/
    Integer update{$TableName}By{$cols[0]['ColName']}({$TableName}Model {$tableName}Model);

    /*查找单条{$table_des}数据*/
    {$TableName}Model find{$TableName}({$TableName}Model {$tableName}Model);

     /*分页查询{$table_des}数据*/
    BasePageObj query{$TableName}({$TableName}Model {$tableName}Model,String pageIndex, String pageSize);

     /*查询所有{$table_des}数据*/
    ArrayList<{$TableName}Model> query{$TableName}All({$TableName}Model {$tableName}Model);
    /*查询{$table_des}数量*/
    public Integer queryActivityTrialListCount(ActivityTrialListModel activityTrialListModel);

}
