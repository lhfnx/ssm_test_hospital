package com.lhf.mapper;

import com.lhf.entity.WardEx;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WardExMapper {
    @Select("SELECT * FROM ward_ex WHERE patient_id=#{patient_id}")
    @Results(value = {@Result(property = "bed", column = "bed_id", one = @One(select = "com.lhf.mapper.BedMapper" +
            ".selectBed"))})
    List<WardEx> selectWardEx(@Param("patient_id") String patient_id);

    @Insert("INSERT INTO ward_ex(patient_id,submit_date,o_bed_id,bed_id,stat) VALUES(#{patient_id},CURDATE()," +
            "#{o_bed_id},#{bed_id},0)")
    void insertWardEx(@Param("patient_id")String patient_id,@Param("o_bed_id")String o_bed_id,@Param("bed_id")String
            bed_id);

    @Select("SELECT * FROM ward_ex ORDER BY count_id")
    List<WardEx> selectAllWardEx();

    @Update("UPDATE ward_ex SET stat=#{stat} WHERE count_id=#{count_id}")
    void updateWardEx(@Param("count_id")int count_id,@Param("stat")int stat);
}
