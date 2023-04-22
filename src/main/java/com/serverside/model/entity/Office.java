package com.serverside.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "offices", schema = "classicmodels")
@NamedQuery(name="Office.getAllOffice", query = "SELECT e FROM Office e")
@NamedQuery(name="Office.getOffice", query = "SELECT e FROM Office e WHERE e.officeId = :officeId")

public class Office {
    @Id
    @Column(name = "officecode", nullable = false, length = 10)
    private Integer officeId;

    @Column(name = "city", nullable = false, length = 50)
    private String city;

    @Column(name = "phone", nullable = false, length = 50)
    private String phone;

    @Column(name = "addressLine1", nullable = false, length = 50)
    private String addressLine1;

    @Column(name = "addressLine2", length = 50)
    private String addressLine2;

    @Column(name = "state", length = 50)
    private String state;

    @Column(name = "country", nullable = false, length = 50)
    private String country;

    @Column(name = "postalCode", nullable = false, length = 15)
    private String postalCode;

    @Column(name = "territory", nullable = false, length = 10)
    private String territory;

    public String getTerritory() {
        return territory;
    }

    public void setTerritory(String territory) {
        this.territory = territory;
    }

    public String getPostalcode() {
        return postalCode;
    }

    public void setPostalcode(String postalcode) {
        this.postalCode = postalcode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddressline2() {
        return addressLine2;
    }

    public void setAddressline2(String addressline2) {
        this.addressLine2 = addressline2;
    }

    public String getAddressline1() {
        return addressLine1;
    }

    public void setAddressline1(String addressline1) {
        this.addressLine1 = addressline1;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getId() {
        return officeId;
    }

    public void setId(Integer officeId) {
        this.officeId = officeId;
    }
}