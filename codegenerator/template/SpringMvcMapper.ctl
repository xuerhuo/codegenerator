{eval $file=$TableName.'Mapper.java'}
package {$package}.dao;


import java.util.Map;
import java.util.ArrayList;
import {$package}.model.{$TableName};

public interface {$TableName}Mapper {
    /*添加{$table_des}数据*/
    Integer add{$TableName}({$TableName} {$tableName});

    /*删除{$table_des}数据*/
    Integer del{$TableName}({$TableName} {$tableName});

    /*修改{$table_des}数据*/
    Integer update{$TableName}By{$cols[0]['ColName']}({$TableName} {$tableName});

    /*查找单条{$table_des}数据*/
    {$TableName} find{$TableName}({$TableName} {$tableName});

     /*分页查询{$table_des}数据*/
    ArrayList<{$TableName}> query{$TableName}({$TableName} {$tableName});

     /*查询所有{$table_des}数据*/
    ArrayList<{$TableName}> query{$TableName}All({$TableName} {$tableName});
    /*查询{$table_des}数量*/
    public Integer query{$TableName}Count({$TableName} {$tableName});

}
