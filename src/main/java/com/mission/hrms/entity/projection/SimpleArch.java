package com.mission.hrms.entity.projection;

import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.Organization;
import com.mission.hrms.entity.Position;
import org.springframework.data.rest.core.config.Projection;

/**
 * @author mission
 * @date 2019/1/12 0012-16:45
 */
@Projection(name = "simpleArch",types = Employee.class)
public interface SimpleArch {

  Long getEmId();

  Long getEmArchNum();

  String getEmName();

  String getEmGender();

  Organization getOrg();

  Position getPosition();
}
