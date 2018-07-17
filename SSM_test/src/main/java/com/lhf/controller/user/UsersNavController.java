package com.lhf.controller.user;

import com.lhf.entity.*;
import com.lhf.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
public class UsersNavController {
    @Autowired
    private UsersService usersService;

    @GetMapping("/UserFrontPage")
    String usersFrontPage(HttpSession httpSession){
        if(httpSession.getAttribute("user")!=null){
            return "user/UserFrontPage";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/HelpPage")
    String helpPage(HttpSession httpSession){
        if(httpSession.getAttribute("user")!=null){
            return "user/HelpPage";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/PasswordChange")
    String passwordChange(HttpSession httpSession){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            httpSession.setAttribute("old_pwd",users.getPassword());
            return "user/PasswordChange";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/PatientInfo")
    String getPatientInfo(HttpSession httpSession, Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Patient patient=usersService.getPatient(users.getUsername());
            model.addAttribute("patient_name",patient.getPatient_name());
            model.addAttribute("resident_id",patient.getResident_id());
            model.addAttribute("patient_sex",patient.getPatient_sex());
            model.addAttribute("patient_age",patient.getPatient_age());
            model.addAttribute("patient_ph",patient.getPatient_ph());
            SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            String in_time=df.format(patient.getIn_time());
            model.addAttribute("in_time",in_time);
            String out_time=df.format(patient.getOut_time());
            model.addAttribute("out_time",out_time);
            model.addAttribute("doctor_name",patient.getDoctor().getDoctor_name());
            model.addAttribute("ward_id",patient.getBed().getWard_id());
            model.addAttribute("bed_id",patient.getBed().getBed_id());
            model.addAttribute("address",patient.getAddress());
            return "user/PatientInfo";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/PrescribeInfo")
    String getPrescribeInfo(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Prescribe prescribe=usersService.getPrescribe(users.getUsername());
            model.addAttribute("prescribe_id",prescribe.getPrescribe_id());
            model.addAttribute("patient_name",prescribe.getPatient().getPatient_name());
            SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            String create_time=df.format(prescribe.getCreate_time());
            model.addAttribute("create_time",create_time);
            model.addAttribute("doctor_name",prescribe.getDoctor().getDoctor_name());
            model.addAttribute("prescribe_detail",prescribe.getPrescribe_detail());
            return "user/PrescribeInfo";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/ReportInfo")
    String getReportInfo(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Report report=usersService.getReport(users.getUsername());
            model.addAttribute("report_id",report.getReport_id());
            model.addAttribute("patient_name",report.getPatient().getPatient_name());
            SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            String create_time=df.format(report.getCreate_time());
            model.addAttribute("create_time",create_time);
            model.addAttribute("department_name",report.getDepartment().getDepartment_name());
            model.addAttribute("report_detail",report.getReport_detail());
            return "user/ReportInfo";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/DoctorInfo")
    String getDoctorInfo(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Doctor doctor=usersService.getPatient(users.getUsername()).getDoctor();
            model.addAttribute("doctor_id",doctor.getDoctor_id());
            model.addAttribute("doctor_name",doctor.getDoctor_name());
            model.addAttribute("doctor_sex",doctor.getDoctor_sex());
            model.addAttribute("doctor_age",doctor.getDoctor_age());
            model.addAttribute("doctor_ph",doctor.getDoctor_ph());
            model.addAttribute("department_name",doctor.getDepartment().getDepartment_name());
            model.addAttribute("introduction",doctor.getIntroduction());
            return "user/DoctorInfo";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/WardInfo")
    String getWardInfo(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            String  ward_id=usersService.getPatient(users.getUsername()).getBed().getWard_id();
            model.addAttribute("ward_id",ward_id);
            model.addAttribute("bed_id",usersService.getPatient(users.getUsername()).getBed().getBed_id());
            model.addAttribute("bed_num",usersService.getWard(ward_id).getBed_num());
            model.addAttribute("patients",usersService.getPatientsByWardId(ward_id));
            return "user/WardInfo";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/WardChange")
    String getWardChange(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Bed bed=usersService.getPatient(users.getUsername()).getBed();
            model.addAttribute("ward_id",bed.getWard_id());
            model.addAttribute("bed_id",bed.getBed_id());
            model.addAttribute("free_bed",usersService.getAllFreeBed());
            List<WardEx> wardEx=usersService.getWardEx(users.getUsername());
            model.addAttribute("ward_ex",wardEx);
            return "user/WardChange";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/RegisterDoc")
    String getRegisterDoc(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            List<Doctor> all_doc=usersService.getAllDoctor();
            model.addAttribute("all_doc",all_doc);
            List<RegisterDoc> registerDocs=usersService.getRegisterDoc(users.getUsername());
            model.addAttribute("reg_doc",registerDocs);
            return "user/RegisterDoc";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/OutHospital")
    String getOutHospital(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Patient patient=usersService.getPatient(users.getUsername());
            SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd");
            String in_time=df.format(patient.getIn_time());
            model.addAttribute("in_time",in_time);
            String out_time=df.format(patient.getOut_time());
            model.addAttribute("out_time",out_time);
            return "user/OutHospital";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/PayPrice")
    String getPayPrice(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Patient patient=usersService.getPatient(users.getUsername());
            double register_price=patient.getRegister_price();
            model.addAttribute("register_price",register_price);
            double host_ex=patient.getHost_ex();
            model.addAttribute("host_ex",host_ex);
            double treat_ex=usersService.getPrescribe(users.getUsername()).getTreat_ex();
            model.addAttribute("treat_ex",treat_ex);
            double report_ex=usersService.getReport(users.getUsername()).getReport_ex();
            model.addAttribute("report_ex",report_ex);
            model.addAttribute("sum_ex",register_price+host_ex+treat_ex+report_ex);
            return "user/PayPrice";
        }else{
            return "redirect:/alllogin";
        }
    }

    @GetMapping("/History")
    String getHistory(HttpSession httpSession,Model model){
        if(httpSession.getAttribute("user")!=null){
            Users users=(Users)httpSession.getAttribute("user");
            Patient patient=usersService.getPatient(users.getUsername());
            model.addAttribute("patient_name",patient.getPatient_name());
            model.addAttribute("resident_id",patient.getResident_id());
            model.addAttribute("patient_sex",patient.getPatient_sex());
            model.addAttribute("patient_age",patient.getPatient_age());
            model.addAttribute("history",usersService.getHistory(patient.getResident_id()));
            return "user/History";
        }else{
            return "redirect:/alllogin";
        }
    }
}