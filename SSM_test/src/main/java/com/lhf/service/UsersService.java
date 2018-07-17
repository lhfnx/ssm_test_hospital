package com.lhf.service;

import com.lhf.entity.*;

import java.util.List;

public interface UsersService {
    Users checkLogin(Users users);
    Patient getPatient(String patient_id);
    void changePassword(String username,String new_password);
    Prescribe getPrescribe(String patient_id);
    Report getReport(String patient_id);
    Ward getWard(String ward_id);
    List<Patient> getPatientsByWardId(String ward_id);
    List<Bed> getAllFreeBed();
    List<WardEx> getWardEx(String patient_id);
    void setWardEX(String patient_id,String o_bed_id,String ex_bed_id);
    List<Doctor> getAllDoctor();
    List<RegisterDoc> getRegisterDoc(String patient_id);
    void setRegisterDoc(String patient_id,String doctor_id);
    void setOutHospital(String patient_id,String postscript);
    List<History> getHistory(String resident_id);
}
