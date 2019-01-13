package com.mission.hrms.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

/**
 * 薪酬发放单
 * @author mission
 * @date 2019/1/10 0010-17:11
 */
@Entity
@Table(name = "pay_bills")
//Lombok
@Data
@Accessors(chain = true)
public class PayBills {

  @Id
  @GeneratedValue(strategy =  GenerationType.IDENTITY)
  private Long pbId;  //id

  private Integer pbEmSum;  //人数
  private Double pbTotal;  //总额
  private Double pbRealTotal;  //实发金额
  private String pbRegistrant; //登记人

  @Column(columnDefinition = "datetime DEFAULT CURRENT_TIMESTAMP")
  private LocalDateTime pbCreateDate;  //登记时间

  @Column(nullable = false,columnDefinition = "int DEFAULT 0")
  private Integer pbState;  //状态,未支付0,已支付1

  @OneToMany(cascade = {CascadeType.PERSIST,CascadeType.MERGE,CascadeType.REFRESH},fetch = FetchType.LAZY)
  @JoinColumn(name = "pb_id")
  private Set<Wage> wages;//各个工单

  @OneToOne
  @JoinColumn(name = "org_id")
  private Organization org  ;  //机构

}
