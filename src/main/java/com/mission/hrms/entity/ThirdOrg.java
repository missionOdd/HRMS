package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;

/**
 * @author mission
 * @date 2019/1/10 0010-16:36
 */
@Entity
@Table(name = "third_org")
//Lombok
@Data
@Accessors(chain = true)
public class ThirdOrg {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long tId;//id
  @Column(nullable = false)
  private String tName;//机构名
}
