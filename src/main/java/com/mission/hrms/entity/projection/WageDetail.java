package com.mission.hrms.entity.projection;

import com.mission.hrms.entity.Wage;
import org.springframework.data.rest.core.config.Projection;

import java.time.LocalDateTime;

/**
 * @author mission
 * @date 2019/1/13 0013-10:38
 */
@Projection(name = "wageDetail",types = Wage.class)
public interface WageDetail {

   Long getWId();  //id

   Long getWsNum();  //工薪标准编号
   Double getWReward();  //奖励金
   Double getWFine(); //应扣金额
   Double getWTotal();  //总额

   Integer getWState(); //状态

   LocalDateTime getWCreateTime();//创建时间


   PayArch getEmployee();  //员工
}
