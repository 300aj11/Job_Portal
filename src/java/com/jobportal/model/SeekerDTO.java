/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.model;

import java.sql.ResultSet;

/**
 *
 * @author Win-10
 */
public class SeekerDTO {

    private int id;
    private String skill, aadhar_num, higher_que, document;
    ResultSet rs;

    public SeekerDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getAadhar_num() {
        return aadhar_num;
    }

    public void setAadhar_num(String aadhar_num) {
        this.aadhar_num = aadhar_num;
    }

    public String getHigher_que() {
        return higher_que;
    }

    public void setHigher_que(String higher_que) {
        this.higher_que = higher_que;
    }

    public String getDocument() {
        return document;
    }

    public void setDocument(String document) {
        this.document = document;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    @Override
    public String toString() {
        return "SeekerDTO{" + "id=" + id + ", skill=" + skill + ", aadhar_num=" + aadhar_num + ", higher_que=" + higher_que + ", document=" + document + ", rs=" + rs + '}';
    }
    

}
