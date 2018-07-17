package com.lhf.mapper;

import com.lhf.entity.History;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HistoryMapper {
    @Select("SELECT * FROM history WHERE resident_id=#{resident_id}")
    List<History> selectHistory(@Param("resident_id")String resident_id);
}
