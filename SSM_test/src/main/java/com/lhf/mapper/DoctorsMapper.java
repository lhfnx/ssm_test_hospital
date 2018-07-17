package com.lhf.mapper;

import com.lhf.entity.Doctors;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface DoctorsMapper {
    @Select("SELECT * FROM Doctors WHERE doctor_username=#{doctor_username} AND doctor_password=#{doctor_password}")
    Doctors selectDoctors(@Param("doctor_username")String doctor_username,@Param("doctor_password")String doctor_password);

    @Update("UPDATE doctors SET doctor_password=#{doctor_password} WHERE doctor_username=#{doctor_username}")
    void updatePassword(@Param("doctor_username")String doctor_username,@Param("doctor_password")String doctor_password);
}
