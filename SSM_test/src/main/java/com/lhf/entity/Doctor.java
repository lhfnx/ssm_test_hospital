package com.lhf.entity;

import java.io.Serializable;

public class Doctor implements Serializable {
    private String doctor_id;
    private String doctor_name;
    private String doctor_sex;
    private int doctor_age;
    private String doctor_ph;
    private String introduction;
    private Department department;
    private String department_id;

    public String getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(String doctor_id) {
        this.doctor_id = doctor_id;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getDoctor_sex() {
        return doctor_sex;
    }

    public void setDoctor_sex(String doctor_sex) {
        this.doctor_sex = doctor_sex;
    }

    public int getDoctor_age() {
        return doctor_age;
    }

    public void setDoctor_age(int doctor_age) {
        this.doctor_age = doctor_age;
    }

    public String getDoctor_ph() {
        return doctor_ph;
    }

    public void setDoctor_ph(String doctor_ph) {
        this.doctor_ph = doctor_ph;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }

    @Override
    public String toString() {
        return "Doctor{" + "doctor_id='" + doctor_id + ",doctor_sex='" + doctor_sex + ",doctor_age='" + doctor_age +
                ",doctor_ph='" + doctor_ph + ",introduction='" + introduction + ",department_id='" + department_id +
                "'}";
    }
}
