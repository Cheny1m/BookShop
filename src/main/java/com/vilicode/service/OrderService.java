package com.vilicode.service;

import java.util.List;

import com.vilicode.bean.Book;
import com.vilicode.bean.Order;
import com.vilicode.bean.OrderItem;
import com.vilicode.bean.Page;

public interface OrderService {
    public boolean addOrder(Order order);
    public List<Order> queryOrderByUid(int uid);
    public Page queryOrdersByOstatus(int status,int pageNumber);
    public boolean updateOrderStatus(String oid,int ostatus);
    public boolean deleteOrderByOid(String oid);
}
