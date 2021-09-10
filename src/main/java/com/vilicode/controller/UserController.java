package com.vilicode.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vilicode.Utils.MyCipher;
import com.vilicode.Utils.RandomValidateCode;
import com.vilicode.bean.Page;
import com.vilicode.bean.User;
import com.vilicode.service.UserService;

@Controller
public class UserController {
	private static final String RANDOMCODEKEY = null;
	/**
	 * 获取生成验证码显示到 UI 界面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/checkCode")
	public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		//设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        
        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
    @Autowired
    private UserService userService;
    @RequestMapping("/login")
    public String login(User tempUser,String vcode,HttpServletRequest request, HttpSession session)
    {
        String path="";
        User user=userService.login(tempUser.getUname());
        if(session.getAttribute(RandomValidateCode.RANDOMCODEKEY).equals(vcode)) {
        }
        else {
        	request.setAttribute("failMsg","验证码错误！");
        	return "user_login" ;
        }
        if(user==null)
        {
            request.setAttribute("failMsg","用户名不存在！");
            return "user_login";
        }
        if(tempUser.getUpwd().equals(user.getUpwd()))
        {
            session.setAttribute("user", user);
            request.setAttribute("msg","登录成功！");
            return "redirect:/index.action";
        }else{
            request.setAttribute("failMsg","密码错误！");
            return "user_login";
        }
    }
    @RequestMapping("/login_phone")
    public String login_phone(User tempUser,String vcode,HttpServletRequest request, HttpSession session)
    {
        String path="";
        User user=userService.login_phone(tempUser.getUphone());
        if(session.getAttribute(RandomValidateCode.RANDOMCODEKEY).equals(vcode)) {
        }
        else {
        	request.setAttribute("failMsg","验证码错误！");
        	return "user_login_phone" ;
        }
        if(user==null)
        {
            request.setAttribute("failMsg","用户不存在！");
            return "user_login_phone";
        }
        if(tempUser.getUpwd().equals(user.getUpwd()))
        {
            session.setAttribute("user", user);
            request.setAttribute("msg","登录成功！");
            return "redirect:/index.action";
        }else{
            request.setAttribute("failMsg","密码错误！");
            return "user_login_phone";
        }
    }
    @RequestMapping("/register")
    public String register(User user, HttpServletRequest request)
    {
        String path="";
        user.setUrole(1);
        user.setUmark("普通用户");
        if(userService.register(user))
        {
            path="redirect:user_login.jsp";
        }else{
            request.setAttribute("msg","用户名重复！");
            path="user_register";
        }
        return path;
    }

    @RequestMapping("/admin/user_add")
    public String AddUser(User user, HttpServletRequest request)
    {
        user.setUrole(1);
        user.setUmark("普通用户");
        if(userService.register(user))
        {
            return "redirect:user_list.action?pageNumber=1";
        }else{
            request.setAttribute("msg","用户名重复！");
            return "admin/user_add";
        }
    }
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request)
    {
        request.getSession().removeAttribute("user");
        return "redirect:index.action";
    }
    @RequestMapping("/admin/logout")
    public String adminLogout(HttpServletRequest request)
    {
        request.getSession().removeAttribute("user");
        return "redirect:index.action";
    }

    @RequestMapping("/change_phone_and_address")
    public String updateUphoneAndUaddress(int uid,String uphone,String uaddress,HttpServletRequest request)
    {
        boolean result=userService.UpdatePhoneAndAddress(uid,uphone,uaddress);
        if(result)
        {
            request.setAttribute("msg","修改成功!");
            User u=(User)request.getSession().getAttribute("user");
            u.setUaddress(uaddress);
            u.setUphone(uphone);
            request.getSession().removeAttribute("user");
            request.getSession().setAttribute("user",u);
            return "user_center";
        }
        else
        {
            request.setAttribute("failMsg","修改密码时出现错误，请确认原密码是否正确或联系管理员!");
            return "user_center";
        }
    }

    @RequestMapping("/change_password")
    public String updatePassword(int uid,String oldupwd,String upwd,HttpServletRequest request)
    {
        boolean result=userService.UpdatePassword(uid,upwd,oldupwd);
        if(result)
        {
            request.setAttribute("msg","修改成功!");
            MyCipher myCipher=new MyCipher();
            User u=(User)request.getSession().getAttribute("user");
            u.setUpwd(myCipher.encrypt(upwd,"!"));
            request.getSession().removeAttribute("user");
            request.getSession().setAttribute("user",u);
            return "user_center";
        }
        else
        {
            request.setAttribute("failMsg","修改密码时出现错误，请确认原密码是否正确或联系管理员!");
            return "user_center";
        }
    }

    @RequestMapping("admin/change_password")
    public String updatePassword(int uid,String upwd,HttpServletRequest request)
    {
        boolean result=userService.UpdatePassword(uid,upwd);
        if(result)
        {
            MyCipher myCipher=new MyCipher();
            request.setAttribute("msg","修改成功!");
            User u=(User)request.getSession().getAttribute("user");
            u.setUpwd(myCipher.encrypt(upwd,"!"));
            request.getSession().removeAttribute("user");
            request.getSession().setAttribute("user",u);
            return "redirect:user_list.action?pageNumber=1";
        }
        else
        {
            request.setAttribute("failMsg","修改失败");
            return "redirect:user_list.action?pageNumber=1";
        }
    }

    @RequestMapping("admin/user_list")
    public String ShowUserList(int pageNumber,HttpServletRequest request)
    {
        if(pageNumber<=0)
            pageNumber=1;
        Page p = userService.queryUser(pageNumber);
        if(p.getTotalPage()==0)
        {
            p.setTotalPage(1);
            p.setPageNumber(1);
        }
        else {
            if(pageNumber>=p.getTotalPage()+1)
            {
                p = userService.queryUser(p.getTotalPage());
            }
        }
        request.setAttribute("p", p);
        return "admin/user_list";
    }

    @RequestMapping("admin/user_delete")
    public String DeleteUser(int uid)
    {
        boolean result= userService.deleteUser(uid);
        return "redirect:user_list.action?pageNumber=1";
    }

    @RequestMapping("/admin/user_edit_show")
    public String ChangeUser(int uid,HttpServletRequest request)
    {
        User user=userService.queryUserByUid(uid);
        if(user==null)
            return "redirect:user_list.action?pageNumber=1";
        else
        {
            request.setAttribute("u",user);
            return "admin/user_edit";
        }
    }
    @RequestMapping("/admin/user_update")
    public String updateUser(int uid,String uphone,String uaddress,HttpServletRequest request)
    {
        boolean result=userService.UpdatePhoneAndAddress(uid,uphone,uaddress);
        if(result)
        {
            User user=(User)request.getSession().getAttribute("user");
            if(user.getUid()==uid)
            {
                user.setUaddress(uaddress);
                user.setUphone(uphone);
                request.getSession().removeAttribute("user");
                request.getSession().setAttribute("user",user);
            }
        }
        return "redirect:user_list.action?pageNumber=1";
    }
}
