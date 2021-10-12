/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.jobportal.model;

/**
 *
 * @author Win-10
 */
public class ProviderDTO {

    private int id;
    private String provider_type, aadhar_num, about;

    public ProviderDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProvider_type() {
        return provider_type;
    }

    public void setProvider_type(String provider_type) {
        this.provider_type = provider_type;
    }

    public String getAadhar_num() {
        return aadhar_num;
    }

    public void setAadhar_num(String aadhar_num) {
        this.aadhar_num = aadhar_num;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    @Override
    public String toString() {
        return "ProviderDTO{" + "id=" + id + ", provider_type=" + provider_type + ", aadhar_num=" + aadhar_num + ", about=" + about + '}';
    }

}
