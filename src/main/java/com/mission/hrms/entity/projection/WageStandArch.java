package com.mission.hrms.entity.projection;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.WageStandard;
import org.springframework.data.rest.core.config.Projection;

/**
 * @author mission
 * @date 2019/1/13 0013-1:56
 */
@Projection(name = "wsArch",types = Employee.class)
public interface WageStandArch extends SimpleArch{

  WageStandard getWageStandard();
}
