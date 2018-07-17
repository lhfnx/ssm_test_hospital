package com.lhf.entity;

import java.io.Serializable;

public class Bed implements Serializable{
    private String bed_id;
    private int bed_stat;
    private String ward_id;
    private Ward ward;

    public String getBed_id() {
        return bed_id;
    }

    public void setBed_id(String bed_id) {
        this.bed_id = bed_id;
    }

    public int getBed_stat() {
        return bed_stat;
    }

    public void setBed_stat(int bed_stat) {
        this.bed_stat = bed_stat;
    }

    public String getWard_id() {
        return ward_id;
    }

    public void setWard_id(String ward_id) {
        this.ward_id = ward_id;
    }

    public Ward getWard() {
        return ward;
    }

    public void setWard(Ward ward) {
        this.ward = ward;
    }

    @Override
    public String toString(){
        return "Bed{" + "bed_id='" + bed_id + ",bed_stat='" + bed_stat + ",ward_id='" + ward_id + "'}";
    }
}
