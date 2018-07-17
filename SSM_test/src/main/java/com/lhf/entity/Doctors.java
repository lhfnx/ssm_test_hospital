package com.lhf.entity;

import java.io.Serializable;

public class Doctors implements Serializable {
    private String doctor_username;
    private String doctor_password;

    public String getDoctor_username() {
        return doctor_username;
    }

    public void setDoctor_username(String doctor_username) {
        this.doctor_username = doctor_username;
    }

    public String getDoctor_password() {
        return doctor_password;
    }

    public void setDoctor_password(String doctor_password) {
        this.doctor_password = doctor_password;
    }

    @Override
    public String toString(){
        return "Doctors{" + "doctor_username='" + doctor_username + ",doctor_password='" + doctor_password + "'}";
    }
}
