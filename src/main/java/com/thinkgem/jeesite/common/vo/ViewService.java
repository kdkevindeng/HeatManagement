package com.thinkgem.jeesite.common.vo;

import java.util.List;

/**
 * Created by lizhi on 2017/11/17.
 */
public interface ViewService<VO,DTO> {
    VO dto2vo(DTO dto);
    List<VO> dtoList2voList(List<DTO> dtoList);
}
