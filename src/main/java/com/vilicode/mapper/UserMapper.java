package com.vilicode.mapper;

import java.util.List;

import com.vilicode.bean.User;

public interface UserMapper {
    public void addUser(User user);
    public int identify(String uname);
    public void UpdatePhoneAndAddress(int uid,String uphone,String uaddress);
    public void UpdatePassword(int uid,String upwd);
    public int getUidByUname(String uname);
    public User login(String uname );
    public User login_phone(String uphone );
    public String queryUpwd(int uid);
    public List<User> queryUser(int pageIndex,int pageSize);
    public int queryCountOfUser();
    public void deleteUser(int uid);
    public User queryUserByUid(int uid);
}