package com.lhf.service;

import com.lhf.entity.*;

import java.util.List;

public interface DoctorsService {
    Doctors checkLoginDoctor(Doctors doctors);
    Doctor getDoctor(String doctor_id);
    void changePassword(String doctor_username,String doctor_password);
    List<Patient> getOwnedPatient(String doctor_id);
    List<Doctor> getDepartmentMate(String department_id);
    List<RegisterDoc> getRegisterDoc(String doctor_id);
    void setRegisterDoc(int count_id,int stat);
    void changePrescribe(String prescribe_id,String prescribe_detail);
    void changeDoctorInfo(Doctor doctor);
}
