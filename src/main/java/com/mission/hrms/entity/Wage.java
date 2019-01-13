package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * @author mission
 * @date 2019/1/10 0010-17:07
 */
@Entity
@Table(name = "wage")
//Lombok
@Data
@Accessors(chain =true)
public class Wage {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long wId;  //id
  @Column(nullable = false)
  private Long wsNum;  //工薪标准编号
  private Double wReward;  //奖励金
  private Double wFine; //应扣金额
  private Double wTotal;  //总额
  @Column(nullable = false,columnDefinition = "int DEFAULT 0")
  private Integer wState; //状态
  @Column(nullable = false,columnDefinition = "datetime DEFAULT CURRENT_TIMESTAMP")
  private LocalDateTime wCreateTime;//创建时间

  @OneToOne
  @JoinColumn(name = "em_id")
  private Employee employee;  //员工


}
