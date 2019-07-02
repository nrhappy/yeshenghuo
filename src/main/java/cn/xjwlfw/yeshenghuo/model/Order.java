package cn.xjwlfw.yeshenghuo.model;

import java.math.BigDecimal;
import java.util.Date;

public class Order {
    private String id;

    private Integer wechatUserId;

    private Integer businessId;

    private String businessName;
    
    private String wechatName;

    private Integer agencyId;
    
    private String agencyName;

    private Short goodsType;

    private Integer goodsId;

    private String goodsSummary;

    private BigDecimal amount;

    private BigDecimal businessIncome;

    private BigDecimal agencyIncome;

    private BigDecimal corporationIncome;

    private Short status;

    private Date createTime;

    private Date updateTime;

    private String notes;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Integer getWechatUserId() {
		return wechatUserId;
	}

	public void setWechatUserId(Integer wechatUserId) {
		this.wechatUserId = wechatUserId;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getWechatName() {
		return wechatName;
	}

	public void setWechatName(String wechatName) {
		this.wechatName = wechatName;
	}

	public Integer getAgencyId() {
		return agencyId;
	}

	public void setAgencyId(Integer agencyId) {
		this.agencyId = agencyId;
	}

	public String getAgencyName() {
		return agencyName;
	}

	public void setAgencyName(String agencyName) {
		this.agencyName = agencyName;
	}

	public Short getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(Short goodsType) {
		this.goodsType = goodsType;
	}

	public Integer getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsSummary() {
		return goodsSummary;
	}

	public void setGoodsSummary(String goodsSummary) {
		this.goodsSummary = goodsSummary;
	}

	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public BigDecimal getBusinessIncome() {
		return businessIncome;
	}

	public void setBusinessIncome(BigDecimal businessIncome) {
		this.businessIncome = businessIncome;
	}

	public BigDecimal getAgencyIncome() {
		return agencyIncome;
	}

	public void setAgencyIncome(BigDecimal agencyIncome) {
		this.agencyIncome = agencyIncome;
	}

	public BigDecimal getCorporationIncome() {
		return corporationIncome;
	}

	public void setCorporationIncome(BigDecimal corporationIncome) {
		this.corporationIncome = corporationIncome;
	}

	public Short getStatus() {
		return status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}
}