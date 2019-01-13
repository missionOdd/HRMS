package com.mission.hrms.entity.dto;

import com.mission.hrms.entity.Organization;
import com.mission.hrms.entity.Position;
import lombok.Data;
import lombok.experimental.Accessors;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;

import java.time.LocalDateTime;

/**
 * @author mission
 * @date 2019/1/12 0012-16:56
 */
@Slf4j
@Data
@Accessors(chain = true)
public class ArchQueryDTO {


  private LocalDateTime startTime;//建档时间  当前系统时间


  private LocalDateTime endTime;//建档时间  当前系统时间

  private Long tId;//三级结构id

  private String fName;//一级结构名

  private String sName;//二级结构名

  private String tName;//三级结构名

  private String pType; //职业分类

  private String pJob;  //职位

  private String pWageStandard;  //工薪标准名

  private String pTitle;//职称





  public Organization convertOrganization(){
    Organization organization =new Organization();
    BeanUtils.copyProperties(this,organization);
    log.info("转{}",organization);
    return organization;
  }

  public Position convertPosition(){
    Position position =new Position();
    BeanUtils.copyProperties(this,position);
    log.info("转{}",position);
    return position;
  }

  public ArchQueryDTO convertFor( Organization organization){
    BeanUtils.copyProperties(organization,this);
    log.info("转{}",this);
    return this;
  }

  public ArchQueryDTO convertFor(  Position position){
    BeanUtils.copyProperties(position,this);
    log.info("转{}",this);
    return this;
  }
}
