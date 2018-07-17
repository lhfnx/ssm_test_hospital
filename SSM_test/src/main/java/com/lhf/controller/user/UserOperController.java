package com.lhf.controller.user;

import com.lhf.entity.Users;
import com.lhf.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import static java.net.URLDecoder.decode;

@Controller
public class UserOperController {
    @Autowired
    private UsersService usersService;

    @ResponseBody
    @PostMapping("/PwdChange")
    void pwdChange(@RequestParam("newpassword")String new_password, HttpSession httpSession){
        Users users=(Users)httpSession.getAttribute("user");
        usersService.changePassword(users.getUsername(),new_password);
        users.setPassword(new_password);
        httpSession.setAttribute("user",users);
        httpSession.removeAttribute("old_pwd");
    }

    @ResponseBody
    @PostMapping("/ChangeWard")
    String changeWard(@RequestParam("o_bed_id")String o_bed_id,@RequestParam("ex_bed_id")String ex_bed_id,HttpSession
            httpSession){
        Users users=(Users)httpSession.getAttribute("user");
        usersService.setWardEX(users.getUsername(),o_bed_id,ex_bed_id);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/DocRegister")
    String docRegister(@RequestParam("re_doc_id")String re_doc_id,HttpSession httpSession){
        Users users=(Users)httpSession.getAttribute("user");
        usersService.setRegisterDoc(users.getUsername(),re_doc_id);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/HospitalOut")
    String hospitalOut(@RequestParam("postscript")String postscript,HttpSession httpSession){
        Users users=(Users)httpSession.getAttribute("user");
        String decode_postscript= null;
        try {
            decode_postscript = URLDecoder.decode(postscript,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        usersService.setOutHospital(users.getUsername(),decode_postscript);
        return "ok";
    }
}
