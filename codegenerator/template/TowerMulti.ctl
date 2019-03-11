{eval $file='struct-index.xml'}
<xml>


<package name="pubActivity" namespace="/pubActivity" extends="ec-default">
     <!--添加{$table_des}-->
    <action name="add{$TableName}" class="{$package}.{$TableName}Action"
        method="add{$TableName}">
    </action>
    <!--删除{$table_des}-->
    <action name="del{$TableName}" class="{$package}.{$TableName}Action"
        method="del{$TableName}">
    </action>
    <!--修改{$table_des}-->
    <action name="update{$TableName}By{$cols[0]['ColName']}" class="{$package}.{$TableName}Action"
        method="update{$TableName}By{$cols[0]['ColName']}">
    </action>
    <!--查询一条{$table_des}数据-->
    <action name="find{$TableName}" class="{$package}.{$TableName}Action"
        method="find{$TableName}">
    </action>
    <!--分页查询{$table_des}结果集-->
    <action name="query{$TableName}" class="{$package}.{$TableName}Action"
        method="query{$TableName}">
    </action>
     <!--查询所有{$table_des}-->
    <action name="query{$TableName}All" class="{$package}.{$TableName}Action"
        method="query{$TableName}All">
    </action>

</package>

<!--{$table_des}相关sql-->
<sqlMap resource="PrivateMapping/{$TableName}_SqlMap.xml"/>

<!-- 注册{$table_des}服务 -->
<dubbo:service ref="{$TableName}Service"
    interface="{$package}.{$TableName}Service" />

<!-- 调用{$table_des}服务 -->
<dubbo:reference id="{$TableName}Service" interface="{$package}.{$TableName}Service"
    check="false" />

<!-- 调用众测活动Bean -->
<bean id="{$TableName}Service" class="{$package}.{$TableName}ServiceImpl"></bean>


</xml>
