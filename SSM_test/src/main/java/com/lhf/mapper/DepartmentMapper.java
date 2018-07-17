package com.lhf.mapper;

import com.lhf.entity.Department;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentMapper {
    @Select("SELECT * FROM department WHERE department_id=#{department_id}")
    Department selectDepartment(@Param("department_id") String department_id);

    @Select("SELECT * FROM department")
    List<Department> selectAllDepartment();

    @Insert("INSERT INTO department(department_id,department_name,department_ph) VALUES(#{department_id}," +
            "#{department_name},#{department_ph})")
    void insertDepartment(Department department);
}
