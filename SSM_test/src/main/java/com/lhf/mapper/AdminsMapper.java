package com.lhf.mapper;

import com.lhf.entity.Admins;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminsMapper {
    @Select("SELECT * FROM Admins WHERE admin_name=#{admin_name} AND admin_password=#{admin_password}")
    Admins selectAdmins(@Param("admin_name")String admin_name,@Param("admin_password")String admin_password);

    @Update("UPDATE Admins SET admin_password=#{admin_password} WHERE admin_name=#{admin_name}")
    void updatePassword(@Param("admin_name")String admin_name,@Param("admin_password")String admin_password);
}
