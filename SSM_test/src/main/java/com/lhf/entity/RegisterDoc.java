package com.lhf.entity;

import java.io.Serializable;
import java.util.Date;

public class RegisterDoc implements Serializable {
    private int count_id;
    private String patient_id;
    private Patient patient;
    private String doctor_id;
    private Doctor doctor;
    private Date submit_date;
    private int stat;

    public int getCount_id() {
        return count_id;
    }

    public void setCount_id(int count_id) {
        this.count_id = count_id;
    }

    public String getPatient_id() {
        return patient_id;
    }

    public void setPatient_id(String patient_id) {
        this.patient_id = patient_id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
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

    public Date getSubmit_date() {
        return submit_date;
    }

    public void setSubmit_date(Date submit_date) {
        this.submit_date = submit_date;
    }

    public int getStat() {
        return stat;
    }

    public void setStat(int stat) {
        this.stat = stat;
    }

    @Override
    public String toString() {
        return "RegisterDoc{" + "count_id='" + count_id + ",patient_id='" + patient_id + "," + "doctor_id='" +
                doctor_id + ",submit_date='" + submit_date + ",stat='" + stat + "'}";
    }
}
