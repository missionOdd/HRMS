package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.util.Set;

/**
 * @author mission
 * @date 2019/1/10 0010-16:27
 */
@Entity
@Table(name = "privilege")
//Lombok
@Data
@Accessors(chain = true)
public class Privilege {

  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long prId;// id
  @Column(nullable = false)
  private String pName;//权限名
  @Column(nullable = false)
  private String prHandler;// 处理
  @Column(nullable = false,columnDefinition = "int default 1")
  private Integer prLevel;//等级

  @OneToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH})
  @JoinColumn(name = "pr_parent")
  private Set<Privilege> prChildren;// 子类



}
