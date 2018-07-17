package com.lhf.mapper;

import com.lhf.entity.Users;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersMapper {
    @Select("SELECT * FROM Users WHERE username=#{username} AND password=#{password}")
    Users selectUsers(@Param("username")String username,@Param("password")String password);

    @Update("UPDATE Users SET password=#{password} WHERE username=#{username}")
    void updatePassword(@Param("username")String username,@Param("password")String password);

}
