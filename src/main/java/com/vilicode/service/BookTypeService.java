package com.vilicode.service;

import java.util.List;

import com.vilicode.bean.BookType;
import com.vilicode.bean.Page;

public interface BookTypeService {
    public List<BookType> queryBookTypes();
    public Page queryBookByBookTypeID(int btid, int pageNumber);
    public String queryBookTypeNameByBookTypeID(int btid);
    public boolean addBookType(String btname);
    public boolean removeBookType(int btid);
    public boolean modifyBookType(int btid,String btname);
 }
