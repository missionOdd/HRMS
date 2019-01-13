package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * @author mission
 * @date 2019/1/10 0010-16:49
 */
@Entity
@Table(name = "wage_standard")
//Lombok
@Data
@Accessors(chain =true)
public class WageStandard {
  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long wsId;//id
  @Column(nullable = false)
  private Long wsNum;//工薪标准编号
  @Column(nullable = false)
  private String wsName; //工薪标准名称
  @NotNull(message = "基本工资不能为空")
  @Column(nullable = false)
  private Double wsBaseWage; //基本工资
  private String wsProducer; //制定人
  @Column(nullable = false)
  private String wsRegistrant;//登记人
  @Column(nullable = false,columnDefinition = "datetime DEFAULT CURRENT_TIMESTAMP")
  private LocalDateTime wsCreateTime;//登记时间
  @NotNull(message = "交通补助不能为空")
  @Column(columnDefinition = "decimal(18,2) DEFAULT 0.00")
  private Double wsTravelAllowance;  //交通补助

  @Column(columnDefinition = "decimal(18,2) DEFAULT 0.00")
  @NotNull(message = "午餐补助不能为空")
  private Double wsLunchAllowance;  //午餐补助
  @Column(columnDefinition = "decimal(18,2) DEFAULT 0.00")
  @NotNull(message = "通信补助不能为空")
  private Double wsCommunicationAllowance;  //通信补助
  @Column(columnDefinition = "decimal(18,2) DEFAULT 0.00")
  private Double wsEndowmentInsurance;  //养老保险
  @Column(columnDefinition = "decimal(18,2) DEFAULT 0.00")
  private Double wsHealthInsurance;  //医疗保险
  @Column(columnDefinition = "decimal(18,2) DEFAULT 0.00")
  private Double wsUnemployedInsurance;  //失业保险
  @Column(columnDefinition = "decimal(18,2) DEFAULT 0.00")
  private Double wsHousingFund;  //住房公积金
  private Double wsTotal;  //总额

}
