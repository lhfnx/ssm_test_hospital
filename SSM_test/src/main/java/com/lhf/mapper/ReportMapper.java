package com.lhf.mapper;

import com.lhf.entity.Report;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportMapper {
    @Select("SELECT * FROM report WHERE patient_id=#{patient_id}")
    @Results(value = {@Result(property = "department",column = "department_id",one = @One(select = "com.lhf.mapper" +
            ".DepartmentMapper.selectDepartment")),@Result(property = "patient",column = "patient_id",one = @One(select =
            "com.lhf.mapper.PatientMapper.selectPatient"))})
    Report selectReportByPatientId(@Param("patient_id")String patient_id);

    @Insert("INSERT INTO report(report_id,create_time,report_detail,report_ex,department_id,patient_id) VALUES" +
            "(#{report_id},#{create_time},#{report_detail},#{report_ex},#{department_id},#{patient_id})")
    void insertReport(Report report);
}
