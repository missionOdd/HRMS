package com.mission.hrms.entity.projection;

import com.mission.hrms.entity.Organization;
import com.mission.hrms.entity.PayBills;
import org.springframework.data.rest.core.config.Projection;

/**
 * @author mission
 * @date 2019/1/13 0013-10:22
 */
@Projection(name = "payBillsList",types = PayBills.class)
public interface PayBillsList {

   Long getPbId();  //id

   Integer getPbEmSum();  //人数
  Double getPbTotal();  //总额
   Double getPbRealTotal();  //实发金额



  Integer getPbState();  //状态,未支付0,已支付1



  Organization getOrg();  //机构
}
