package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * @author mission
 * @date 2019/1/10 0010-16:55
 */
@Entity
@Table(name = "position")
//Lombok
@Data
@Accessors(chain = true)
public class Position {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long pId;//id
  @NotNull(message = "职业分类不能为空")
  @Column(nullable = false)
  private String pType; //职业分类
  @NotNull(message = "职位不能为空")
  @Column(nullable = false)
  private String pJob;  //职位

  private String pWageStandard;  //工薪标准编号

  private String pTitle;//职称
}
