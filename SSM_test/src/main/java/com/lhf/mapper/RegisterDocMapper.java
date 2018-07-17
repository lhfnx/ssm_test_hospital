package com.lhf.mapper;

import com.lhf.entity.RegisterDoc;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegisterDocMapper {
    @Select("SELECT * FROM register_doc WHERE patient_id=#{patient_id} ORDER BY count_id")
    @Results(value = {@Result(property = "doctor",column = "doctor_id",one = @One(select = "com.lhf.mapper" +
            ".DoctorMapper.selectDoctor"))})
    List<RegisterDoc> selectRegisterDoc(@Param("patient_id")String patient_id);

    @Insert("INSERT INTO register_doc(patient_id,doctor_id,submit_date,stat) VALUES(#{patient_id},#{doctor_id}," +
            "CURDATE(),0)")
    void insertRegisterDoc(@Param("patient_id")String patient_id,@Param("doctor_id")String doctor_id);

    @Select("SELECT * FROM register_doc WHERE doctor_id=#{doctor_id} ORDER BY count_id")
    List<RegisterDoc> selectRegisterDocByDoctorId(@Param("doctor_id")String doctor_id);

    @Update("UPDATE register_doc SET stat=#{stat} WHERE count_id=#{count_id}")
    void updateRegisterDoc(@Param("count_id")int count_id,@Param("stat")int stat);
}
