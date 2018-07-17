package com.lhf.service.impl;

import com.lhf.mapper.*;
import com.lhf.entity.*;
import com.lhf.service.AdminsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class AdminsServiceImpl implements AdminsService{
    @Autowired
    private AdminsMapper adminsMapper;
    @Autowired
    private PatientMapper patientMapper;
    @Autowired
    private DoctorMapper doctorMapper;
    @Autowired
    private WardMapper wardMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private PrescribeMapper prescribeMapper;
    @Autowired
    private ReportMapper reportMapper;
    @Autowired
    private WardExMapper wardExMapper;
    @Autowired
    private OutHospitalMapper outHospitalMapper;

    @Override
    public Admins checkLoginAdmin(Admins admins){
        return adminsMapper.selectAdmins(admins.getAdmin_name(),admins.getAdmin_password());
    }

    @Override
    public List<Patient> getAllPatient(){
        return patientMapper.selectALLPatient();
    }

    @Override
    public List<Doctor> getAllDoctor(){
        return doctorMapper.selectAllDoctor();
    }

    @Override
    public List<Ward> getAllWard(){
        return wardMapper.selectALLWard();
    }

    @Override
    public List<Patient> getPatientByWardId(String ward_id){
        return patientMapper.selectPatientByWardId(ward_id);
    }

    @Override
    public Ward getWard(String ward_id){
        return wardMapper.selectWard(ward_id);
    }

    @Override
    public List<Department> getAllDepartment(){
        return departmentMapper.selectAllDepartment();
    }

    @Override
    public List<Doctor> getDoctorByDepartmentId(String department_id){
        return doctorMapper.selectDepartmentMate(department_id);
    }

    @Override
    public Department getDepartment(String department_id){
        return departmentMapper.selectDepartment(department_id);
    }

    @Override
    public void setDoctor(Doctor doctor){
        doctorMapper.insertDoctor(doctor);
    }

    @Override
    public void setWard(Ward ward){
        wardMapper.insertWard(ward);
    }

    @Override
    public void setDepartment(Department department){
        departmentMapper.insertDepartment(department);
    }

    @Override
    public void setPatient(Patient patient,Prescribe prescribe,Report report){
        patientMapper.insertPatient(patient);
        prescribeMapper.insertPrescribe(prescribe);
        reportMapper.insertReport(report);
    }

    @Override
    public List<WardEx> getAllWardEx(){
        return wardExMapper.selectAllWardEx();
    }

    @Override
    public List<OutHospital> getAllOutHospital(){
        return outHospitalMapper.selectAllOutHospital();
    }

    @Override
    public void setWardEx(int count_id,int stat){
        wardExMapper.updateWardEx(count_id,stat );
    }

    @Override
    public void setOutHospital(int count_id,int stat){
        outHospitalMapper.updateOutHospital(count_id,stat );
    }

    @Override
    public void changePassword(String admin_name,String admin_password){
        adminsMapper.updatePassword(admin_name,admin_password );
    }
}
