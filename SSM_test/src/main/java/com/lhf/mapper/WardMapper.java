package com.lhf.mapper;

import com.lhf.entity.Ward;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WardMapper {
    @Select("SELECT * FROM ward WHERE ward_id=#{ward_id}")
    Ward selectWard(@Param("ward_id") String ward_id);

    @Select("SELECT * FROM ward")
    List<Ward> selectALLWard();

    @Insert("INSERT INTO ward(ward_id,ward_nurse,bed_num,doctor_id) VALUES(#{ward_id},#{ward_nurse},#{bed_num}," +
            "#{doctor_id})")
    void insertWard(Ward ward);
}
