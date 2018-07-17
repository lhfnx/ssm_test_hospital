package com.lhf.mapper;

import com.lhf.entity.Prescribe;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
public interface PrescribeMapper {
    @Select("SELECT * FROM prescribe WHERE patient_id=#{patient_id}")
    @Results(value = {@Result(property = "doctor",column = "doctor_id",one = @One(select = "com.lhf.mapper" +
            ".DoctorMapper.selectDoctor")),@Result(property = "patient",column = "patient_id",one = @One(select =
            "com.lhf.mapper.PatientMapper.selectPatient"))})
    Prescribe selectPrescribeByPatientId(@Param("patient_id")String patient_id);

    @Update("UPDATE prescribe SET prescribe_detail=#{prescribe_detail} WHERE prescribe_id=#{prescribe_id}")
    void updatePrescribe(@Param("prescribe_id")String prescribe_id,@Param("prescribe_detail")String prescribe_detail);

    @Insert("INSERT INTO prescribe(prescribe_id,prescribe_detail,create_time,treat_ex,doctor_id,patient_id) VALUES" +
            "(#{prescribe_id},#{prescribe_detail},#{create_time},#{treat_ex},#{doctor_id},#{patient_id})")
    void insertPrescribe(Prescribe prescribe);
}
