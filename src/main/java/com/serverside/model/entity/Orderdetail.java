package com.serverside.model.entity;

import javax.persistence.*;

@Entity
@Table(name = "orderdetails", schema = "classicmodels")
@NamedQuery(name = "Orderdetail.findbyId", query = "SELECT od FROM Orderdetail od WHERE od.id.ordernumber = :id AND od.id.productcode = :ID")
@NamedQuery(name = "Orderdetail.findAll", query = "SELECT od FROM Orderdetail od ")
public class Orderdetail {

    @EmbeddedId
    private OrderdetailId id;

    @MapsId("ordernumber")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "ordernumber", nullable = false)
    private Order ordernumber;

    @MapsId("productcode")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "productcode", nullable = false)
    private Product productcode;

    @Column(name = "quantityordered", nullable = false)
    private Integer quantityordered;

    @Column(name = "priceeach", nullable = false)
    private double priceeach;

    @Column(name = "orderlinenumber", nullable = false)
    private Integer orderlinenumber;

    public Integer getOrderlinenumber() {
        return orderlinenumber;
    }

    public void setOrderlinenumber(Integer orderlinenumber) {
        this.orderlinenumber = orderlinenumber;
    }

    public double getPriceeach() {
        return priceeach;
    }

    public void setPriceeach(Double priceeach) {
        this.priceeach = priceeach;
    }

    public Integer getQuantityordered() {
        return quantityordered;
    }

    public void setQuantityordered(Integer quantityordered) {
        this.quantityordered = quantityordered;
    }

    public Product getProductcode() {return productcode;
    }

    public void setProductcode(Product productcode) {
        this.productcode = productcode;
    }

    public Order getOrdernumber() {return ordernumber;
    }

    public void setOrdernumber(Order ordernumber) {
        this.ordernumber = ordernumber;
    }

    public OrderdetailId getId() {
        return id;
    }

    public void setId(OrderdetailId id) {
        this.id = id;
    }
}