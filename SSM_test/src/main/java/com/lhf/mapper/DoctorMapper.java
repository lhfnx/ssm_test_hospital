package com.lhf.mapper;

import com.lhf.entity.Doctor;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorMapper {
    @Select("SELECT * FROM doctor WHERE doctor_id=#{doctor_id}")
    @Results(value = {@Result(property = "department",column = "department_id",one = @One(select = "com.lhf.mapper" +
            ".DepartmentMapper.selectDepartment"))})
    Doctor selectDoctor(@Param("doctor_id")String doctor_id);

    @Select("SELECT * FROM doctor")
    @Results(value = {@Result(property = "department",column = "department_id",one = @One(select = "com.lhf.mapper" +
            ".DepartmentMapper.selectDepartment"))})
    List<Doctor> selectAllDoctor();

    @Select("SELECT * FROM doctor WHERE department_id=#{department_id}")
    List<Doctor> selectDepartmentMate(@Param("department_id")String department_id);

    @Update("UPDATE doctor SET doctor_name=#{doctor_name},doctor_sex=#{doctor_sex},doctor_age=#{doctor_age}," +
            "doctor_ph=#{doctor_ph},introduction=#{introduction} WHERE doctor_id=#{doctor_id}")
    void updateDoctor(Doctor doctor);

    @Insert("INSERT INTO doctor(doctor_id,doctor_name,doctor_sex,doctor_age,doctor_ph,introduction,department_id) " +
            "VALUES(#{doctor_id},#{doctor_name},#{doctor_sex},#{doctor_age},#{doctor_ph},#{introduction},#{department_id})")
    void insertDoctor(Doctor doctor);
}
