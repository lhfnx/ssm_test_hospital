package com.lhf.mapper;

import com.lhf.entity.OutHospital;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OutHospitalMapper {
    @Insert("INSERT INTO outhospital(patient_id,submit_date,postscript,stat) VALUES(#{patient_id},CURDATE()," +
            "#{postscript},0)")
    void insertOutHospital(@Param("patient_id")String patient_id,@Param("postscript")String postscript);

    @Select("SELECT * FROM outhospital ORDER BY count_id")
    List<OutHospital> selectAllOutHospital();

    @Update("UPDATE outhospital SET stat=#{stat} WHERE count_id=#{count_id}")
    void updateOutHospital(@Param("count_id")int count_id,@Param("stat")int stat);
}
