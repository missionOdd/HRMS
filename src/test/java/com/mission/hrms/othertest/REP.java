package com.mission.hrms.othertest;

import com.mission.hrms.HrmsApplicationTests;
import com.mission.hrms.entity.Position;
import com.mission.hrms.entity.projection.WageStandArch;
import com.mission.hrms.repository.EmployeeRepository;
import com.mission.hrms.repository.PositionRepository;
import com.mission.hrms.service.WageStandardService;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author mission
 * @date 2019/1/13 0013-1:08
 */
public class REP extends HrmsApplicationTests {

  @Resource
  private PositionRepository positionRepository;
  @Resource
  private EmployeeRepository employeeRepository;

  @Resource
  private WageStandardService wageStandardService;
  @Test
  public void testfind(){
   List<Position> positions = positionRepository.findByPWageStandardLike("%3%");
   if (positions==null){
     System.out.println("null-------");
   }
   positions.forEach(x-> {System.out.println(x.toString());
   List<WageStandArch> simpleArchList= employeeRepository.findByPosition(x);
   simpleArchList.stream().forEach(y-> System.out.println(y.getEmName()));
   });

    List<WageStandArch> simpleArchList=employeeRepository.findByPositionIn(positions);
    simpleArchList.stream().forEach(y-> System.out.println(y.getWageStandard()));
  }

  @Test
  public void testbind() {

    wageStandardService.bind();
  }
}
