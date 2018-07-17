package com.lhf.mapper;

import com.lhf.entity.Bed;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BedMapper {
    @Select("SELECT * FROM bed WHERE bed_id=#{bed_id}")
    Bed selectBed(@Param("bed_id")String bed_id);

    @Select("SELECT * FROM bed WHERE bed_stat=1")
    List<Bed> selectAllFreeBed();
}
