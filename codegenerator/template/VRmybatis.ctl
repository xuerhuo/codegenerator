{eval $file=$TableName.'Mapper.xml'}
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="{$package}.base.mapper.groupon.{$TableName}Mapper">
    <resultMap id="{$tableName}" class="{$package}.{$TableName}Model" >
{foreach $cols $col}
        <!--{$col['comment']} {$col['type']} -->
        <result column="{$col['col_name_raw']}" property="{$col['colName']}"/>
{/foreach}
    </resultMap>
     <sql id="Where_Alias" >
{foreach $cols $col}
      <if test="{$col['colName']} != null">
      and {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
      </if>
{/foreach}
      </sql>
  <sql id="pageSort">
    <if test="querySort != null and querySort.size &gt; 0">
      order by
      <foreach collection="querySort" index="index" item="item" separator=",">
        <trim prefix=" " suffix=" " suffixOverrides=",">
          {$table_abbr}.${item.key} ${item.sort},
        </trim>
      </foreach>
    </if>
  </sql>

<!--添加{$table_des}数据-->
<insert id="{$TableName}.add{$TableName}" parameterType="{$package}.{$TableName}Model">
    insert into {$table_raw}
      ({foreach $cols $key $col}{if $key!=0}`{$col['col_name_raw']}`{if $key<count($cols)-1},{/if}{/if}{/foreach})values(
      {foreach $cols $key $col}{if $key!=0}#{$col['colName']}#{if $key<count($cols)-1} , {/if}{/if}{/foreach})
</insert>

<!--删除{$table_des}数据-->
<delete id="{$TableName}.del{$TableName}" parameterType="{$package}.{$TableName}Model">
  delete {$table_abbr} from {$table_raw} {$table_abbr}
       <dynamic prepend="where" >
      <include refid="{$TableName}.Where_Alias" />
      </dynamic>
</delete>

<!--修改{$table_des}数据-->
<update id="{$TableName}.update{$TableName}By{$cols[0]['ColName']}" parameterType="{$package}.{$TableName}Model">
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
  <select id="find{$TableName}" resultType="{$package}.base.pojo.{$table_seg_[1]['name']}.{$table_seg_[1]['Name']}Vo" parameterType="{$package}.base.domain.{$table_seg_[0]['name']}.{$TableName}">
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


<select id="query{$TableName}" resultType="{$package}.base.pojo." parameterType="{$package}.base.pojo.">
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
    <include refid="pageSort" />
  </select>

<select id="query{$TableName}Count" resultType="java.lang.Integer" parameterType="{$package}.base.pojo.">
select
 count(1)
 from {$table} {$table_abbr}
  where 1=1
{foreach $cols $col}
     <if test="{$col['colName']} != null and {$col['colName']} != ''">
    and {$table_abbr}.{$col['col_name_raw']} = #{{$col['colName']}}
    </if>
{/foreach}
  <include refid="Where_Alias" />

 </select>
</sqlMap>