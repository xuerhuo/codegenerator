package com.xnft.service.impl;
import com.xnft.dao.InventoryListMapper;
import com.xnft.model.InventoryList;
import com.xnft.service.InventoryListService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;

public class InventoryListServiceImpl  implements InventoryListService {
    @Autowired
    private InventoryListMapper inventoryListMapper;

    /*添加盘点结果清单数据*/
    public Integer addInventoryList(InventoryList inventoryList) {
        return inventoryListMapper.addInventoryList(inventoryList);
    }
    /*删除盘点结果清单数据*/
    public Integer delInventoryList(InventoryList inventoryList) {
        return inventoryListMapper.delInventoryList(inventoryList);
    }
    /*修改盘点结果清单数据*/
    public Integer updateInventoryListById(InventoryList inventoryList) {
        return inventoryListMapper.updateInventoryListById(inventoryList);
    }
    /*查找单条盘点结果清单数据*/
    public InventoryList findInventoryList(InventoryList inventoryList) {
        return inventoryListMapper.findInventoryList(inventoryList);
    }
    /*分页查询盘点结果清单数据*/
    public Map<String, Object> queryInventoryList(InventoryList inventoryList) {
        HashMap<String, Object> ret = new HashMap<>();
         ret.put("data",inventoryListMapper.queryInventoryList(inventoryList));
         ret.put("count",inventoryListMapper.queryInventoryListCount(inventoryList));
         return  ret;
    }
     /*查询所有盘点结果清单数据*/
    public ArrayList<InventoryList> queryInventoryListAll(InventoryList inventoryList) {
        return inventoryListMapper.queryInventoryListAll(inventoryList);
    }
    /*查询盘点结果清单数量*/
    public Integer queryInventoryListCount(InventoryList inventoryList) {
        return inventoryListMapper.queryInventoryListCount(inventoryList);
    }
}
