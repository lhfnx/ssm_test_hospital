package com.lhf.entity;

import java.io.Serializable;

public class Admins implements Serializable {
    private String admin_name;
    private String admin_password;

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public String getAdmin_password() {
        return admin_password;
    }

    public void setAdmin_password(String admin_password) {
        this.admin_password = admin_password;
    }

    @Override
    public String toString(){
        return "Admins{" + "admin_name='" + admin_name + ",admin_password='" + admin_password + "'}";
    }
}
