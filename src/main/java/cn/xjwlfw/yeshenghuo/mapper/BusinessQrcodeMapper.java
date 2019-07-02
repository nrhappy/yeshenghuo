package cn.xjwlfw.yeshenghuo.mapper;

import cn.xjwlfw.yeshenghuo.model.BusinessQrcode;

public interface BusinessQrcodeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BusinessQrcode record);

    int insertSelective(BusinessQrcode record);

    BusinessQrcode selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BusinessQrcode record);

    int updateByPrimaryKey(BusinessQrcode record);
    
    BusinessQrcode selectByPrimarySceneId(Integer sceneId);
    
    String queryMaxSceneId();
}