package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Set;

/**
 * @author mission
 * @date 2019/1/10 0010-16:32
 */
//jpa 注解
@Entity
@Table(name = "first_org")
//Lombok
 @Data
@Accessors(chain = true)
public class FirstOrg {

  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long fId;//id
  @Column(nullable = false)
  private String fName;//一级机构名
  @OneToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH},fetch = FetchType.LAZY)
  @JoinColumn(name = "s_parent")
  private Set<SecondOrg> secondOrgs;//二级机构
}
