package com.lhf.mapper;

import com.lhf.entity.Patient;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PatientMapper {
    @Select("SELECT * FROM patient WHERE patient_id=#{patient_id}")
    @Results(value = {@Result(property = "doctor", column = "doctor_id", one = @One(select = "com.lhf.mapper" +
            ".DoctorMapper.selectDoctor")), @Result(property = "bed", column = "bed_id", one = @One(select = "com.lhf" +
            ".mapper.BedMapper.selectBed"))})
    Patient selectPatient(@Param("patient_id") String patient_id);

    @Select("SELECT * FROM patient WHERE bed_id IN(select bed_id from bed where ward_id=#{ward_id})")
    List<Patient> selectPatientByWardId(@Param("ward_id") String ward_id);

    @Select("SELECT * FROM patient WHERE doctor_id=#{doctor_id}")
    @Results(value = {@Result(property = "bed", column = "bed_id", one = @One(select = "com.lhf" +
            ".mapper.BedMapper.selectBed"))})
    List<Patient> selectPatientByDoctorId(@Param("doctor_id") String doctor_id);

    @Select("SELECT * FROM patient")
    List<Patient> selectALLPatient();

    @Insert("INSERT INTO patient(patient_id,resident_id,patient_name,patient_sex,patient_age,address,patient_ph," +
            "register_price,in_time,out_time,host_ex,doctor_id,bed_id) VALUES(#{patient_id},#{resident_id}," +
            "#{patient_name},#{patient_sex},#{patient_age},#{address},#{patient_ph},#{register_price},#{in_time}," +
            "#{out_time},#{host_ex},#{doctor_id},#{bed_id})")
    void insertPatient(Patient patient);
}
