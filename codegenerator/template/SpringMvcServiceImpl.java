{eval $file=$TableName.'ServiceImpl.java'}
package {$package}.service.impl;
import {$package}.dao.{$TableName}Mapper;
import {$package}.model.{$TableName};
import {$package}.service.{$TableName}Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

public class {$TableName}ServiceImpl  implements {$TableName}Service {
    @Autowired
    private {$TableName}Mapper {$tableName}Mapper;

    /*添加{$table_des}数据*/
    public Integer add{$TableName}({$TableName} {$tableName}) {
        return {$tableName}Mapper.add{$TableName}({$tableName});
    }
    /*删除{$table_des}数据*/
    public Integer del{$TableName}({$TableName} {$tableName}) {
        return {$tableName}Mapper.del{$TableName}({$tableName});
    }
    /*修改{$table_des}数据*/
    public Integer update{$TableName}By{$cols[0]['ColName']}({$TableName} {$tableName}) {
        return {$tableName}Mapper.update{$TableName}By{$cols[0]['ColName']}({$tableName});
    }
    /*查找单条{$table_des}数据*/
    public {$TableName} find{$TableName}({$TableName} {$tableName}) {
        return {$tableName}Mapper.find{$TableName}({$tableName});
    }
    /*分页查询{$table_des}数据*/
    public Map<String, Object> query{$TableName}({$TableName} {$tableName}) {
        HashMap<String, Object> ret = new HashMap<>();
         ret.put("data",{$tableName}Mapper.query{$TableName}({$tableName}));
         ret.put("count",{$tableName}Mapper.query{$TableName}Count({$tableName}));
         return  ret;
    }
     /*查询所有{$table_des}数据*/
    public ArrayList<{$TableName}> query{$TableName}All({$TableName} {$tableName}) {
        return {$tableName}Mapper.query{$TableName}All({$tableName});
    }
    /*查询{$table_des}数量*/
    public Integer query{$TableName}Count({$TableName} {$tableName}) {
        return {$tableName}Mapper.query{$TableName}Count({$tableName});
    }
}
