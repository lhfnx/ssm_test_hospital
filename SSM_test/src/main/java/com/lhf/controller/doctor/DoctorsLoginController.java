package com.lhf.controller.doctor;

import com.lhf.entity.Doctors;
import com.lhf.service.DoctorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

@Controller
public class DoctorsLoginController {
    @Autowired
    private DoctorsService doctorsService;

    @ResponseBody
    @PostMapping("/DoctorsLogin")
    String checkDoctorsAccount(Doctors doctors, HttpSession httpsession){
        Doctors dc=doctorsService.checkLoginDoctor(doctors);
        if(dc!=null){
            httpsession.setAttribute("doctor",dc);
            String dc_name=doctorsService.getDoctor(dc.getDoctor_username()).getDoctor_name();
            httpsession.setAttribute("doc_name",dc_name );
            return "ok";
        }else{
            return "failed";
        }
    }
}
