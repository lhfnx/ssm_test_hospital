package com.lhf.entity;

import java.io.Serializable;
import java.util.Date;

public class OutHospital implements Serializable {
    private int count_id;
    private String patient_id;
    private Patient patient;
    private Date submit_date;
    private String postscript;
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

    public Date getSubmit_date() {
        return submit_date;
    }

    public void setSubmit_date(Date submit_date) {
        this.submit_date = submit_date;
    }

    public String getPostscript() {
        return postscript;
    }

    public void setPostscript(String postscript) {
        this.postscript = postscript;
    }

    public int getStat() {
        return stat;
    }

    public void setStat(int stat) {
        this.stat = stat;
    }

    @Override
    public String toString() {
        return "OutHospital{" + "count_id='" + count_id + ",patient_id='" + patient_id + "," + "submit_date='" +
                submit_date + ",postscript='" + postscript + ",stat='" + stat + "'}";
    }
}
