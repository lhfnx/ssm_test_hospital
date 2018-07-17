package com.lhf.entity;

import java.io.Serializable;

public class Ward implements Serializable {
    private String ward_id;
    private String ward_nurse;
    private int bed_num;
    private String doctor_id;
    private Doctor doctor;

    public String getWard_id() {
        return ward_id;
    }

    public void setWard_id(String ward_id) {
        this.ward_id = ward_id;
    }

    public String getWard_nurse() {
        return ward_nurse;
    }

    public void setWard_nurse(String ward_nurse) {
        this.ward_nurse = ward_nurse;
    }

    public int getBed_num() {
        return bed_num;
    }

    public void setBed_num(int bed_num) {
        this.bed_num = bed_num;
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

    @Override
    public String toString() {
        return "Ward{" + "ward_id='" + ward_id + ",ward_nurse='" + ward_nurse + ",bed_num='" + bed_num + "," +
                "doctor_id='" + doctor_id + "'}";
    }
}
