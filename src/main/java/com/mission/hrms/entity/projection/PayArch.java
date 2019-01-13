package com.mission.hrms.entity.projection;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.WageStandard;
import org.springframework.data.rest.core.config.Projection;

/**
 * @author mission
 * @date 2019/1/13 0013-10:44
 */
@Projection(name = "payArch",types = Employee.class)
public interface PayArch {

  Long getEmId();

  Long getEmArchNum();

  String getEmName();

  String getEmGender();

  WageStandard getWageStandard();
}
