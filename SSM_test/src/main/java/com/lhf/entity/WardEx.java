package com.lhf.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class WardEx implements Serializable {
    private int count_id;
    private String patient_id;
    private Patient patient;
    private Timestamp submit_date;
    private String o_bed_id;
    private String bed_id;
    private Bed bed;
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

    public Timestamp getSubmit_date() {
        return submit_date;
    }

    public void setSubmit_date(Timestamp submit_date) {
        this.submit_date = submit_date;
    }

    public String getO_bed_id() {
        return o_bed_id;
    }

    public void setO_bed_id(String o_bed_id) {
        this.o_bed_id = o_bed_id;
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

    public int getStat() {
        return stat;
    }

    public void setStat(int stat) {
        this.stat = stat;
    }

    @Override
    public String toString() {
        return "WardEx{" + "count_id='" + count_id + ",patient_id='" + patient_id + "," + "submit_date='" +
                submit_date + ",o_bed_id='" + o_bed_id + ",bed_id='" + bed_id + ",stat='" + stat + "'}";
    }
}
