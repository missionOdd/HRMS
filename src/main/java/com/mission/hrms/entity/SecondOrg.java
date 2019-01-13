package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Set;

/**
 * @author mission
 * @date 2019/1/10 0010-16:32
 */
@Entity
@Table(name = "second_org")
//Lombok
@Data
@Accessors(chain = true)
public class SecondOrg {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long sId;//id
  @Column(nullable = false)
  private String sName;//机构名
  @OneToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH})
  @JoinColumn(name = "t_parent")
  private Set<ThirdOrg> thirdOrgs;//三级机构
}
