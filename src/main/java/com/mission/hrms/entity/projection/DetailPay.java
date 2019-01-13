package com.mission.hrms.entity.projection;

import com.mission.hrms.entity.PayBills;
import org.springframework.data.rest.core.config.Projection;

import java.time.LocalDateTime;
import java.util.Set;

/**
 * @author mission
 * @date 2019/1/13 0013-10:28
 */
@Projection(name = "detailPay",types = PayBills.class)
public interface DetailPay extends PayBillsList {

  Set<WageDetail> getWages();//各个工单

  String getPbRegistrant(); //登记人

  LocalDateTime getPbCreateDate();  //登记时间
}
