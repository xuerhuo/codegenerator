{eval $file=$TableName.'_SqlMap.xml'}
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd" >
<sqlMap namespace="{$TableName}" >
    <resultMap id="{$tableName}" class="{$package}.{$TableName}Model" >
{foreach $cols $col}
        <!--{$col['comment']} {$col['type']} -->
        <result column="{$col['col_name_raw']}" property="{$col['colName']}"/>
{/foreach}
    </resultMap>
     <sql id="Where_Alias" >
{foreach $cols $col}
        <isNotEmpty prepend="and" property="{$col['colName']}" >
          {$table_abbr}.{$col['col_name_raw']} = #{$col['colName']}#
        </isNotEmpty>
{/foreach}
      </sql>

<!--添加{$table_des}数据-->
<insert id="{$TableName}.add{$TableName}" parameterClass="{$package}.{$TableName}Model">
    insert into {$table_raw}
      ({foreach $cols $key $col}{if $key!=0}`{$col['col_name_raw']}`{if $key<count($cols)-1},{/if}{/if}{/foreach})values(
      {foreach $cols $key $col}{if $key!=0}#{$col['colName']}#{if $key<count($cols)-1} , {/if}{/if}{/foreach})
</insert>

<!--删除{$table_des}数据-->
<delete id="{$TableName}.del{$TableName}" parameterClass="{$package}.{$TableName}Model">
  delete {$table_abbr} from {$table_raw} {$table_abbr}
       <dynamic prepend="where" >
      <include refid="{$TableName}.Where_Alias" />
      </dynamic>
</delete>

<!--修改{$table_des}数据-->
<update id="{$TableName}.update{$TableName}By{$cols[0]['ColName']}" parameterClass="{$package}.{$TableName}Model">
  update {$table_raw} {$table_abbr}
   <dynamic prepend="set" >
{foreach $cols $key $col}
{if $key!=0}
  <isNotNull prepend="," property="{$col['colName']}" >
    {$table_abbr}.{$col['col_name_raw']} = #{$col['colName']}#
  </isNotNull>
  {/if}
{/foreach}
</dynamic>
    where
     {$table_abbr}.{$cols[0]['col_name_raw']} = #{$cols[0]['colName']}#
</update>

    <!--查找单条{$table_des}数据-->
  <select id="{$TableName}.find{$TableName}" resultClass="{$package}.{$TableName}Model" parameterClass="{$package}.{$TableName}Model">
select
 {foreach $cols $key $col}
    {$table_abbr}.{$col['col_name_raw']} as {$col['colName']}{if $key<count($cols)-1} , {/if}
 {/foreach}
 from {$table} {$table_abbr}
 <dynamic prepend="where" >
<include refid="{$TableName}.Where_Alias" />
</dynamic>
    <isNotEmpty property="orderBy" >
      order by $orderBy$
    </isNotEmpty>
</select>


<select id="{$TableName}.query{$TableName}" resultClass="{$package}.{$TableName}Model" parameterClass="{$package}.{$TableName}Model">
select
 {foreach $cols $key $col}
    {$table_abbr}.{$col['col_name_raw']} as {$col['colName']}{if $key<count($cols)-1} , {/if}
 {/foreach}
 from {$table} {$table_abbr}
 <dynamic prepend="where" >
<include refid="{$TableName}.Where_Alias" />
</dynamic>
    <isNotEmpty property="orderBy" >
      order by $orderBy$
    </isNotEmpty>
  </select>

<select id="{$TableName}.query{$TableName}Count" resultClass="java.lang.Integer" parameterClass="{$package}.{$TableName}Model">
select
 count(1)
 from {$table} {$table_abbr}
 <dynamic prepend="where" >
<include refid="{$TableName}.Where_Alias" />
</dynamic>
    <isNotEmpty property="orderBy" >
      order by $orderBy$
    </isNotEmpty>
 </select>
</sqlMap>