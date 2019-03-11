{eval $file=$TableName.'Controller.java'}
package {$package}.controller;

import {$package}.model.{$TableName};
import {$package}.service.{$TableName}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("{$tableName}")
public class {$TableName}Controller {
    @Autowired
    private {$TableName}Service {$tableName}Service;

    @RequestMapping("query{$tableName}")
    @ResponseBody
    public {$TableName} query{$tableName}(HttpServletRequest request, {$TableName} {$tableName}){
        Map<String, Object> ret = new HashMap<>();
        ret = {$tableName}Service.query{$TableName}({$tableName});
        ret.put("code",0);
        return  ret;
    }

}
