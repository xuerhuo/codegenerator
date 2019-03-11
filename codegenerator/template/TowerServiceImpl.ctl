{eval $file=$TableName.'ServiceImpl.java'}
package {$package};

import com.ec.ctower.core.mvc.dao.BaseDAO;
import com.ec.ctower.core.mvc.dao.DaoFactory;
import com.ec.ctower.core.mvc.model.BasePageObj;
import com.ec.ctower.core.mvc.service.BusiBaseServiceImpl;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

public class {$TableName}ServiceImpl extends BusiBaseServiceImpl<{$TableName}Model> implements {$TableName}Service {

    @Override
    protected BaseDAO<{$TableName}Model> getBaseDAO() {
            return DaoFactory.getDao({$TableName}Model.class);
    }

    /*添加{$table_des}数据*/
    @Override
    public Integer add{$TableName}({$TableName}Model {$tableName}Model){
        {$tableName}Model.sqlMapMeta().setInsertSQLId("{$TableName}.add{$TableName}");
        {$TableName}Model ret =  getBaseDAO().insert({$tableName}Model,null);
        return 1;
    }

    /*删除{$table_des}数据*/
    @Override
    public Integer del{$TableName}({$TableName}Model {$tableName}Model){
        {$tableName}Model.sqlMapMeta().setDeleteSQLId("{$TableName}.del{$TableName}");
        Integer ret =  getBaseDAO().deleteByPK({$tableName}Model,null);
        return ret;
    }

    /*修改{$table_des}数据*/
    @Override
    public Integer update{$TableName}By{$cols[0]['ColName']}({$TableName}Model {$tableName}Model){
        {$tableName}Model.sqlMapMeta().setUpdateSQLId("{$TableName}.update{$TableName}By{$cols[0]['ColName']}");
        Integer ret =  getBaseDAO().updateByPK({$tableName}Model,null);
        return ret;
    }

    /*查找单条{$table_des}数据*/
    @Override
    public {$TableName}Model find{$TableName}({$TableName}Model {$tableName}Model){
        {$tableName}Model.sqlMapMeta().setFindSQLId("{$TableName}.find{$TableName}");
        {$TableName}Model ret =  getBaseDAO().findByPK({$tableName}Model,null);
        return ret;
    }

     /*分页查询{$table_des}数据*/
    @Override
    public BasePageObj query{$TableName}({$TableName}Model {$tableName}Model,String pageIndex, String pageSize){
        {$tableName}Model.setBeginPage(pageIndex);
        {$tableName}Model.setPageSize(pageSize);
        {$tableName}Model.sqlMapMeta().setQueryCountSQLId("{$TableName}.query{$TableName}Count");
        {$tableName}Model.sqlMapMeta().setQuerySQLId("{$TableName}.query{$TableName}");
        BasePageObj base=getBaseDAO().queryForPage({$tableName}Model, null);
        return  base;
    }

    /*查询所有{$table_des}数据*/
    @Override
    public ArrayList<{$TableName}Model> query{$TableName}All({$TableName}Model {$tableName}Model){
        {$tableName}Model.sqlMapMeta().setQueryCountSQLId("{$TableName}.query{$TableName}Count");
        {$tableName}Model.sqlMapMeta().setQuerySQLId("{$TableName}.query{$TableName}");
        ArrayList<{$TableName}Model> ret=(ArrayList<{$TableName}Model>) getBaseDAO().queryForList({$tableName}Model, null);
        return  ret;
    }
     /*查询{$table_des}数量*/
    @Override
    public Integer query{$TableName}Count({$TableName}Model {$tableName}Model){
        {$tableName}Model.sqlMapMeta().setQuerySQLId("{$TableName}.query{$TableName}Count");
        Integer ret=getBaseDAO().queryForCount({$tableName}Model, null);
        return  ret;
    }
}
