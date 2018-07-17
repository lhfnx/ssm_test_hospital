package com.lhf.entity;

import java.io.Serializable;
import java.util.Date;

public class History implements Serializable {
    private int count_id;
    private String patient_name;
    private String resident_id;
    private String patient_sex;
    private int patient_age;
    private String patient_ph;
    private Date in_time;
    private Date out_time;
    private String doctor_name;
    private String bed_id;

    public int getCount_id() {
        return count_id;
    }

    public void setCount_id(int count_id) {
        this.count_id = count_id;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getResident_id() {
        return resident_id;
    }

    public void setResident_id(String resident_id) {
        this.resident_id = resident_id;
    }

    public String getPatient_sex() {
        return patient_sex;
    }

    public void setPatient_sex(String patient_sex) {
        this.patient_sex = patient_sex;
    }

    public int getPatient_age() {
        return patient_age;
    }

    public void setPatient_age(int patient_age) {
        this.patient_age = patient_age;
    }

    public String getPatient_ph() {
        return patient_ph;
    }

    public void setPatient_ph(String patient_ph) {
        this.patient_ph = patient_ph;
    }

    public Date getIn_time() {
        return in_time;
    }

    public void setIn_time(Date in_time) {
        this.in_time = in_time;
    }

    public Date getOut_time() {
        return out_time;
    }

    public void setOut_time(Date out_time) {
        this.out_time = out_time;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getBed_id() {
        return bed_id;
    }

    public void setBed_id(String bed_id) {
        this.bed_id = bed_id;
    }

    @Override
    public String toString() {
        return "History{" + "count_id='" + count_id + ",patient_name='" + patient_name + ",resident_id='" +
                resident_id + ",patient_sex='" + patient_sex + ",patient_age='" + patient_age + ",patient_ph='" +
                patient_ph + ",in_time='" + in_time + ",out_time='" + out_time + ",doctor_name='" +
                doctor_name + ",bed_id='" + bed_id + "'}";
    }
}
