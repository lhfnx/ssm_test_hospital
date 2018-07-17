package com.lhf.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Prescribe implements Serializable {
    private String prescribe_id;
    private String prescribe_detail;
    private Timestamp create_time;
    private double treat_ex;
    private String doctor_id;
    private Doctor doctor;
    private String patient_id;
    private Patient patient;

    public String getPrescribe_id() {
        return prescribe_id;
    }

    public void setPrescribe_id(String prescribe_id) {
        this.prescribe_id = prescribe_id;
    }

    public String getPrescribe_detail() {
        return prescribe_detail;
    }

    public void setPrescribe_detail(String prescribe_detail) {
        this.prescribe_detail = prescribe_detail;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public double getTreat_ex() {
        return treat_ex;
    }

    public void setTreat_ex(double treat_ex) {
        this.treat_ex = treat_ex;
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

    @Override
    public String toString() {
        return "Prescribe{" + "prescribe_id='" + prescribe_id + ",prescribe_detail='" + prescribe_detail + "," +
                "create_time='" + create_time + ",treat_ex='" + treat_ex + ",doctor_id='" + doctor_id + "," +
                "patient_id='" + patient_id + "'}";
    }
}
