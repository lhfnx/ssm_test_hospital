package com.lhf.controller.admin;

import com.lhf.entity.*;
import com.lhf.service.AdminsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

@Controller
public class AdminOperController {
    @Autowired
    AdminsService adminsService;

    @ResponseBody
    @PostMapping("/ChangeAdminPassword")
    String changeAdminPassword(@RequestParam("newpassword") String newpassword, HttpSession httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        adminsService.changePassword(admins.getAdmin_name(), newpassword);
        admins.setAdmin_password(newpassword);
        httpSession.setAttribute("admin", admins);
        httpSession.removeAttribute("old_pwd");
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminChangeWard")
    String adminChangeWard(@RequestParam("selected_ward_id") String selected_ward_id, HttpSession
            httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        httpSession.setAttribute("selected_ward_id", selected_ward_id);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminChangeDepartment")
    String adminChangeDepartment(@RequestParam("selected_department_id") String selected_department_id, HttpSession
            httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        httpSession.setAttribute("selected_department_id", selected_department_id);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminAddNewDoctor")
    String adminAddNewDoctor(@RequestParam("doctor_id") String doctor_id, @RequestParam("doctor_name") String
            doctor_name, @RequestParam("doctor_sex") String doctor_sex, @RequestParam("doctor_age") String
                                     doctor_age, @RequestParam("doctor_ph") String doctor_ph, @RequestParam
                                     ("department_id") String
                                     department_id, @RequestParam("introduction") String introduction, HttpSession
                                     httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        Doctor doctor = new Doctor();
        doctor.setDoctor_id(doctor_id);
        doctor.setDoctor_age(Integer.valueOf(doctor_age).intValue());
        doctor.setDoctor_ph(doctor_ph);
        doctor.setDepartment_id(department_id);
        try {
            doctor.setDoctor_name(URLDecoder.decode(doctor_name, "UTF-8"));
            doctor.setDoctor_sex(URLDecoder.decode(doctor_sex, "UTF-8"));
            doctor.setIntroduction(URLDecoder.decode(introduction, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        adminsService.setDoctor(doctor);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminAddNewWard")
    String adminAddNewWard(@RequestParam("ward_id") String ward_id, @RequestParam("ward_nurse") String ward_nurse,
                           @RequestParam("bed_num") String bed_num, @RequestParam("doctor_id") String doctor_id,
                           HttpSession httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        Ward ward = new Ward();
        ward.setWard_id(ward_id);
        ward.setBed_num(Integer.valueOf(bed_num).intValue());
        ward.setDoctor_id(doctor_id);
        try {
            ward.setWard_nurse(URLDecoder.decode(ward_nurse, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        adminsService.setWard(ward);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminAddNewDepartment")
    String adminAddNewDepartment(@RequestParam("department_id") String department_id, @RequestParam
            ("department_name") String department_name, @RequestParam("department_ph") String department_ph,
                                 HttpSession httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        Department department = new Department();
        department.setDepartment_id(department_id);
        department.setDepartment_ph(department_ph);
        try {
            department.setDepartment_name(URLDecoder.decode(department_name, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        adminsService.setDepartment(department);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminAddNewPatient")
    String adminAddNewPatient(@RequestParam("patient_id") String patient_id, @RequestParam("resident_id") String
            resident_id, @RequestParam("patient_name") String patient_name, @RequestParam("patient_sex") String
            patient_sex, @RequestParam("patient_age") String patient_age, @RequestParam("address") String address,
                              @RequestParam("patient_ph") String patient_ph, @RequestParam("register_price") String
                                      register_price, @RequestParam("in_time") Timestamp in_time, @RequestParam
                                      ("out_time") Timestamp out_time, @RequestParam("host_ex") String host_ex,
                              @RequestParam("doctor_id") String doctor_id, @RequestParam("bed_id") String bed_id,
                              @RequestParam("report_id") String report_id, @RequestParam("r_create_time") Timestamp
                                      r_create_time, @RequestParam("report_detail") String report_detail,
                              @RequestParam("report_ex") String report_ex, @RequestParam("department_id") String
                                      department_id, @RequestParam("prescribe_id") String prescribe_id, @RequestParam
                                      ("prescribe_detail") String prescribe_detail, @RequestParam("p_create_time")
                                      Timestamp p_create_time, @RequestParam("treat_ex") String treat_ex, @RequestParam
                                      ("p_doctor_id") String p_doctor_id, HttpSession httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        Patient patient=new Patient();
        Report report=new Report();
        Prescribe prescribe=new Prescribe();
        patient.setPatient_id(patient_id);
        patient.setResident_id(resident_id);
        patient.setPatient_age(Integer.valueOf(patient_age).intValue());
        patient.setPatient_ph(patient_ph);
        patient.setRegister_price(Integer.valueOf(register_price).intValue());
        patient.setIn_time(in_time);
        patient.setOut_time(out_time);
        patient.setHost_ex(Integer.valueOf(host_ex).intValue());
        patient.setDoctor_id(doctor_id);
        patient.setBed_id(bed_id);
        report.setReport_id(report_id);
        report.setCreate_time(r_create_time);
        report.setReport_ex(Integer.valueOf(report_ex).intValue());
        report.setDepartment_id(department_id);
        report.setPatient_id(patient_id);
        prescribe.setPrescribe_id(prescribe_id);
        prescribe.setCreate_time(p_create_time);
        prescribe.setTreat_ex(Integer.valueOf(treat_ex).intValue());
        prescribe.setDoctor_id(p_doctor_id);
        prescribe.setPatient_id(patient_id);
        try {
            patient.setPatient_name(URLDecoder.decode(patient_name,"UTF-8" ));
            patient.setPatient_sex(URLDecoder.decode(patient_sex,"UTF-8" ));
            patient.setAddress(URLDecoder.decode(address,"UTF-8" ));
            report.setReport_detail(URLDecoder.decode(report_detail,"UTF-8" ));
            prescribe.setPrescribe_detail(URLDecoder.decode(prescribe_detail,"UTF-8" ));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        adminsService.setPatient(patient,prescribe,report);
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminBedChange")
    String adminBedChange(@RequestParam("count_id") String count_id, @RequestParam("stat") String stat,
                              HttpSession httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        int countid = Integer.valueOf(count_id).intValue();
        int st = Integer.valueOf(stat).intValue();
        adminsService.setWardEx(countid,st );
        return "ok";
    }

    @ResponseBody
    @PostMapping("/AdminOutHospital")
    String adminOutHospital(@RequestParam("count_id") String count_id, @RequestParam("stat") String stat,
                          HttpSession httpSession) {
        Admins admins = (Admins) httpSession.getAttribute("admin");
        int countid = Integer.valueOf(count_id).intValue();
        int st = Integer.valueOf(stat).intValue();
        adminsService.setOutHospital(countid,st );
        return "ok";
    }
}
