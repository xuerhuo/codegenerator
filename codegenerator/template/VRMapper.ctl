{eval $file=$TableName.'Mapper.java'}
package {$package}.base.service.def;

import {$package}.base.domain.def.{$TableName};
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}QueryDto;
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}Vo;
import {$package}.base.domain.def.Def{$table_seg_['end']['Name']}Info;
import {$package}.base.example.def.Def{$table_seg_['end']['Name']}InfoCriteria;
import java.util.ArrayList;

import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}QueryDto;
import {$package}.base.pojo.{$table_seg_['end']['name']}.{$table_seg_['end']['Name']}Vo;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface {$TableName}Mapper {

    /*查找单条{$table_des}数据*/
    {$table_seg_[1]['Name']}Vo find{$TableName}({$TableName} {$tableName});

    /*分页查询{$table_des}数据*/
    ArrayList<{$table_seg_[1]['Name']}Vo> query{$TableName}({$table_seg_[1]['Name']}QueryDto {$table_seg_[1]['name']}QueryDto);

    /*查询所有{$table_des}数据*/
    ArrayList<{$table_seg_[1]['Name']}Vo> query{$TableName}All({$table_seg_[1]['Name']}Dto {$table_seg_[1]['name']}Dto);

}