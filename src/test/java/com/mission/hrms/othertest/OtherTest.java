package com.mission.hrms.othertest;

import com.mission.hrms.HrmsApplicationTests;
import com.mission.hrms.entity.Employee;
import com.mission.hrms.entity.dto.ArchiveDTO;
import org.junit.Test;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneOffset;

/**
 * @author mission
 * @date 2019/1/11 0011-17:01
 */
public class OtherTest extends HrmsApplicationTests {

  @Test
  public void testCovert(){
    ArchiveDTO archiveDTO =new ArchiveDTO()
    .setEmArchNum(1L)
    .setEmName("小华")
    .setEmAge(1)
    .setEmGender("男")
    .setEmEmail("11111111@qq.com")
    .setEmPhone(13456545521L)
    .setEmQQ(0L)
    .setEmpTelphone(0L)
    .setEmAddress("广东海洋")
    .setEmPostCode(0)
    .setEmNationality("中国")
    .setEmBirthPlace("湛江")
    .setEmBirthday(LocalDate.now())
    .setEmNation("汉族")
    .setEmFaith("哈哈")
    .setEmEduBg("什么东西")
    .setEmPoliticalStatus("")
    .setEmIdCard(0L)
    .setEmSSN(0L)
    .setEmYearsOfEdu("")
    .setEmMajor("计算机")
    .setEmBank("不不不不不")
    .setEmBankAccount(0L)
    .setEmSkill("碎尸碎尸")
    .setEmHobby("呜呜呜呜呜呜")
    .setEmResume("啊啊啊啊啊")
    .setEmFamilyRelation("的娃娃单位等我")
    .setEmRemark("")
    .setEmRegistrant("")
    .setEmCreateTime(LocalDateTime.now())
    .setEmState(0)
    .setEmImgPath("")
    .setTId(0L)
    .setFName("哈哈哈")
    .setSName("呼呼呼")
    .setTName("阿拉蕾")
    .setPType("www")
    .setPJob("草草草丛")
    .setPWageStandard("自制自制")
    .setPTitle("嘻嘻嘻嘻嘻");

    Employee employee=archiveDTO.convertEmployee();
    System.out.println(archiveDTO);
    System.out.println(employee);
    employee.setEmAddress(null).setEmBank(null);
    ArchiveDTO aFor=archiveDTO.convertFor(employee);
    System.out.println(aFor);
    System.out.println( LocalDateTime.now().toInstant(ZoneOffset.of("+8")).toEpochMilli());

  }
}
