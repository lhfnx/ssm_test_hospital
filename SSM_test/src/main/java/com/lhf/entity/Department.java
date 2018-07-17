package com.lhf.entity;

import java.io.Serializable;

public class Department implements Serializable{
    private String department_id;
    private String department_name;
    private String department_ph;

    public String getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }

    public String getDepartment_name() {
        return department_name;
    }

    public void setDepartment_name(String department_name) {
        this.department_name = department_name;
    }

    public String getDepartment_ph() {
        return department_ph;
    }

    public void setDepartment_ph(String department_ph) {
        this.department_ph = department_ph;
    }

    @Override
    public String toString(){
        return "Department{" + "department_id='" + department_id + ",department_name='" + department_name + "," +
                "department_ph='" + department_ph + "'}";
}
}
