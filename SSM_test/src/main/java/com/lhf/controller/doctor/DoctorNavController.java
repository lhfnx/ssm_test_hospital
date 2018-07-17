package com.lhf.controller.doctor;


import com.lhf.entity.*;
import com.lhf.service.DoctorsService;
import com.lhf.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class DoctorNavController {
    @Autowired
    DoctorsService doctorsService;
    @Autowired
    UsersService usersService;

    @GetMapping("/DoctorFrontPage")
    String doctorFrontPage(HttpSession httpSession) {
        if (httpSession.getAttribute("doctor") != null) {
            return "doctor/DoctorFrontPage";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/DoctorPasswordChange")
    String doctorPasswordChange(HttpSession httpSession) {
        if (httpSession.getAttribute("doctor") != null) {
            Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
            httpSession.setAttribute("old_pwd", doctors.getDoctor_password());
            return "doctor/DoctorPasswordChange";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/DoctorPatientInfo")
    String doctorPatientInfo(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("doctor") != null) {
            Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
            List<Patient> patients = doctorsService.getOwnedPatient(doctors.getDoctor_username());
            model.addAttribute("patient", patients);
            if(httpSession.getAttribute("selected_patient_id") == null) {
                model.addAttribute("selected_patient", patients.get(0));
            }else {
                Patient patient=usersService.getPatient((String)httpSession.getAttribute("selected_patient_id"));
                model.addAttribute("selected_patient",patient);
                httpSession.removeAttribute("selected_patient_id");
                System.out.println((String)httpSession.getAttribute("selected_patient_id"));
            }
            return "doctor/DoctorPatientInfo";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/DoctorDepartmentInfo")
    String doctorDepartmentInfo(HttpSession httpSession, Model model){
        if (httpSession.getAttribute("doctor") != null) {
            Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
            Doctor doctor=doctorsService.getDoctor(doctors.getDoctor_username());
            Department department=doctorsService.getDoctor(doctors.getDoctor_username()).getDepartment();
            model.addAttribute("department",department);
            model.addAttribute("mate",doctorsService.getDepartmentMate(doctor.getDepartment().getDepartment_id()));
            return "doctor/DoctorDepartmentInfo";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/DoctorRegisterInfo")
    String doctorRegisterInfo(HttpSession httpSession, Model model){
        if (httpSession.getAttribute("doctor") != null) {
            Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
            List<RegisterDoc> registerDocList=doctorsService.getRegisterDoc(doctors.getDoctor_username());
            model.addAttribute("registerDocList",registerDocList);
            return "doctor/DoctorRegisterInfo";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/DoctorPrescribeChange")
    String doctorPrescribeChange(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("doctor") != null) {
            Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
            List<Patient> patients = doctorsService.getOwnedPatient(doctors.getDoctor_username());
            model.addAttribute("patient", patients);
            if(httpSession.getAttribute("selected_patient_id") == null) {
                model.addAttribute("selected_patient_pre", usersService.getPrescribe(patients.get(0).getPatient_id()));
            }else {
                Prescribe prescribe=usersService.getPrescribe((String)httpSession.getAttribute
                        ("selected_patient_id"));
                model.addAttribute("selected_patient_pre",prescribe);
                httpSession.removeAttribute("selected_patient_id");
            }
            return "doctor/DoctorPrescribeChange";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/DoctorInfoChange")
    String doctorInfoChange(HttpSession httpSession, Model model){
        if (httpSession.getAttribute("doctor") != null) {
            Doctors doctors = (Doctors) httpSession.getAttribute("doctor");
            Doctor doctor=doctorsService.getDoctor(doctors.getDoctor_username());
            model.addAttribute("doctor",doctor);
            return "doctor/DoctorInfoChange";
        } else {
            return "/alllogin";
        }
    }
}
