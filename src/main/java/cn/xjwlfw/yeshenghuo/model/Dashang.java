package cn.xjwlfw.yeshenghuo.model;

import java.math.BigDecimal;

public class Dashang {
    private Integer id;
    
    private Integer weishangqiangId;

    private String name;

    private String img;

    private String video;

    private Short duration;

    private BigDecimal price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getWeishangqiangId() {
		return weishangqiangId;
	}

	public void setWeishangqiangId(Integer weishangqiangId) {
		this.weishangqiangId = weishangqiangId;
	}

	public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public Short getDuration() {
        return duration;
    }

    public void setDuration(Short duration) {
        this.duration = duration;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}