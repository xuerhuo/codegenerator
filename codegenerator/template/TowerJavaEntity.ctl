{eval $file=$TableName.'Model.java'}
package {$package};
import com.ec.ctower.core.exception.BusiException;
import com.ec.ctower.core.mvc.model.BaseModel;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import com.utils.DateUtil;


public class {$TableName}Model extends BaseModel {
{foreach $cols $col}
    /**{$col['comment']} {$col['type']}**/
    private {$col['jtype']} {$col['colName']};
{/foreach}

{foreach $cols $col}
    /**{$col['comment']}**/
    public void set{$col['ColName']}({$col['jtype']} {$col['colName']}){
        this.{$col['colName']} = {$col['colName']};
    }
    /**{$col['comment']}**/
    public {$col['jtype']} get{$col['ColName']}(){
        return this.{$col['colName']};
    }
{/foreach}

    @Override
    public String getTableName() throws BusiException {
        return "{$table_raw}";
    }
    @Override
    public String getPkName() {
        return "{$cols[0]['colName']}";
    }
    @Override
    public boolean isIndex() throws BusiException {
        return false;
    }

    @Override
    public String toString() {
        return "{$TableName}Model{" +
        {foreach $cols $col}
            "{$col['colName']}='" +{$col['colName']}+"'"+
        {/foreach}
                '}';
    }
    //设置当前对象的值
    public void setAttr(HttpServletRequest request) {
{foreach $cols $col}
{if $col['jtype']=='String'}
        /**设置{$col['comment']} {$col['type']}**/
        String {$col['colName']}Val = request.getParameter("{$col['colName']}");
        if(!StringUtils.isBlank({$col['colName']}Val)){
            this.set{$col['ColName']}({$col['colName']}Val);
        }
{/if}
{if $col['jtype']=='Date'}
        /**设置{$col['comment']} {$col['type']}**/
        String {$col['colName']}Val = request.getParameter("{$col['colName']}");
        if(!StringUtils.isBlank({$col['colName']}Val)){
            this.set{$col['ColName']}(DateUtil.stringToTime({$col['colName']}Val));
        }
{/if}
{if $col['jtype']=='Integer'}
        /**设置{$col['comment']} {$col['type']}**/
        String {$col['colName']}Val = request.getParameter("{$col['colName']}");
        if(!StringUtils.isBlank({$col['colName']}Val)){
            this.set{$col['ColName']}(Integer.valueOf({$col['colName']}Val));
        }
{/if}
{/foreach}
    }

}
