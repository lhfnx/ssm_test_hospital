package com.lhf.controller.admin;

import com.lhf.entity.*;
import com.lhf.service.AdminsService;
import com.lhf.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class AdminNavController {
    @Autowired
    private AdminsService adminsService;
    @Autowired
    private UsersService usersService;

    @GetMapping("/AdminFrontPage")
    String adminFrontPage(HttpSession httpSession) {
        if (httpSession.getAttribute("admin") != null) {
            return "admin/AdminFrontPage";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminHelpPage")
    String adminHelpPage(HttpSession httpSession) {
        if (httpSession.getAttribute("admin") != null) {
            return "admin/AdminHelpPage";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminPasswordChange")
    String adminPasswordChange(HttpSession httpSession) {
        if (httpSession.getAttribute("admin") != null) {
            Admins admins = (Admins) httpSession.getAttribute("admin");
            httpSession.setAttribute("old_pwd", admins.getAdmin_password());
            return "admin/AdminPasswordChange";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminPatientInfo")
    String adminPatientInfo(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            model.addAttribute("patients", adminsService.getAllPatient());
            return "admin/AdminPatientInfo";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminDoctorInfo")
    String adminDoctorInfo(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            model.addAttribute("doctors", adminsService.getAllDoctor());
            return "admin/AdminDoctorInfo";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminWardInfo")
    String adminWardInfo(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            Admins admins = (Admins) httpSession.getAttribute("admin");
            List<Ward> wards = adminsService.getAllWard();
            model.addAttribute("wards", wards);
            if (httpSession.getAttribute("selected_ward_id") == null) {
                model.addAttribute("selected_ward", wards.get(0));
                model.addAttribute("patients", adminsService.getPatientByWardId(wards.get(0).getWard_id()));
            } else {
                model.addAttribute("selected_ward", adminsService.getWard((String) httpSession.getAttribute
                        ("selected_ward_id")));
                List<Patient> patients = adminsService.getPatientByWardId((String) httpSession.getAttribute
                        ("selected_ward_id"));
                model.addAttribute("patients", patients);
                httpSession.removeAttribute("selected_ward_id");
            }
            return "admin/AdminWardInfo";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminDepartmentInfo")
    String adminDepartmentInfo(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            Admins admins = (Admins) httpSession.getAttribute("admin");
            List<Department> departments = adminsService.getAllDepartment();
            model.addAttribute("departments", departments);
            if (httpSession.getAttribute("selected_department_id") == null) {
                model.addAttribute("selected_department", departments.get(0));
                model.addAttribute("doctors", adminsService.getDoctorByDepartmentId(departments.get(0).getDepartment_id()));
            } else {
                model.addAttribute("selected_department", adminsService.getDepartment((String) httpSession.getAttribute
                        ("selected_department_id")));
                List<Doctor> doctors = adminsService.getDoctorByDepartmentId((String) httpSession.getAttribute
                        ("selected_department_id"));
                model.addAttribute("doctors", doctors);
                httpSession.removeAttribute("selected_department_id");
            }
            return "admin/AdminDepartmentInfo";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminAddDoctor")
    String adminAddDoctor(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            Admins admins = (Admins) httpSession.getAttribute("admin");
            List<Department> departments = adminsService.getAllDepartment();
            model.addAttribute("departments", departments);
            return "admin/AdminAddDoctor";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminAddWard")
    String adminAddWard(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            model.addAttribute("doctors", adminsService.getAllDoctor());
            return "admin/AdminAddWard";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminAddDepartment")
    String adminAddDepartment(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            return "admin/AdminAddDepartment";
        } else {
            return "/alllogin";
        }
    }

    @GetMapping("/AdminAddPatient")
    String adminAddPatient(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            model.addAttribute("doctors", adminsService.getAllDoctor());
            List<Department> departments = adminsService.getAllDepartment();
            model.addAttribute("departments", departments);
            List<Bed> beds=usersService.getAllFreeBed();
            model.addAttribute("beds",beds);
            return "admin/AdminAddPatient";
        } else {
            return "/alllogin";
        }
    }
    @GetMapping("/AdminConfirm")
    String adminConfirm(HttpSession httpSession, Model model) {
        if (httpSession.getAttribute("admin") != null) {
            model.addAttribute("wardexs", adminsService.getAllWardEx());
            model.addAttribute("outhospitals",adminsService.getAllOutHospital());
            return "admin/AdminConfirm";
        } else {
            return "/alllogin";
        }
    }
}
