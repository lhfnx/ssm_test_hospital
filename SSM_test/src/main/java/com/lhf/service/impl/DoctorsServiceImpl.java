package com.lhf.service.impl;

import com.lhf.mapper.*;
import com.lhf.entity.*;
import com.lhf.service.DoctorsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorsServiceImpl implements DoctorsService{
    @Autowired
    private DoctorsMapper doctorsMapper;
    @Autowired
    private DoctorMapper doctorMapper;
    @Autowired
    private PatientMapper patientMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private RegisterDocMapper registerDocMapper;
    @Autowired
    private PrescribeMapper prescribeMapper;

    @Override
    public Doctors checkLoginDoctor(Doctors doctors){
        return doctorsMapper.selectDoctors(doctors.getDoctor_username(),doctors.getDoctor_password());
    }

    @Override
    public Doctor getDoctor(String doctor_id){
        return doctorMapper.selectDoctor(doctor_id);
    }

    @Override
    public void changePassword(String doctor_username,String doctor_password){
        doctorsMapper.updatePassword(doctor_username,doctor_password );
    }

    @Override
    public List<Patient> getOwnedPatient(String doctor_id){
        return patientMapper.selectPatientByDoctorId(doctor_id);
    }

    @Override
    public List<Doctor> getDepartmentMate(String department_id){
        return doctorMapper.selectDepartmentMate(department_id);
    }

    @Override
    public List<RegisterDoc> getRegisterDoc(String doctor_id){
        return registerDocMapper.selectRegisterDocByDoctorId(doctor_id);
    }

    @Override
    public void setRegisterDoc(int count_id,int stat){
        registerDocMapper.updateRegisterDoc(count_id,stat);
    }

    @Override
    public void changePrescribe(String prescribe_id,String prescribe_detail){
        prescribeMapper.updatePrescribe(prescribe_id,prescribe_detail);
    }

    @Override
    public void changeDoctorInfo(Doctor doctor){
        doctorMapper.updateDoctor(doctor);
    }
}
