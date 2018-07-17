package com.lhf.controller.admin;

import com.lhf.entity.Admins;
import com.lhf.service.AdminsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

@Controller
public class AdminsLoginController {
    @Autowired
    private AdminsService adminsService;

    @ResponseBody
    @PostMapping("/AdminsLogin")
    String checkAdminsAccount(Admins admins, HttpSession httpsession){
        Admins ad=adminsService.checkLoginAdmin(admins);
        if(ad!=null){
            httpsession.setAttribute("admin",ad);
            return "ok";
        }else{
            return "failed";
        }
    }
}
