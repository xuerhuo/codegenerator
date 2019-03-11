package com.xnft.service;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import com.xnft.model.InventoryList;


import java.util.List;

public interface InventoryListService {

    /*添加盘点结果清单数据*/
    Integer addInventoryList(InventoryList inventoryList);

    /*删除盘点结果清单数据*/
    Integer delInventoryList(InventoryList inventoryList);

    /*修改盘点结果清单数据*/
    Integer updateInventoryListById(InventoryList inventoryList);

    /*查找单条盘点结果清单数据*/
    InventoryList findInventoryList(InventoryList inventoryList);

     /*分页查询盘点结果清单数据*/
 //   BasePageObj queryInventoryList(InventoryList inventoryList,String pageIndex, String pageSize);

     /*查询所有盘点结果清单数据*/
    ArrayList<InventoryList> queryInventoryListAll(InventoryList inventoryList);
    /*查询盘点结果清单数量*/
    public Integer queryInventoryListCount(InventoryList inventoryList);

}