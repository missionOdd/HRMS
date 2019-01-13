package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;

/**
 * @author mission
 * @date 2019/1/10 0010-16:45
 */
@Entity
@Table(name = "organization")
//Lombok
@Data
@Accessors(chain = true)
public class Organization {

  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long orgId;//id
  @Column(nullable = false)
  private String fName;//一级结构名
  @Column(nullable = false)
  private String sName;//二级结构名
  @Column(nullable = false)
  private String tName;//三级结构名

  @Column(nullable = false)
  private Long tId;//三级结构id
}
