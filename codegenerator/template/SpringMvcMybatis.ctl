{eval $file=$TableName.'Mapper.xml'}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="{$package}.dao.{$TableName}Mapper">


<!--添加{$table_des}数据-->
<insert id="add{$TableName}" parameterType="{$package}.model.{$TableName}">
    insert into {$table_raw}
      ({foreach $cols $key $col}{if $key!=0}`{$col['col_name_raw']}`{if $key<count($cols)-1},{/if}{/if}{/foreach})values(
      {foreach $cols $key $col}{if $key!=0}#{{$col['colName']}}{if $key<count($cols)-1} , {/if}{/if}{/foreach})
</insert>

<!--删除{$table_des}数据-->
<delete id="del{$TableName}" parameterType="{$package}.model.{$TableName}">
  delete {$table_abbr} from {$table_raw} {$table_abbr}
  where 1=1
 {foreach $cols $col}
     <if test="{$col['colName']} != null and {$col['colName']} != ''">
     and {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
     </if>
{/foreach}
</delete>

<!--修改{$table_des}数据-->
<update id="update{$TableName}By{$cols[0]['ColName']}" parameterType="{$package}.model.{$TableName}">
  update {$table_raw} {$table_abbr}
 <trim prefix="set" suffixOverrides=",">
{foreach $cols $key $col}
{if $key!=0}
      <if test="{$col['colName']} != null and {$col['colName']} !=''">
            {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
      </if>
{/if}
{/foreach}
</trim>
    where
     {$table_abbr}.{$cols[0]['col_name_raw']} = #{{$cols[0]['colName']}}
</update>

    <!--查找单条{$table_des}数据-->
  <select id="find{$TableName}" resultType="{$package}.model.{$TableName}" parameterType="{$package}.model.{$TableName}">
select
 {foreach $cols $key $col}
    {$table_abbr}.{$col['col_name_raw']} as {$col['colName']}{if $key<count($cols)-1} , {/if}

  {/foreach}
 from {$table} {$table_abbr}
  where 1=1
 {foreach $cols $col}
     <if test="{$col['colName']} != null and {$col['colName']} != ''">
     and {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
     </if>
 {/foreach}
</select>


<select id="query{$TableName}" resultType="{$package}.model.{$TableName}" parameterType="{$package}.model.{$TableName}">
select
 {foreach $cols $key $col}
    {$table_abbr}.{$col['col_name_raw']} as {$col['colName']}{if $key<count($cols)-1} , {/if}

 {/foreach}

 from {$table} {$table_abbr}
  where 1=1
 {foreach $cols $col}
     <if test="{$col['colName']} != null and {$col['colName']} != ''">
     and {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
     </if>
 {/foreach}
 limit #{Offset},#{pageSize}
  </select>
<select id="query{$TableName}All" resultType="{$package}.model.{$TableName}" parameterType="{$package}.model.{$TableName}">
select
 {foreach $cols $key $col}
    {$table_abbr}.{$col['col_name_raw']} as {$col['colName']}{if $key<count($cols)-1} , {/if}

 {/foreach}

 from {$table} {$table_abbr}
  where 1=1
 {foreach $cols $col}
     <if test="{$col['colName']} != null and {$col['colName']} != ''">
     and {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
     </if>
 {/foreach}
  </select>

<select id="query{$TableName}Count" resultType="java.lang.Integer" parameterType="{$package}.model.{$TableName}">
select
 count(1)
 from {$table} {$table_abbr}
  where 1=1
 {foreach $cols $col}
     <if test="{$col['colName']} != null and {$col['colName']} != ''">
     and {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
     </if>
 {/foreach}
 </select>

</mapper>