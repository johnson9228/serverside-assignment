package com.serverside.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "employees", schema = "classicmodels")

//Query methods
@NamedQuery(name = "getAllEmployees", query = "SELECT e FROM Employee e")
@NamedQuery(name = "getEmployee", query = "SELECT e FROM Employee e WHERE e.employeeId = :employeeId")

public class Employee {
    @Id
    @Column(name = "employeeNumber", nullable = false, length = 11)
    private Integer employeeId;

    @Column(name = "lastName", nullable = false, length = 50)
    private String lastName;

    @Column(name = "firstName", nullable = false, length = 50)
    private String firstName;

    @Column(name = "extension", nullable = false, length = 10)
    private String extension;

    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Column(name = "officeCode", nullable = false, length = 10)
    private String officeCode;

    @Column(name = "reportsTo", nullable = true, length = 11)
    private Integer reportsTo;

    @Column(name = "jobTitle", nullable = false, length = 50)
    private String jobTitle;

    //Getters and Setters
    public Integer getEmployeeNumber() {
        return employeeId;
    }

    public void setEmployeeNumber(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getOfficeCode() {
        return officeCode;
    }

    public void setOfficeCode(String officeCode) {
        this.officeCode = officeCode;
    }

    public Integer getReportsTo() {
        return reportsTo;
    }

    public void setReportsTo(Integer reportsTo) {
        this.reportsTo = reportsTo;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
}