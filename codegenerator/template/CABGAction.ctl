{eval $file=$TableName.'Action.java'}
package {$package}.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.founder.ec.base.action.BaseAction;
import com.founder.ec.common.model.SysCode;
import com.founder.ec.common.service.SystemService;
import com.founder.ec.common.type.NNoticeType;
import com.founder.ec.common.utils.DateUtils;
import com.founder.ec.mail.model.MailSend;
import com.founder.ec.mail.model.MailTemplate;
import com.founder.ec.member.service.MailServices;
import com.founder.ec.util.Cookies;

@RequestMapping(value = "/{$table}")
public class {$TableName}Action extends BaseAction {
	@Autowired
	private {$TableName}Service {$tableName}Service;
    /*添加{$table_des}数据*/
    @RequestMapping("/add{$TableName}")
    public Map<String,Object> add{$TableName}(HttpServletRequest request,{$TableName}Model {$tableName}Model) throws Exception {
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                Object ret1 = {$tableName}Service.add{$TableName}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("data",ret1);
                return outMap;
    }
    /*删除{$table_des}数据*/
    @RequestMapping("/del{$TableName}")
    public Map<String,Object> del{$TableName}(HttpServletRequest request,{$TableName}Model {$tableName}Model) throws Exception {
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                Object ret1 = {$tableName}Service.del{$TableName}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("total",ret1);
                outMap.put("data",ret1);
                return outMap;
    }

     /*修改{$table_des}数据*/
    @RequestMapping("/update{$TableName}By{$cols[0]['ColName']}")
    public  Map<String,Object> update{$TableName}By{$cols[0]['ColName']}(HttpServletRequest request,{$TableName}Model {$tableName}Model){
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                Object ret1 = {$tableName}Service.update{$TableName}By{$cols[0]['ColName']}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("data",ret1);
                return outMap;
    }

    /*单条查询{$table_des}*/
    @RequestMapping("/find{$TableName}")
    public  Map<String,Object> find{$TableName}(HttpServletRequest request,{$TableName}Model {$tableName}Model){
                Map<String, Object> outMap = new HashMap<String, Object>();
                outMap.put("total",0);
                outMap.put("result",2);
                outMap.put("msg","");
                outMap.put("data",new HashMap<>());
                {$TableName}Model ret = {$tableName}Service.find{$TableName}({$tableName}Model);
                outMap.put("result",0);
                outMap.put("data",ret);
                return outMap;
    }


    /*分页查询{$table_des}*/
    @RequestMapping("/query{$TableName}")
    public  Map<String,Object> query{$TableName}(HttpServletRequest request,{$TableName}Model {$tableName}Model){
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
                return outMap;
    }
     /*查询所有{$table_des}*/
    @RequestMapping("/query{$TableName}")
     public  Map<String,Object> query{$TableName}All(HttpServletRequest request,{$TableName}Model {$tableName}Model){
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
                    return outMap;
        }

}
