package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * @author mission
 * @date 2019/1/10 0010-16:20
 */
@Entity
@Table(name = "user")
//Lombok
@Data
@Accessors(chain =true)
public class User {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long uId;// id
  private String uName; //用户名
  private String upassword;//密码

  @Column(nullable = false,columnDefinition = "datetime DEFAULT CURRENT_TIMESTAMP")
  private LocalDateTime uCreateTime;//创建时间

  @OneToOne
  @JoinColumn(name = "em_id")
  private Employee employee; //档案

  @ManyToOne(cascade= {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.PERSIST})
  @JoinColumn(name = "role_id")
  private Role role; // 用户角色





}
