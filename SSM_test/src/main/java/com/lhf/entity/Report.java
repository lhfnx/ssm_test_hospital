package com.lhf.entity;

import java.io.Serializable;
import java.util.Date;

public class Report implements Serializable {
    private String report_id;
    private Date create_time;
    private String report_detail;
    private double report_ex;
    private String department_id;
    private Department department;
    private String patient_id;
    private Patient patient;

    public String getReport_id() {
        return report_id;
    }

    public void setReport_id(String report_id) {
        this.report_id = report_id;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public String getReport_detail() {
        return report_detail;
    }

    public void setReport_detail(String report_detail) {
        this.report_detail = report_detail;
    }

    public double getReport_ex() {
        return report_ex;
    }

    public void setReport_ex(double report_ex) {
        this.report_ex = report_ex;
    }

    public String getDepartment_id() {
        return department_id;
    }

    public void setDepartment_id(String department_id) {
        this.department_id = department_id;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
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
        return "Report{" + "report_id='" + report_id + ",create_time='" + create_time + "," + "report_detail='" +
                report_detail + ",report_ex='" + report_ex + ",department_id='" + department_id + "," +
                "patient_id='" + patient_id + "'}";
    }
}
