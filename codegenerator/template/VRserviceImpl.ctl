{eval $file=$TableName.'ServiceImpl.java'}
package {$package}.base.service.{$table_seg_[0]['name']};

import {$package}.base.domain.{$table_seg_[0]['name']}.{$TableName};
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}QueryDto;
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}Vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class {$TableName}ServiceImpl implements {$TableName}Service {
    @Autowired
    private {$TableName}Mapper {$tableName}Mapper;

    /*查找单条{$table_des}数据*/
   @Override
   public {$table_seg_[1]['Name']}Vo find{$TableName}({$TableName} {$tableName}){
        return {$tableName}Mapper.find{$TableName}({$tableName});
    }

    /*分页查询{$table_des}数据*/
    @Override
    public ArrayList<{$table_seg_[1]['Name']}Vo> query{$TableName}({$table_seg_[1]['Name']}QueryDto {$table_seg_[1]['name']}QueryDto){
        return {$tableName}Mapper.query{$TableName}({$table_seg_[1]['name']}QueryDto);
    }

    /*查询所有{$table_des}数据*/
    @Override
    public ArrayList<{$table_seg_[1]['Name']}Vo> query{$TableName}All({$table_seg_[1]['Name']}Dto {$table_seg_[1]['name']}Dto){
        return {$tableName}Mapper.query{$TableName}All({$table_seg_[1]['name']}Dto);
    }

}