package com.serverside.model.entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "payments", schema = "classicmodels")
@NamedQuery(name="Payment.findAll", query = "SELECT p FROM Payment p")
@NamedQuery(name="Payment.findbyId", query = "SELECT p FROM Payment p WHERE p.id.checknumber = :checkNumber AND p.id.customernumber=:customerNumber")
public class Payment {
    @EmbeddedId
    private PaymentId id;

    @MapsId("customernumber")
    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "customernumber", nullable = false)
    private Customer customernumber;

    @Column(name = "paymentdate", nullable = false, length = 10)
    private String paymentdate;

    @Column(name = "amount", nullable = false, precision = 8, scale = 2)
    private BigDecimal amount;

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getPaymentdate() {
        return paymentdate;
    }

    public void setPaymentdate(String paymentdate) {
        this.paymentdate = paymentdate;
    }

    public Customer getCustomernumber() {
        return customernumber;
    }

    public void setCustomernumber(Customer customernumber) {
        this.customernumber = customernumber;
    }

    public PaymentId getId() {
        return id;
    }

    public void setId(PaymentId id) {
        this.id = id;
    }
}