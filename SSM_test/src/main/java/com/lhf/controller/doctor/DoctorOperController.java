package com.lhf.controller.doctor;

import com.lhf.entity.Doctor;
import com.lhf.entity.Doctors;
import com.lhf.service.DoctorsService;
import com.lhf.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

@Controller
public class DoctorOperController {
    @Autowired
    private DoctorsService doctorsService;
    @Autowired
    private UsersService usersService;

    @ResponseBody
    @PostMapping("/ChangeDoctorPassword")
    void changeDoctorPassword(@RequestParam("newpassword") String newpassword, HttpSession httpSession) {
        Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
        doctorsService.changePassword(doctors.getDoctor_username(), newpassword);
        doctors.setDoctor_password(newpassword);
        httpSession.setAttribute("doctor", doctors);
        httpSession.removeAttribute("old_pwd");
    }

    @ResponseBody
    @PostMapping("/ChangeSelectedPatient")
    String changeSelectedPatient(@RequestParam("selected_patient_id") String selected_patient_id, HttpSession
            httpSession) {
        Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
        httpSession.setAttribute("selected_patient_id", selected_patient_id);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/RegisterDocConfirm")
    String confirmRegisterDoc(@RequestParam("count_id") String count_id, @RequestParam("stat") String stat,
                              HttpSession httpSession) {
        Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
        int countid = Integer.valueOf(count_id).intValue();
        int st = Integer.valueOf(stat).intValue();
        doctorsService.setRegisterDoc(countid, st);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/DoctorChangePrescribe")
    String doctorChangePrescribe(@RequestParam("prescribe_id") String prescribe_id, @RequestParam("prescribe_detail")
            String prescribe_detail, HttpSession httpSession) {
        Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
        String prescribedetail = null;
        try {
            prescribedetail = URLDecoder.decode(prescribe_detail, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        doctorsService.changePrescribe(prescribe_id, prescribedetail);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/ChangeDoctorInfo")
    String changeDoctorInfo(@RequestParam("doctor_name") String doctor_name, @RequestParam("doctor_sex") String
            doctor_sex, @RequestParam("doctor_age") String doctor_age, @RequestParam("doctor_ph") String doctor_ph,
                            @RequestParam("introduction") String introduction,HttpSession httpSession){
        Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
        Doctor doctor=new Doctor();
        doctor.setDoctor_id(doctors.getDoctor_username());
        try {
            doctor.setDoctor_name(URLDecoder.decode(doctor_name,"UTF-8" ));
            doctor.setDoctor_sex(URLDecoder.decode(doctor_sex,"UTF-8" ));
            doctor.setIntroduction(URLDecoder.decode(introduction,"UTF-8" ));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        doctor.setDoctor_age(Integer.valueOf(doctor_age).intValue());
        doctor.setDoctor_ph(doctor_ph);
        doctorsService.changeDoctorInfo(doctor);
        return "ok";
    }
}
