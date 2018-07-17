package com.lhf.service.impl;

import com.lhf.mapper.*;
import com.lhf.entity.*;
import com.lhf.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImpl implements UsersService{
    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    private PatientMapper patientMapper;
    @Autowired
    private PrescribeMapper prescribeMapper;
    @Autowired
    private ReportMapper reportMapper;
    @Autowired
    private DoctorMapper doctorMapper;
    @Autowired
    private WardMapper wardMapper;
    @Autowired
    private BedMapper bedMapper;
    @Autowired
    private WardExMapper wardExMapper;
    @Autowired
    private RegisterDocMapper registerDocMapper;
    @Autowired
    private OutHospitalMapper outHospitalMapper;
    @Autowired
    private HistoryMapper historyMapper;

    @Override
    public Users checkLogin(Users users){
        return usersMapper.selectUsers(users.getUsername(),users.getPassword());
    }

    @Override
    public Patient getPatient(String patient_id){
        return patientMapper.selectPatient(patient_id);
    }

    @Override
    public void changePassword(String username,String new_password){
        usersMapper.updatePassword(username,new_password);
    }

    @Override
    public Prescribe getPrescribe(String patient_id){
        return prescribeMapper.selectPrescribeByPatientId(patient_id);
    }

    @Override
    public Report getReport(String patient_id){
        return reportMapper.selectReportByPatientId(patient_id);
    }

    @Override
    public Ward getWard(String ward_id){
        return wardMapper.selectWard(ward_id);
    }

    @Override
    public List<Patient> getPatientsByWardId(String ward_id){
        return patientMapper.selectPatientByWardId(ward_id);
    }

    @Override
    public List<Bed> getAllFreeBed(){
        return bedMapper.selectAllFreeBed();
    }

    @Override
    public List<WardEx> getWardEx(String patient_id){
        return wardExMapper.selectWardEx(patient_id);
    }

    @Override
    public void setWardEX(String patient_id,String o_bed_id,String ex_bed_id){
        wardExMapper.insertWardEx(patient_id,o_bed_id,ex_bed_id);
    }

    @Override
    public List<Doctor> getAllDoctor(){
        return doctorMapper.selectAllDoctor();
    }

    @Override
    public List<RegisterDoc> getRegisterDoc(String patient_id){
        return registerDocMapper.selectRegisterDoc(patient_id);
    }

    @Override
    public void setRegisterDoc(String patient_id,String doctor_id){
        registerDocMapper.insertRegisterDoc(patient_id,doctor_id);
    }

    @Override
    public void setOutHospital(String patient_id,String postscript){
        outHospitalMapper.insertOutHospital(patient_id,postscript);
    }

    @Override
    public List<History> getHistory(String resident_id){
        return historyMapper.selectHistory(resident_id);
    }
}
