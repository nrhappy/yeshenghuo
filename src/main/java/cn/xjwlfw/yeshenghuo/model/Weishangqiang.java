package cn.xjwlfw.yeshenghuo.model;

import java.util.Date;

public class Weishangqiang {
    private Integer id;

    private String pause;

    private String name;

    private String qrcode;

    private String location;

    private String title;

    private String bgUrl;

    private String stopWords;

    private String accessAccount;

    private Date createTime;

    private String bigScreenUrl;

    private String mobileScreenUrl;
    
    private String fontSize;

    private Byte available;
    
    private String mobileURL;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPause() {
		return pause;
	}

	public void setPause(String pause) {
		this.pause = pause;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getQrcode() {
		return qrcode;
	}

	public void setQrcode(String qrcode) {
		this.qrcode = qrcode;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBgUrl() {
		return bgUrl;
	}

	public void setBgUrl(String bgUrl) {
		this.bgUrl = bgUrl;
	}

	public String getStopWords() {
		return stopWords;
	}

	public void setStopWords(String stopWords) {
		this.stopWords = stopWords;
	}

	public String getAccessAccount() {
		return accessAccount;
	}

	public void setAccessAccount(String accessAccount) {
		this.accessAccount = accessAccount;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getBigScreenUrl() {
		return bigScreenUrl;
	}

	public void setBigScreenUrl(String bigScreenUrl) {
		this.bigScreenUrl = bigScreenUrl;
	}

	public String getMobileScreenUrl() {
		return mobileScreenUrl;
	}

	public void setMobileScreenUrl(String mobileScreenUrl) {
		this.mobileScreenUrl = mobileScreenUrl;
	}

	public String getFontSize() {
		return fontSize;
	}

	public void setFontSize(String fontSize) {
		this.fontSize = fontSize;
	}

	public Byte getAvailable() {
		return available;
	}

	public void setAvailable(Byte available) {
		this.available = available;
	}

	public String getMobileURL() {
		return mobileURL;
	}

	public void setMobileURL(String mobileURL) {
		this.mobileURL = mobileURL;
	}
	
}