package com.lhf.controller.user;

import com.lhf.entity.Users;
import com.lhf.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;


@Controller
public class UsersLoginController {
    @Autowired
    private UsersService usersService;

    @GetMapping(value={"/","/alllogin"})
    String allLogin(HttpSession httpsession){
        httpsession.invalidate();
        return "alllogin";
    }

    @ResponseBody
    @PostMapping("/UsersLogin")
    String checkUsersAccount(Users users, HttpSession httpsession){
        Users ur=usersService.checkLogin(users);
        if(ur!=null){
            String ur_name=usersService.getPatient(ur.getUsername()).getPatient_name();
            httpsession.setAttribute("user",ur);
            httpsession.setAttribute("user_name",ur_name);
            return "ok";
        }else{
            return "failed";
        }
    }

}
