package com.lhf.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Patient implements Serializable {
    private String patient_id;
    private String resident_id;
    private String patient_name;
    private String patient_sex;
    private int patient_age;
    private String address;
    private String patient_ph;
    private double register_price;
    private Timestamp in_time;
    private Timestamp out_time;
    private double host_ex;
    private String doctor_id;
    private Doctor doctor;
    private String bed_id;
    private Bed bed;

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public String getResident_id() {
        return resident_id;
    }

    public void setResident_id(String resident_id) {
        this.resident_id = resident_id;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPatient_ph() {
        return patient_ph;
    }

    public void setPatient_ph(String patient_ph) {
        this.patient_ph = patient_ph;
    }

    public double getRegister_price() {
        return register_price;
    }

    public void setRegister_price(double register_price) {
        this.register_price = register_price;
    }

    public Timestamp getIn_time() {
        return in_time;
    }

    public void setIn_time(Timestamp in_time) {
        this.in_time = in_time;
    }

    public Timestamp getOut_time() {
        return out_time;
    }

    public void setOut_time(Timestamp out_time) {
        this.out_time = out_time;
    }

    public double getHost_ex() {
        return host_ex;
    }

    public void setHost_ex(double host_ex) {
        this.host_ex = host_ex;
    }

    public String getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(String doctor_id) {
        this.doctor_id = doctor_id;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getBed_id() {
        return bed_id;
    }

    public void setBed_id(String bed_id) {
        this.bed_id = bed_id;
    }

    public Bed getBed() {
        return bed;
    }

    public void setBed(Bed bed) {
        this.bed = bed;
    }

    @Override
    public String toString() {
        return "Patient{" + "patient_id='" + patient_id + ",resident_id='" + resident_id + ",patient_name='" +
                patient_name + ",patient_sex='" + patient_sex + ",patient_age='" + patient_age + ",address='" +
                address + ",patient_ph='" + patient_ph + ",register_price='" + register_price + ",in_time='" +
                in_time + ",out_time='" + out_time + ",host_ex='" + host_ex + ",doctor_id='" + doctor_id + "," +
                "bed_id='" + bed_id + "'}";
    }
}
