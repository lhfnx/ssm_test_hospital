package com.lhf.service;

import com.lhf.entity.*;

import java.util.List;

public interface AdminsService {
    Admins checkLoginAdmin(Admins admins);
    List<Patient> getAllPatient();
    List<Doctor> getAllDoctor();
    List<Ward> getAllWard();
    List<Patient> getPatientByWardId(String ward_id);
    Ward getWard(String ward_id);
    List<Department> getAllDepartment();
    List<Doctor> getDoctorByDepartmentId(String department_id);
    Department getDepartment(String department_id);
    void setDoctor(Doctor doctor);
    void setWard(Ward ward);
    void setDepartment(Department department);
    void setPatient(Patient patient,Prescribe prescribe,Report report);
    List<WardEx> getAllWardEx();
    List<OutHospital> getAllOutHospital();
    void setWardEx(int count_id,int stat);
    void setOutHospital(int count_id,int stat);
    void changePassword(String admin_name,String admin_password);
}
