package com.vilicode.service;

import java.util.List;

import com.vilicode.bean.Page;
import com.vilicode.bean.User;

public interface UserService {
    public Boolean register(User user);
    public User login(String uname);
    public User login_phone(String uphone);
    public boolean UpdatePhoneAndAddress(int uid,String uphone,String uaddress);
    public boolean UpdatePassword(int uid,String upwd,String oldupwd);
    public boolean UpdatePassword(int uid,String upwd);
    public Page queryUser(int pageNumber);
    public boolean deleteUser(int uid);
    public User queryUserByUid(int uid);
}
