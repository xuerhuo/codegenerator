package com.xnft.model;
import org.apache.commons.lang.StringUtils;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;


public class InventoryList extends Base{
    /** int(11)**/
    private Integer id;
    /**柜子id varchar(50)**/
    private String filecapId;
    /**文件编码 varchar(100)**/
    private String archiveNo;
    /**创建时间 datetime**/
    private Date crtDate;
    /**盘点id  备用 int(11)**/
    private Integer inventoryId;
    /**文档检测结果 int(11)**/
    private Integer status;
    /**返回的档案管理员手机 varchar(20)**/
    private String operator;
    /**格口号代码 int(11)**/
    private Integer boxBo;

    /****/
    public void setId(Integer id){
        this.id = id;
    }
    /****/
    public Integer getId(){
        return this.id;
    }
    /**柜子id**/
    public void setFilecapId(String filecapId){
        this.filecapId = filecapId;
    }
    /**柜子id**/
    public String getFilecapId(){
        return this.filecapId;
    }
    /**文件编码**/
    public void setArchiveNo(String archiveNo){
        this.archiveNo = archiveNo;
    }
    /**文件编码**/
    public String getArchiveNo(){
        return this.archiveNo;
    }
    /**创建时间**/
    public void setCrtDate(Date crtDate){
        this.crtDate = crtDate;
    }
    /**创建时间**/
    public Date getCrtDate(){
        return this.crtDate;
    }
    /**盘点id  备用**/
    public void setInventoryId(Integer inventoryId){
        this.inventoryId = inventoryId;
    }
    /**盘点id  备用**/
    public Integer getInventoryId(){
        return this.inventoryId;
    }
    /**文档检测结果**/
    public void setStatus(Integer status){
        this.status = status;
    }
    /**文档检测结果**/
    public Integer getStatus(){
        return this.status;
    }
    /**返回的档案管理员手机**/
    public void setOperator(String operator){
        this.operator = operator;
    }
    /**返回的档案管理员手机**/
    public String getOperator(){
        return this.operator;
    }
    /**格口号代码**/
    public void setBoxBo(Integer boxBo){
        this.boxBo = boxBo;
    }
    /**格口号代码**/
    public Integer getBoxBo(){
        return this.boxBo;
    }

    @Override
    public String toString() {
        return "InventoryListModel{" +
                    "id='" +id+"'"+
                    "filecapId='" +filecapId+"'"+
                    "archiveNo='" +archiveNo+"'"+
                    "crtDate='" +crtDate+"'"+
                    "inventoryId='" +inventoryId+"'"+
                    "status='" +status+"'"+
                    "operator='" +operator+"'"+
                    "boxBo='" +boxBo+"'"+
                        '}';
    }
    //设置当前对象的值
    public void setAttr(HttpServletRequest request) {
        /**设置 int(11)**/
        String idVal = request.getParameter("id");
        if(!StringUtils.isBlank(idVal)){
            this.setId(Integer.valueOf(idVal));
        }
        /**设置柜子id varchar(50)**/
        String filecapIdVal = request.getParameter("filecapId");
        if(!StringUtils.isBlank(filecapIdVal)){
            this.setFilecapId(filecapIdVal);
        }
        /**设置文件编码 varchar(100)**/
        String archiveNoVal = request.getParameter("archiveNo");
        if(!StringUtils.isBlank(archiveNoVal)){
            this.setArchiveNo(archiveNoVal);
        }
        /**设置创建时间 datetime**/
        String crtDateVal = request.getParameter("crtDate");
        if(!StringUtils.isBlank(crtDateVal)){
//            this.setCrtDate(DateUtil.stringToTime(crtDateVal));
        }
        /**设置盘点id  备用 int(11)**/
        String inventoryIdVal = request.getParameter("inventoryId");
        if(!StringUtils.isBlank(inventoryIdVal)){
            this.setInventoryId(Integer.valueOf(inventoryIdVal));
        }
        /**设置文档检测结果 int(11)**/
        String statusVal = request.getParameter("status");
        if(!StringUtils.isBlank(statusVal)){
            this.setStatus(Integer.valueOf(statusVal));
        }
        /**设置返回的档案管理员手机 varchar(20)**/
        String operatorVal = request.getParameter("operator");
        if(!StringUtils.isBlank(operatorVal)){
            this.setOperator(operatorVal);
        }
        /**设置格口号代码 int(11)**/
        String boxBoVal = request.getParameter("boxBo");
        if(!StringUtils.isBlank(boxBoVal)){
            this.setBoxBo(Integer.valueOf(boxBoVal));
        }
    }

}
