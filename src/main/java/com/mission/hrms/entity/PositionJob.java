package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;

/**
 * @author mission
 * @date 2019/1/10 0010-16:50
 */
@Entity
@Table(name = "position_job")
//Lombok
@Data
@Accessors(chain = true)
public class PositionJob {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long pjId;//id
  @Column(nullable = false)
  private String pjName;//职位名

  private String pjWageStandard;//工薪标准

}
