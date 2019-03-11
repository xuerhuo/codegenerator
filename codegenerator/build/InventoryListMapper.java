package com.xnft.dao;


import java.util.Map;
import java.util.ArrayList;
import com.xnft.model.InventoryList;

public interface InventoryListMapper {
    /*添加盘点结果清单数据*/
    Integer addInventoryList(InventoryList inventoryList);

    /*删除盘点结果清单数据*/
    Integer delInventoryList(InventoryList inventoryList);

    /*修改盘点结果清单数据*/
    Integer updateInventoryListById(InventoryList inventoryList);

    /*查找单条盘点结果清单数据*/
    InventoryList findInventoryList(InventoryList inventoryList);

     /*分页查询盘点结果清单数据*/
    ArrayList<InventoryList> queryInventoryList(InventoryList inventoryList);

     /*查询所有盘点结果清单数据*/
    ArrayList<InventoryList> queryInventoryListAll(InventoryList inventoryList);
    /*查询盘点结果清单数量*/
    public Integer queryInventoryListCount(InventoryList inventoryList);

}
