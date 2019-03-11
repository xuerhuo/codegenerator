{eval $file=$TableName.'Action.java'}
package {$package};

import com.ec.common.utils.StringUtil;
import com.ec.ctower.core.mvc.action.AjaxRun;
import com.ec.ctower.core.mvc.action.BaseAction;
import com.ec.ctower.core.mvc.model.BasePageObj;
import com.ec.ctower.core.mvc.model.BaseResultVO;
import com.ec.ctower.core.utils.ModelUtils;
import com.ec.globle.Dict;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class {$TableName}Action extends BaseAction {
    @Resource
    private {$TableName}Service {$tableName}Service;
    /*添加{$table_des}数据*/
    public void add{$TableName}() throws Exception {
        this.ajaxRun(new AjaxRun() {
            @Override
            public void run(BaseResultVO ajaxRsp) throws Exception {
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                {$TableName}Model {$tableName}Model = new {$TableName}Model();
                {$tableName}Model.setAttr(request);
                Object ret1 = {$tableName}Service.add{$TableName}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("data",ret1);
                ajaxRsp.setOutputResultObjOnly(true);
                ajaxRsp.setResultObj(outMap);
            }
        });
    }
    /*删除{$table_des}数据*/
    public void del{$TableName}() throws Exception {
        this.ajaxRun(new AjaxRun() {
            @Override
            public void run(BaseResultVO ajaxRsp) throws Exception {
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                {$TableName}Model {$tableName}Model = new {$TableName}Model();
                {$tableName}Model.setAttr(request);
                Object ret1 = {$tableName}Service.del{$TableName}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("total",ret1);
                outMap.put("data",ret1);
                ajaxRsp.setOutputResultObjOnly(true);
                ajaxRsp.setResultObj(outMap);
            }
        });
    }

     /*修改{$table_des}数据*/
    public void update{$TableName}By{$cols[0]['ColName']}() throws Exception {
        this.ajaxRun(new AjaxRun() {
            @Override
            public void run(BaseResultVO ajaxRsp) throws Exception {
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                {$TableName}Model {$tableName}Model = new {$TableName}Model();
                {$tableName}Model.setAttr(request);
                Object ret1 = {$tableName}Service.update{$TableName}By{$cols[0]['ColName']}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("data",ret1);
                ajaxRsp.setOutputResultObjOnly(true);
                ajaxRsp.setResultObj(outMap);
            }
        });
    }

    /*单条查询{$table_des}*/
    public void find{$TableName}() throws Exception {
        this.ajaxRun(new AjaxRun() {
            @Override
            public void run(BaseResultVO ajaxRsp) throws Exception {
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                {$TableName}Model {$tableName}Model = new {$TableName}Model();
                {$tableName}Model.setAttr(request);
                {$TableName}Model ret = {$tableName}Service.find{$TableName}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("data",ret);
                ajaxRsp.setOutputResultObjOnly(true);
                ajaxRsp.setResultObj(outMap);
            }
        });
    }


    /*分页查询{$table_des}*/
    public void query{$TableName}() throws Exception {
        this.ajaxRun(new AjaxRun() {
            @Override
            public void run(BaseResultVO ajaxRsp) throws Exception {
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                String pageIndex = request.getParameter("pageIndex");
                String pageSize = request.getParameter("pageSize");
                {$TableName}Model {$tableName}Model = new {$TableName}Model();
                {$tableName}Model.setAttr(request);
                BasePageObj basePageObj = {$tableName}Service.query{$TableName}({$tableName}Model, pageIndex,pageSize);
                ArrayList<{$TableName}Model> ret = (ArrayList<{$TableName}Model>) basePageObj.getDataList();
                outMap.put("result",0);
                outMap.put("total",basePageObj.getTotalRows());
                outMap.put("data",ret);
                ajaxRsp.setOutputResultObjOnly(true);
                ajaxRsp.setResultObj(outMap);
            }
        });
    }
     /*查询所有{$table_des}*/
     public void query{$TableName}All() throws Exception {
            this.ajaxRun(new AjaxRun() {
                @Override
                public void run(BaseResultVO ajaxRsp) throws Exception {
                    Map<String, Object> outMap = new HashMap<String, Object>();
                    outMap.put("total",0);
                    outMap.put("result",2);
                    outMap.put("msg","");
                    outMap.put("data",new HashMap<>());
                    {$TableName}Model {$tableName}Model = new {$TableName}Model();
                    {$tableName}Model.setAttr(request);
                    ArrayList<{$TableName}Model> ret = {$tableName}Service.query{$TableName}All({$tableName}Model);
                    outMap.put("result",0);
                    outMap.put("data",ret);
                    ajaxRsp.setOutputResultObjOnly(true);
                    ajaxRsp.setResultObj(outMap);
                }
            });
        }

}
