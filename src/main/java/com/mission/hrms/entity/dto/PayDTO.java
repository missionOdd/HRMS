package com.mission.hrms.entity.dto;

import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;

/**
 * @author mission
 * @date 2019/1/13 0013-11:31
 */
@Slf4j
@Data
@Accessors(chain = true)
public class PayDTO {


  private Long pbId;  //id

  private Integer pbEmSum;  //人数
  private Double pbTotal;  //总额
  private Double pbRealTotal;  //实发金额
  private String pbRegistrant; //登记人

  private LocalDateTime pbCreateDate;  //登记时间

  private Integer pbState;  //状态,未支付0,已支付1

}
